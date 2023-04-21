with outils, babysitter, famille, ada.Text_IO, tarifs, ada.Integer_Text_IO;
use outils, babysitter, famille, ada.Text_IO, tarifs, ada.Integer_Text_IO;
with outils, babysitter, famille, ada.Text_IO, tarifs, ada.Integer_Text_IO;


Package body reservation is

   -------------------procedure pour choisir le jour et le creneau de la reservation --------------------------------------------------------
   PROCEDURE Choix_Jour_Creneau (C : OUT T_Creneau; J : OUT T_Jour) IS

   BEGIN
      Put_Line("Pour quel jour ? Du lundi au samedi"); saisie_jour(J); new_line;
      Put_Line("Pour quel créneau ? Choix disponibles matin, aprem ou soir"); saisie_creneau(C); new_line;
   END Choix_Jour_Creneau;
   ------------------------------------------------------------------------------------------------------------


   -----------------------------------------------------------------------------------------------------------------
   Function pas_reserve (fam : T_arbreF ; tete : T_PteurB; C : T_creneau; J : T_jour) return boolean is

   Begin
      if tete /= null then
         if tete.val.plsuiv(J,C) = fam.famille.nomF then
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

   begin
      if BS.Val.age < 18 then
         for i in 1..F.NBE loop
            if F.ages(i) < 3 then return False;
            end if;
         end loop;
         return True;
      else
         return true;
      end if;

   end verif_agebs;
   -------------------------------------------------------------------------------------------------------------------------------------------------

   --------------------verfication que la BS est disponible sur le creneau -------------------------------------------------------------------------------
   function verif_dispo (BS : T_PteurB; C : T_creneau; J : T_jour) return boolean is
   Begin
      If BS.Val.plsuiv(J,C) = "                              " and then BS.val.DM_depart = false then
         return true;
      else return false;
      end if;

   end verif_dispo;
   ------------------------------------------------------------------------------------------------------------------------------------


   ------------------procedure qui permet la reservation d'une garde-----------------------------------------------
   procedure resa_garde (tete : in out T_PteurB; F: T_arbreF) is
      C : T_creneau; --creneau demande
      J : T_jour; --jour demande
      choix, choix2 : Character;
      Fam : T_arbreF;
      BS_choisi : T_PteurB;
      nom : T_mot:=' '&(2..30=>' ');
      aux : T_PteurB :=tete;
      ident : T_identite;
      BS_R :T_BS;
      reattribution : boolean := false;

   begin
      --saisie du nom de la famille---------------------------------------------------------
      Put("Quel est le nom de la famille qui souhaites reserver ? ");
      choix_famille (Fam,F);


      if fam /=null then
         --saisie du creaneau et du jour
         Put_line("Les réservations sont possibles que pour la semaine prochaine");
         Choix_Jour_Creneau(C,J);

         --verification que la famille n'a pas deja reserve sur ce creneau
         if pas_reserve(fam, tete, C, J) then
            loop
               Put_Line("Vous pouvez :");
               Put_Line("(1) Demander à avoir le/la Baby-sitter précedent(e)");
               Put_Line("(2) Demander un/e Baby-Sitter");
               Put_Line("(3) Ne pas avoir de préférence ");
               Put("Votre choix ? "); get(choix); Skip_Line;

               case choix is

                  when '1' =>
                     ---verification qu'il existe bien un bs precedente-----------
                     if fam.famille.BSpred = null then
                        Put_Line("Vous n'avez pas de baby-sitter précedent(e), le/la baby-sitter va être attribue automatiquement");
                        reattribution_BS(BS_choisi, tete,fam.famille, C, J);
                        enre_BS_choisi(BS_choisi, fam, J, C);

                     else
                        --verification que la BS est dispo------------------------------
                        if verif_dispo(fam.famille.BSpred, C, J) then
                           BS_choisi := cherche_BS_pred(tete, fam);
                           enre_BS_choisi(BS_choisi, fam, J,C);

                        else
                           put ("La/le Babysitter choisi n'est pas disponible, le/la baby-sitter va être attribue automatiquement");
                           reattribution_BS(BS_choisi, tete,fam.famille, C, J);
                           enre_BS_choisi(BS_choisi, fam, J, C);
                        end if;
                     end if;
                     exit;


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
                           Put_Line("La/Le baby-sitter demandée n'est pas le registre ou n'est pas disponible, la garde va etre attribue a quelqu'un d'autre");
                           reattribution:= true;
                           exit;
                        end if;
                     end loop;

                     if reattribution then
                        reattribution_BS(BS_choisi, tete,fam.famille, C, J);
                     end if;
                     enre_BS_choisi(BS_choisi, fam, J, C);
                     exit;
                     ----------------------------------------------------------------------------------------------------------


                     ----------attribution de la bs par la machine ----------------------------------------------------------------------------
                     when '3' =>
                     reattribution_BS(BS_choisi, tete,fam.famille, C, J);
                     enre_BS_choisi(BS_choisi, fam, J, C);
                     exit;
                     -------------------------------------------------------------------------------------------------------------


                     when others => Put_Line("Ce choix n'est pas proposé, veuillez recommencez ");
               end case;
            end loop;

            loop
               put("O- Reservation d'un autre creneau avec la/le meme Baby-sitter");New_Line;
               put("X- Sortir"); New_Line;
               Put_Line("Quel est votre choix ? ");
               get(choix2); Skip_Line;
               case choix2 is

               when 'x'|'X' => exit;
                  when 'o'|'O' =>
                  --saisie du creaneau et du jour
                  Choix_Jour_Creneau(C,J);

                  --verification que la famille n'a pas deja reserve sur ce creneau
                  if pas_reserve(fam, tete, C, J) then

                     -- choix de la BS ------------------------------------------------------------------------------------------
                     if BS_choisi /= null and then verif_dispo(BS_choisi, C,J) then
                        if verif_ageBS(BS_choisi, fam.famille) = false then
                           put("La/Le baby-sitter est mineur(e) et ne peut pas s'occuper de cette garde, la garde va etre attribue a quelqu'un d'autre"); New_Line;
                           reattribution:= true;
                        end if ;
                     else
                        Put_Line("La/Le baby-sitter demandée n'est pas le registre ou n'est pas disponible, la garde va etre attribue a quelqu'un d'autre");
                        reattribution:= true;
                     end if;

                     if reattribution then
                        reattribution_BS(BS_choisi, tete,fam.famille, C, J);
                     end if;
                     enre_BS_choisi(BS_choisi, fam, J, C);
                     ----------------------------------------------------------------------------------------------------------
                  else
                     Put_Line("Vous avez déjà réservé une garde pour ce créneau et ce jour, la réservation n'a pas pu aboutir");
                  end if;

               when others => Put_Line("Ce choix n'est pas propose, veuillez recommencer");
               end case;
            end loop;



         else
            Put_Line("Vous avez déjà réservé une garde pour ce créneau et ce jour, la réservation n'a pas pu aboutir");
         end if;
      else
         put("Il n'existe pas de famille à ce nom, la reservation n'a pas pu aboutir"); New_Line;
      end if;
   end resa_garde;
   ---------------------------------------------------------------------------------------------------------------------------


   --------------- procedure pour afficher tous les bs dispo pour le creneau et le jour et suivant l'age des enfants de la famille --------------------
   procedure BS_dispo (tete : T_PteurB; C : T_creneau; J : T_jour; F : T_famille) is


   begin
      if tete /= null then
         if verif_dispo(tete, C, J) then
            if verif_ageBS(tete, F) then
               put(tete.Val.identite.nom); put(" "); put(tete.Val.identite.prenom);
               New_Line;
            end if;

         end if;
         BS_dispo(tete.suiv,C,J,F);
      end if;

   end BS_dispo;
   ---------------------------------------------------------------------------------------------------------------------




   -----------------------------------fonction qui retourne la baby-sitter précédente------------------------
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
   -----------------------------------------------------------------------------------------------------------------------



   ---------------------------procedure qui attribue une BS selon le nombre de gardes et la position dans la liste ------------------------------
   procedure reattribution_BS (BS_choisi : in out T_PteurB; Liste_BS : T_PteurB; Fam : T_famille; C : T_creneau; J : T_jour) is
      min : Integer := 0;
      liste_aux : T_PteurB := Liste_BS;

   begin
      min := min_garde(Liste_BS);
      BS_choisi := moins_garde(Liste_aux,min);

      if verif_dispo(BS_choisi, C,J) and then verif_ageBS(BS_choisi, Fam) then
         Put("La garde sera assurée par "); put(BS_choisi.Val.identite.nom); put(BS_choisi.Val.identite.prenom); New_Line;
      else
         reattribution_BS(BS_choisi, BS_choisi.suiv, fam, c, j);
      end if;

   end reattribution_BS;
   -----------------------------------------------------------------------------------------------------------------------


   ------------procedure qui enregistre la garde-------------------------------------------------------------
   procedure enre_BS_choisi (BS_choisi: T_PteurB; Fam : in out T_arbreF; J : T_jour ; C : T_creneau) is
      fact : Integer := 0;

   begin
      BS_choisi.Val.plsuiv(J,C) := fam.famille.nomF;
      BS_choisi.Val.nb_garde := BS_choisi.Val.nb_garde +1;
      put("La réservation avec "); put(BS_choisi.Val.identite.prenom); put("est validée. "); New_Line;
      fact := tarif_garde(fam.famille, c);
      put("Le montant a regler pour cette garde sera "); put(fact,2); put(" euros"); New_Line;

   end enre_BS_choisi;
   --------------------------------------------------------------------------------------------------------------




   ---------visualisation du planning des gardes de la semaine en cours pour une famille -------------------------
   procedure visu_garde_fam_cours (F : T_famille; BS :T_PteurB; J : T_jour) is

   begin
      if  BS /= null then

         for i in T_jour range J..samedi loop
            for j in T_creneau'range loop
               if BS.Val.plcours(i,j) = F.nomF then
                  put(T_jour'image(i)); put(" "); put(T_creneau'image(j)); put(" :");
                  put(BS.Val.identite.nom);
                  put(BS.Val.identite.prenom);
                  New_Line;
               end if;
            end loop;
         end loop;

         visu_garde_fam_cours(F,BS.suiv, J);
      end if;

   end visu_garde_fam_cours;
   --------------------------------------------------------------------------------------------------------------




   --------visualisation du planning des gardes de la semaine à suivre pour une famille------------------------
   procedure visu_garde_fam_suiv (F : T_famille; BS :T_PteurB) is

   begin
      if  BS /= null then

         for i in T_jour range lundi..samedi loop
            for j in T_creneau'range loop
               if BS.Val.plsuiv(i,j) = F.nomF then
                  put(T_jour'image(i)); put(" "); put(T_creneau'image(j)); put(" :");
                  put(BS.Val.identite.nom);
                  put(BS.Val.identite.prenom);
                  New_Line;
               end if;
            end loop;
         end loop;

         visu_garde_fam_suiv(F,BS.suiv);
      end if;

   end visu_garde_fam_suiv;

   ------------------------------------------------------------------------------------------------------------------



   -- ================================================Annulation de gardes ======================================

   procedure annulation (ListeBS : in out T_PteurB; F : T_arbreF;  Jour : T_jour) is
      nom : T_mot:=' '&(2..30=>' ');
      fam : T_arbreF; -- famille qui souhaites annuler
      C : T_creneau; -- creneau a annuler
      J : T_jour; -- jour a annuler
      sem_cours : Boolean;
      choix:Character;

   begin
      --quelle famille ? ---
      Put("Quel est le nom de la famille qui souhaites annuler ? ");
      choix_famille (Fam,F);

      if fam /= null then
         --affichages des gardes
         affichages_gardes(fam, ListeBS, jour);

         --sausie du creneau et de la semaine
         loop
            put("Pour quelle semaine souhaitez vous annuler ?");New_Line;
            Put_Line("(1) Pour la semaine en cours");
            Put_Line("(2) Pour la semaine suivante");
            get(choix); Skip_Line;

            case choix is
               when '1' => sem_cours := true; exit;
                  when '2' => sem_cours := false; exit;
                  when others => Put_Line("Ce choix n'est pas propose veuillez recommencez");New_Line;
            end case;
         end loop;

         Put_line("L'annulation est possible que pour les jours à venir");
         Choix_Jour_Creneau(C,J);


         if sem_cours then
            if J > jour then

               if reserve(fam,ListeBS,sem_cours,C,J) then
                  enre_annulation(ListeBS, fam,sem_cours,j,c);
               else
                  Put_Line("Aucune garde n'est prevue pour ce jour et creneau l'annulation n'a pas pu aboutir");
               end if;
            else
               Put_Line("L'annulation pour un jour passe n'est pas possible, l'annulation n'a pas pu aboutir");
            end if;
         else --annulation pour la semaine suivante
            if reserve(fam, ListeBS, sem_cours, c, j)  then
               enre_annulation(ListeBS, fam,sem_cours,j,c);
            else
               Put_Line("Aucune garde n'est prevue pour ce jour et creneau l'annulation n'a pas pu aboutir");
            end if;
         end if;
      else
         Put_Line("La famille n'a pas ete trouvé dans le registre veuillez resssayer");
      end if;


   end annulation;
   ---------------------------------------------------------------------------------------------------------------------


   -------------enregistrement de l'annulation--------------------------------------------------------------------------
   procedure enre_annulation (ListeBS: in out T_PteurB; Fam : T_arbreF; sem_cours : Boolean; J : T_jour ; C : T_creneau) is
      fact : Integer := 0;

   begin
      if  ListeBS /= null then
         for jour in T_jour range lundi..samedi loop
            for creneau in T_creneau'range loop

               if sem_cours then
                  if ListeBS.Val.plcours(J,C) = fam.famille.nomF then
                     ListeBS.Val.plcours(j,C) := "                              ";
                     ListeBS.Val.nb_garde := ListeBS.Val.nb_garde -1;
                     put("La réservation avec "); put(ListeBS.Val.identite.prenom); put("est annulee. "); New_Line;
                  end if;
               else
                  if ListeBS.Val.plsuiv(J,C) = fam.famille.nomF then
                     ListeBS.Val.plsuiv(J,C) := "                              ";
                     ListeBS.Val.nb_garde := ListeBS.Val.nb_garde -1;
                     put("La réservation avec "); put(ListeBS.Val.identite.prenom); put("est annulee. "); New_Line;
                  end if;
               end if;

            end loop;
         end loop;
         enre_annulation(ListeBS.suiv, fam,  sem_cours, j, c);
      end if;
   end enre_annulation;
   ------------------------------------------------------------------------------------------------------------------------


   -------------------------verification q'une reservation est bien prevue----------------------------------------------------
   Function reserve (fam : T_arbreF ; tete : T_PteurB; sem_cours : Boolean; C : T_creneau; J : T_jour) return boolean is

   Begin
      if tete /= null then
         if sem_cours then
            if tete.val.plcours(J,C) = fam.famille.nomF then
               return (True);
            else
               return(reserve(fam,tete.suiv,sem_cours,C,J));
            end if;
         else
            if tete.val.plsuiv(J,C) = fam.famille.nomF then
               return (True);
            else
               return(reserve(fam,tete.suiv,sem_cours,C,J));
            end if;
         end if;
      end if;
      return(false);
   end reserve;
   -----------------------------------------------------------------------------------------------------------------------------


   -----------affichages des gardes prevue pour les deux semaines------------------------------------------------------
   procedure affichages_gardes (Fam : T_arbreF; ListeBS : T_PteurB; Jour : T_jour) is

   begin
      Put("Voici le plannning des gardes prevues pour la fin de la semaine"); New_Line;
      visu_garde_fam_cours(fam.famille, ListeBS, Jour);
      Put("Voici le plannning des gardes prevues pour la semaine prochaine"); New_Line;
      visu_garde_fam_suiv(fam.famille, ListeBS);
   end affichages_gardes;
   ----------------------------------------------------------------------------------------------------------------------

   ------------procedure qui supprime la famille -----------------------------------------------------------
   procedure supp_famille (Familles : in out  T_arbreF; ListesBS : in out T_PteurB; jour_actuel : T_jour) is
      Fam : T_arbreF;
      Facture : Integer := 0;

   begin
      choix_famille(Fam, Familles);
      facture := fam.famille.facture;
      put("La famille "); put(fam.famille.nomF); Put_Line("a bien ete supprimee");
      supprime(fam.famille,familles);
      supp_gardes(ListesBS,fam.famille,jour_actuel);

      put("La facture s'eleve a "); put(facture,2); put(" euro(s)."); New_Line;
   end supp_famille;
   -----------------------------------------------------------------------


   ---procedure qui supprime les gardes suite au depart d'une famille--------------
   procedure supp_gardes (ListesBS : in out T_PteurB; fam :T_famille; jour_actuel : T_jour) is
   begin
      if  ListesBS /= null then
         for jour in T_jour range jour_actuel..samedi loop
            for creneau in T_creneau'range loop
               if ListesBS.Val.plcours(jour,creneau) = fam.nomF then
                  ListesBS.Val.plcours(jour,creneau) := "                              ";
                  ListesBS.Val.nb_garde := ListesBS.Val.nb_garde -1;
               end if;
            end loop;
         end loop;
         for jour in T_jour range lundi..samedi loop
            for creneau in T_creneau'range loop
               if ListesBS.Val.plsuiv(jour,creneau) = fam.nomF then
                  ListesBS.Val.plsuiv(jour,creneau) := "                              ";
                  ListesBS.Val.nb_garde := ListesBS.Val.nb_garde -1;
               end if;
            end loop;
         end loop;
         supp_gardes(ListesBS.suiv, fam, jour_actuel);
      end if;
   end supp_gardes;
   ------------------------------------------------------------------------------------


end reservation;
