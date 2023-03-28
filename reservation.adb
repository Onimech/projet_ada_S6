with outils, babysitter, famille, ada.Text_IO, ada.Integer_Text_IO;
use outils, babysitter, famille, ada.Text_IO, ada.Integer_Text_IO;


Package body reservation is

   -------------------procedure pour choisir le jour et le creneau de la reservation --------------------------------------------------------
   PROCEDURE Choix_Jour_Creneau (C : OUT T_Creneau; J : OUT T_Jour) IS

   BEGIN
      Put_line("Les r�servations sont possibles que pour la semaine prochaine");
      Put("Pour quel jour souhaitez vous r�server une garde ? "); saisie_jour(J); new_line;
      Put("Pour quel cr�neau souhaitez vous r�server une garde? Il est possible de r�server pour : matin, aprem ou soir"); saisie_creneau(C); new_line;
   END Choix_Jour_Creneau;
   ------------------------------------------------------------------------------------------------------------


   -----------------------------------------------------------------------------------------------------------------
   Function pas_reserve (fam : T_mot ; tete : T_PteurB; C : T_creneau; J : T_jour) return boolean is

   Begin
      if tete /= null then
         if tete.val.plsuiv(J,C) = fam then
            return (false);
         else
            return(pas_reserve(fam,tete.suiv,C,J));
         end if;
      end if;
      return(true);
   end pas_reserve;
   ----------------------------------------------------------------------------------------------------------------------------------------------------


   ---------------fonction qui v�rifie que la bs est majeure etc si ya des enfants de moins 3--------------------------------------------------------
   function verif_ageBS (BS : T_PteurB; F : T_famille) return boolean is
      ok : Boolean:= True;

   begin
      if BS.Val.age > 18 then
         for i in F.ages'range loop
            if F.ages(i) < 3 then ok:= False;
            end if;
         end loop;
      end if;

      if ok then return true;
      else return false;
      end if;
   end verif_agebs;
   -------------------------------------------------------------------------------------------------------------------------------------------------

   --------------------verfication que la BS est disponible sur le creneau -------------------------------------------------------------------------------
   function verif_dispo (BS : T_PteurB; C : T_creneau; J : T_jour) return boolean is
   Begin
      If BS.Val.plsuiv(J,C) = "                              " then
         return true;
      else return false;
      end if;

   end verif_dispo;
   ------------------------------------------------------------------------------------------------------------------------------------



   procedure resa_garde (tete : in out T_PteurB; F: T_arbreF) is
      k,min : Integer;
      C : T_creneau; --creneau demande
      J : T_jour; --jour demande
      choix : Character;
      Fam : T_arbreF;
      BS_choisi : T_PteurB;
      nom : T_mot:=' '&(2..30=>' ');
      aux : T_PteurB :=tete;
      ident : T_identite;
      BS_R :T_BS;

   begin
      --saisie du nom de la famille
      Put("Quel est le nom de la famille qui souhaites reserver ? "); Get_Line(nom,k);
      nom := unification(nom);

      Fam := famille_pointe(F, nom);
      if fam /=null then
         --saisie du creaneau et du jour
         Choix_Jour_Creneau(C,J);
         --verification que la famille n'a pas deja reserve sur ce creneau
         if pas_reserve(nom, tete, C, J) then
            loop
               Put_Line("Vous pouvez : (1) Demander � avoir le/la Baby-sitter pr�cedent(e), (2) Demander un/e Baby-Sitter, (3) Ne pas avoir de pr�f�rence ");
               Put("Votre choix ? "); get(choix); Skip_Line;
               case choix is
               when '1' =>
                  ---verification qu'il existe bien un bs precedente-----------
                  if fam.famille.BSpred = null then
                     Put_Line("Vous n'avez pas de baby-sitter pr�cedent(e), veuillez faire un autre choix");
                  else
                     --verification que la BS est dispo et pas de probleme pour lage
                     if verif_dispo(fam.famille.BSpred, C, J) and then verif_ageBS(fam.famille.BSpred,fam.famille) then
                        while aux /= null loop
                           if aux = fam.famille.BSpred then
                              aux.Val.plsuiv(J,C) := fam.famille.nomF;
                              aux.Val.nb_garde := aux.Val.nb_garde +1;
                              fam.famille.BSpred := BS_choisi;
                           end if;
                           aux := aux.suiv;
                        end loop;
                        Put("La r�servation est valid�e avec ");

                     elsif verif_dispo(tete, C, J)= false then
                        put ("La/le Babysitter choisi n'est pas disponible, le choix va �tre attribue � la personne avec le moins de garde");
                        min := min_garde(tete);
                        BS_choisi := moins_garde(tete,min);
                        while aux /= null loop
                           if aux = BS_choisi then
                              aux.Val.plsuiv(J,C) := fam.famille.nomF;
                              aux.Val.nb_garde := aux.Val.nb_garde +1;
                              fam.famille.BSpred := BS_choisi;
                           end if;
                           aux := aux.suiv;
                        end loop;

                     else
                        put ("La/le Babysitter choisi n'est pas en mesure d'assurer la garde, le choix va �tre attribue � la personne avec le moins de garde");
                        min := min_garde(tete);
                        BS_choisi := moins_garde(tete,min);
                        while aux /= null loop
                           if aux = BS_choisi then
                              aux.Val.plsuiv(J,C) := fam.famille.nomF;
                              aux.Val.nb_garde := aux.Val.nb_garde +1;
                              fam.famille.BSpred := BS_choisi;
                           end if;
                           aux := aux.suiv;
                        end loop;
                     end if;
                  end if;

               when '2' =>
                  loop
                  Put_Line("Vous pouvez choisir parmis les Baby-Sitters suivants : ");
                  BS_dispo(tete, C,J,F.famille);
                  saisie_identite(BS_R);
                     BS_choisi:=recherche_BS(BS_R, tete);
                     if BS_choisi /= null and then verif_dispo(BS_choisi, C,J) then
                        exit;
                     else
                        Put_Line("La/Le baby-sitter demand�e n'est pas le registre, veuillez r�essayer");
                     end if;
                  end loop;
                  BS_choisi.Val.plsuiv(J,C) := fam.famille.nomF;
                  BS_choisi.Val.nb_garde := aux.Val.nb_garde +1;
                  put("La r�servation avec "); put(BS_choisi.Val.identite.prenom); put("est valid�e. "); New_Line;
                  exit;

               when '3' =>
                  min := min_garde(tete);
                  BS_choisi := moins_garde(tete,min);
                  while aux /= null loop
                     if aux = BS_choisi then
                        aux.Val.plsuiv(J,C) := fam.famille.nomF;
                        aux.Val.nb_garde := aux.Val.nb_garde +1;
                        fam.famille.BSpred := BS_choisi;
                     end if;
                     aux := aux.suiv;
                  end loop;
                  Put("La garde sera assur�e par "); put(fam.famille.BSpred.Val.identite.nom); put(fam.famille.BSpred.Val.identite.prenom); New_Line;
               when others => Put_Line("Ce choix n'est pas propos�, veuillez recommencez ");
               end case;
            end loop;

         else
            Put_Line("Vous avez d�j� r�serv� une garde pour ce cr�neau et ce jour, la r�servation n'a pas pu aboutir");
         end if;
      else
         put("Il n'existe pas de famille � ce nom, la reservation n'a pas pu aboutir"); New_Line;
      end if;

   end resa_garde;



   procedure BS_dispo (tete : T_PteurB; C : T_creneau; J : T_jour; F : T_famille) is


   begin
      if tete /= null then

         --Put_Line("Aucun(e) Baby-Sitter disponible pour ce cr�neau");
         if verif_dispo(tete, C, J) then -- remettre verif age BS
         put(tete.Val.identite.nom); put(" "); put(tete.Val.identite.prenom);
         end if;
         BS_dispo(tete.suiv,C,J,F);
      end if;

   end BS_dispo;







end reservation;
