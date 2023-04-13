with outils, babysitter, famille, ada.Text_IO, ada.Integer_Text_IO;
use outils, babysitter, famille, ada.Text_IO, ada.Integer_Text_IO;


Package body reservation is

   -------------------procedure pour choisir le jour et le creneau de la reservation --------------------------------------------------------
   PROCEDURE Choix_Jour_Creneau (C : OUT T_Creneau; J : OUT T_Jour) IS

   BEGIN
      Put_line("Les réservations sont possibles que pour la semaine prochaine");
      Put("Pour quel jour souhaitez vous réserver une garde ? "); saisie_jour(J); new_line;
      Put("Pour quel créneau souhaitez vous réserver une garde? Il est possible de réserver pour : matin, aprem ou soir"); saisie_creneau(C); new_line;
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


   ---------------fonction qui vérifie que la bs est majeure etc si ya des enfants de moins 3--------------------------------------------------------
   function verif_ageBS (BS : T_PteurB; F : T_famille) return boolean is
      ok : Boolean:= True;

   begin
      if BS.Val.age < 18 then
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
      reattribution : boolean := false;

   begin
      --saisie du nom de la famille---------------------------------------------------------
      Put("Quel est le nom de la famille qui souhaites reserver ? "); Get_Line(nom,k);
      nom := unification(nom);
      ----------------------------------------------------------------------------------------

      Fam := famille_pointe(F, nom);


      if fam /=null then
         --saisie du creaneau et du jour
         Choix_Jour_Creneau(C,J);

         --verification que la famille n'a pas deja reserve sur ce creneau
         if pas_reserve(nom, tete, C, J) then
            loop
               Put_Line("Vous pouvez : (1) Demander à avoir le/la Baby-sitter précedent(e), (2) Demander un/e Baby-Sitter, (3) Ne pas avoir de préférence ");
               Put("Votre choix ? "); get(choix); Skip_Line;

               case choix is

               when '1' =>
                  ---verification qu'il existe bien un bs precedente-----------
                  if fam.famille.BSpred = null then
                     Put_Line("Vous n'avez pas de baby-sitter précedent(e), veuillez faire un autre choix");
                  else
                     --verification que la BS est dispo et pas de probleme pour
                     if verif_dispo(fam.famille.BSpred, C, J) then

                        BS_choisi := cherche_BS_pred(tete, fam);
                        Put("La réservation est validée avec "); put(BS_choisi.Val.identite.prenom); New_Line;
                     elsif verif_dispo(tete, C, J)= false then
                        put ("La/le Babysitter choisi n'est pas disponible, le choix va être attribue à la personne avec le moins de garde");
                        min := min_garde(tete);
                        BS_choisi := moins_garde(tete,min);
                        while aux /= null loop
                           if aux = BS_choisi then
                              aux.Val.plsuiv(J,C) := fam.famille.nomF;
                           end if;
                           aux := aux.suiv;
                        end loop;
                     end if;
                  end if;


                  -- choix de la BS ------------------------------------------------------------------------------------------
               when '2' =>
                  loop
                     Put_Line("Vous pouvez choisir parmis les Baby-Sitters suivants : ");
                     BS_dispo(tete, C,J,F.famille);
                     saisie_identite(BS_R);
                     BS_choisi:=recherche_BS(BS_R, tete);

                     if BS_choisi /= null and then verif_dispo(BS_choisi, C,J) then
                        if verif_ageBS(BS_choisi, fam.famille) then
                           exit;
                        else
                           put("La/Le baby-sitter est mineur(e) et ne peut pas s'occuper de cette garde, la garde va etre attribue a quelqu'un d'autre"); New_Line;
                           reattribution:= true;
                           exit;
                        end if ;
                     else
                        Put_Line("La/Le baby-sitter demandée n'est pas le registre ou n'est pas disponible, veuillez réessayer");
                     end if;
                  end loop;

                  if reattribution then
                     reattribution_BS(BS_choisi, tete,fam.famille, C, J);
                     enre_BS_choisi(BS_choisi, fam, J, C);

                  else
                     BS_choisi.Val.plsuiv(J,C) := fam.famille.nomF;
                     BS_choisi.Val.nb_garde := aux.Val.nb_garde +1;
                     put("La réservation avec "); put(BS_choisi.Val.identite.prenom); put("est validée. "); New_Line;
                     exit;
                  end if;
                  ----------------------------------------------------------------------------------------------------------


                  ----------attribution de la bs par la machine ----------------------------------------------------------------------------
                  when '3' =>
                     reattribution_BS(BS_choisi, tete,fam.famille, C, J);
                     enre_BS_choisi(BS_choisi, fam, J, C);
                  -------------------------------------------------------------------------------------------------------------


                  when others => Put_Line("Ce choix n'est pas proposé, veuillez recommencez ");
               end case;
            end loop;

         else
            Put_Line("Vous avez déjà réservé une garde pour ce créneau et ce jour, la réservation n'a pas pu aboutir");
         end if;
      else
         put("Il n'existe pas de famille à ce nom, la reservation n'a pas pu aboutir"); New_Line;
      end if;
   end resa_garde;



   procedure BS_dispo (tete : T_PteurB; C : T_creneau; J : T_jour; F : T_famille) is


   begin
      if tete /= null then
         if verif_dispo(tete, C, J) and then verif_ageBS(tete, F) then
            put(tete.Val.identite.nom); put(" "); put(tete.Val.identite.prenom);
         end if;
         BS_dispo(tete.suiv,C,J,F);
      end if;

   end BS_dispo;





   function cherche_BS_pred (tete : T_PteurB; nomF : T_arbreF ) return T_PteurB is

   begin
      if tete /= null then
         if nomF.famille.BSpred.Val.identite.nom = tete.Val.identite.nom and then nomF.famille.BSpred.Val.identite.prenom = tete.Val.identite.prenom then
            return tete;
         else
            if cherche_BS_pred(tete,nomF.Fg) /= null then
               return cherche_BS_pred(tete,nomF.Fg);
            else
               return cherche_BS_pred(tete,nomF.Fd);
            end if;
         end if;
      else
         return null;

      end if;
   end cherche_BS_pred;


   procedure reattribution_BS (BS_choisi : in out T_PteurB; Liste_BS : T_PteurB; Fam : T_famille; C : T_creneau; J : T_jour) is
      min : Integer;

   begin
      loop
         min := min_garde(Liste_BS);
         BS_choisi := moins_garde(Liste_BS,min);
         exit when verif_dispo(BS_choisi, C,J) and then verif_ageBS(BS_choisi, Fam) ;
      end loop;
      Put("La garde sera assurée par "); put(BS_choisi.Val.identite.nom); put(BS_choisi.Val.identite.prenom); New_Line;
   end reattribution_BS;




   procedure enre_BS_choisi (BS_choisi: T_PteurB; Fam : in out T_arbreF; J : T_jour ; C : T_creneau) is

   begin
      BS_choisi.Val.plsuiv(J,C) := fam.famille.nomF;
      BS_choisi.Val.nb_garde := BS_choisi.Val.nb_garde +1;
      put("La réservation avec "); put(BS_choisi.Val.identite.prenom); put("est validée. "); New_Line;
   end enre_BS_choisi;






end reservation;
