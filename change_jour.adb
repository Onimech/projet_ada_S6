--procedure de changement de jour
-- mise à jour des factures avec les gardes effectues dans la journee
with outils, ada.Text_IO, ada.Integer_Text_IO, babysitter, famille, tarifs;
use outils, ada.Text_IO, ada.Integer_Text_IO, babysitter, famille, tarifs;
package body change_jour is

   procedure changement_jour (J : in out T_jour; tete : T_PteurB; A : T_arbreF) is
      J_Veille : T_jour := J;
      F : T_mot;
      Famille : T_arbreF;
      tarif : integer;
      Paux : T_PteurB := tete;
      garde_prevue : boolean := false;

   begin
      If J = T_jour'last then
         J := T_jour'first;
      else
         J := T_jour'succ(J);
      end if;

      put("nous sommes maintenant "); put(T_jour'image(J)); new_line;
      -- gardes prévues
      if J /= dimanche then
      put_line("les gardes prévues sont :");
      While Paux /= null loop
         if Paux.Val.plcours(J,matin) /=  "                              "  or
           Paux.Val.plcours(J,aprem) /=  "                              " or
           Paux.Val.plcours(J,soir) /=  "                              " then
            garde_prevue := true;


            put(Paux.Val.identite.prenom); put(Paux.Val.identite.nom);  put(":"); new_line;
            If Paux.Val.plcours(J,matin) = Paux.Val.plcours(J,aprem) and Paux.Val.plcours(J,aprem) = Paux.Val.plcours(J,soir) then
               put("toute la jorunée avec "); put(Paux.Val.plcours(J,matin)); new_line;
            else

               if Paux.Val.plcours(J,matin) /=  "                              " then put("le matin chez les "); put(Paux.Val.plcours(J,matin)); new_line; end if;
               if Paux.Val.plcours(J,aprem) /=  "                              " then put("l'apres midi chez les "); put(Paux.Val.plcours(J,aprem)); new_line; end if;
               if Paux.Val.plcours(J,soir) /=  "                              " then put("le soir chez les "); put(Paux.Val.plcours(J,soir)); new_line; end if;


            end if;
         end if;
         Paux := Paux.suiv;
      end loop;
      if garde_prevue = false then put_line("pas de gardes prévues aujourd'hui");
      end if;
         else put("pas de garde prévues, nous sommes dimanche"); new_line; end if;
      if J_Veille /= dimanche then
         put_line("Factures de la veille :");
         Paux := tete;
         While Paux /= null loop
            Tarif := 0;
            -- à chaque changement de babysitter, tarif = 0

            for i in T_creneau'range loop

               if Paux.Val.plcours(J_Veille, i) /= "                              " then
                  F := Paux.Val.plcours(J_Veille, i);
                  Famille :=  famille_pointe(A,F);
                  tarif := tarif + tarif_garde(famille.famille, i);

               end if;

            end loop;


            if tarif /= 0 then
               put(famille.famille.nomF); put("doit"); put(tarif); put(" euros à "); put(Paux.Val.identite.prenom);put(Paux.Val.identite.nom); new_line;
               --maj_argent

            end if;
            Paux := Paux.suiv;
         end loop;
      else put("pas de tarifs de la veille, il n'y a pas de garde le dimanche"); new_line; end if;

      end changement_jour;


   end change_jour;
