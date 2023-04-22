with outils, babysitter, famille, ada.Text_IO, ada.Integer_Text_IO;
use outils, babysitter, famille, ada.Text_IO, ada.Integer_Text_IO;

package body tarifs is


   ---------------------procedure pour calculer le tarif d'une garde---------------------------------
   function tarif_garde (famille : T_famille; C : T_creneau) return integer is
      facture : integer;

   begin
      ---------calcul du tarif de base---------------------------------------------------------------
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

      ---surplus si ya plus d'un enfant--------------------------------------------------------------
      if famille.NBE >1 then
         for i in 2..Famille.NBE loop
            if Famille.ages(i) < 7 then facture := facture + 3;
            else
               facture := facture +2;
            end if;
         end loop;
      end if;
      return(facture);
   end tarif_garde;
   --------------------------------------------------------------------------------------------------


   procedure maj_factures(A : T_arbreF; Famille : T_famille; ajout : integer) is

   begin
      if A /= null then
         If A.famille.nomF = Famille.nomF then
            A.famille.facture :=  A.famille.facture + ajout;
         else


            maj_factures(A.Fg, Famille, ajout);
            maj_factures(A.Fd, Famille, ajout);
         end if;
      end if;



   end maj_factures;
   procedure maj_montants(tete : T_PteurB; BS : T_BS; ajout : integer) is

   begin
      if tete /= null then
         If tete.val.identite = BS.identite then
            tete.val.argent_semaine :=  tete.val.argent_semaine + ajout;
         else

            maj_montants(tete.suiv, BS, ajout);
         end if;

      end if;
   end maj_montants;


end tarifs;
