
with outils, ada.Text_IO, ada.Integer_Text_IO, babysitter, famille, tarifs;
use outils, ada.Text_IO, ada.Integer_Text_IO, babysitter, famille, tarifs;
package body change_jour is

   ------------procedure regroupant toutes les procedures necessaire au changement de jour-----------
   procedure changement_jour (J : in out T_jour; tete : in out T_PteurB; A : T_arbreF) is
      J_Veille : T_jour := J;
      F : T_mot;
      Famille : T_arbreF;
      tarif : integer;
      Paux : T_PteurB := tete;
      garde_prevue : boolean := false;

   begin
      ---passage au jour suivant avec rebouclage-----------------------------------------------------
      If J = T_jour'last then
         J := T_jour'first;
      else
         J := T_jour'succ(J);
      end if;

      put("Nous sommes "); put(T_jour'image(J)); new_line;

      -- affichage des gardes prévues----------------------------------------------------------------
      if J /= dimanche then
         put_line("Les gardes du jour sont :");
         While Paux /= null loop
            if Paux.Val.plcours(J,matin) /=  "                              "  or Paux.Val.plcours(J,aprem) /=  "                              " or Paux.Val.plcours(J,soir) /=  "                              " then
               garde_prevue := true;
               put(Paux.Val.identite.prenom); put(Paux.Val.identite.nom);

               If Paux.Val.plcours(J,matin) = Paux.Val.plcours(J,aprem) and Paux.Val.plcours(J,aprem) = Paux.Val.plcours(J,soir) then
                  put("toute la jorunée chez la famille "); put(Paux.Val.plcours(J,matin)); new_line;
               else
                  if Paux.Val.plcours(J,matin) /=  "                              " then put("le matin chez la famille "); put(Paux.Val.plcours(J,matin)); new_line; end if;
                  if Paux.Val.plcours(J,aprem) /=  "                              " then put("l'apres midi chez la famille "); put(Paux.Val.plcours(J,aprem)); new_line; end if;
                  if Paux.Val.plcours(J,soir) /=  "                              " then put("le soir chez la famille "); put(Paux.Val.plcours(J,soir)); new_line; end if;
               end if;
            end if;
            Paux := Paux.suiv;
         end loop;

         if garde_prevue = false then put_line("Il n'y a pas de gardes prévues aujourd'hui.");
         end if;
      else put("Il n'y a pas de garde prévues, nous sommes dimanche."); new_line;
      end if;

      ---affichages des factures---------------------------------------------------------------------
      if J_Veille /= dimanche then
         put_line("Factures de la veille :");
         Paux := tete;
         While Paux /= null loop
            Tarif := 0;-- a chaque changement de babysitter, tarif = 0

            for i in T_creneau'range loop
               if Paux.Val.plcours(J_Veille, i) /= "                              " then
                  F := Paux.Val.plcours(J_Veille, i);
                  Famille :=  famille_pointe(A,F);
                  tarif := tarif + tarif_garde(famille.famille, i);

                  Famille.famille.BSpred := paux;
               end if;

            end loop;


            if tarif /= 0 then
               put(famille.famille.nomF); put("doit "); put(tarif,2); put(" euros à "); put(Paux.Val.identite.prenom);put(Paux.Val.identite.nom); new_line;
               maj_factures(A, Famille.famille, tarif);
               maj_montants(tete, Paux.Val, tarif);

            end if;
            Paux := Paux.suiv;
         end loop;
      else put("Il n'y a pas eu de gardes hier, donc pas de factures"); new_line; end if;

      -----mise a jour des planning---
      if J = lundi then
         MAJ_planning(tete);
         Put_Line("Les plannings ont bien ete mis a jour");


         --affichage factures globales et montants du---
      elsif  J = dimanche then

         fact_globales(A);
         montants_du(tete);
         --suppression de toutes les baby-sitter ayant une demande de depart--
         suppression_BS(tete);
      end if;



   end changement_jour;
   --------------------------------------------------------------------------------------------------



   ----intervertir le planning de la semaine en cours et de la semaine suivante et met a jour le nb de gardes des BS---
   procedure MAJ_planning (BS : in out T_PteurB) is
   begin
      if BS /= null then
         MAJ_nb_gardes(BS);
         BS.Val.plcours := BS.Val.plsuiv;
         BS.Val.plsuiv := ((others => (others => (others => ' '))));
         MAJ_planning(BS.suiv);
      end if;
   end MAJ_planning;
   --------------------------------------------------------------------------------------------------

   ----------------mise à jour du nombre de gardes---------------------------------------------------
   procedure MAJ_nb_gardes (BS : in out T_PteurB)is
   begin

      if  BS /= null then
         for i in T_jour range lundi..samedi loop
            for j in T_creneau'range loop
               if BS.Val.plsuiv(i,j) /=  "                              "  then
                  BS.Val.nb_garde := BS.Val.nb_garde -1;

               end if;
            end loop;
         end loop;
         MAJ_nb_gardes(BS.suiv);
      end if;

   end MAJ_nb_gardes;
   --------------------------------------------------------------------------------------------------



   ------affichages des factures de la semaine des familles------------------------------------------
   procedure fact_globales (Fam : T_arbreF) is

   begin
      if Fam /= null then

         put("Famille "); put(Fam.famille.nomF); put(" : "); put(fam.famille.facture); Put_Line("euros. ");

         fact_globales(fam.Fg);
         fact_globales(fam.Fd);
      end if;
   end fact_globales;
   --------------------------------------------------------------------------------------------------


   ------affichages des montants du aux bs-----------------------------------------------------------
   procedure montants_du (BS : T_PteurB) is

   begin
      if BS/=null then
         if BS.Val.argent_semaine /= 0 then
            put(BS.Val.identite.prenom); put(BS.Val.identite.prenom); put(" : "); put(BS.Val.argent_semaine,2); Put_Line(" euros.");
         end if;
         montants_du(bs.suiv);
      end if;
   end montants_du;
   --------------------------------------------------------------------------------------------------




end change_jour;
