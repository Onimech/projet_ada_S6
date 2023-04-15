with outils, babysitter, famille, ada.Text_IO;
use outils, babysitter, famille, ada.Text_IO;

package body tarifs is


   ---------------------procedure pour calculer le tarif d'une garde---------------------------
   procedure tarif_garde (facture : out Integer; famille : T_famille; C : T_creneau) is

   begin
      ---------calcul du tarif de base------------------------------------------
      if moins7(famille) then
         if C = matin then
            facture := 52;
         elsif C = aprem then
            facture := 78;
         else
            facture := 65;
         end if;
      else
         if C = matin then
            facture := 40;
         elsif C = aprem then
            facture := 60;
         else
            facture := 55;
         end if;
      end if;

      ---surplus si ya plus d'un enfant-----------------------------------------
      if famille.NBE >1 then
          for i in 2..Famille.NBE loop
            if Famille.ages(i) < 7 then facture := facture + 3;
            else
               facture := facture +2;
            end if;
         end loop;
      end if;
   end tarif_garde;
   ----------------------------------------------------------------------------------------------------------

end tarifs;
