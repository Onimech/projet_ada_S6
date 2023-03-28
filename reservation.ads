with outils, babysitter, famille, ada.Text_IO;
use outils, babysitter, famille, ada.Text_IO;

package reservation is

   PROCEDURE Choix_Jour_Creneau (C : OUT T_Creneau; J : OUT T_Jour);
   Function pas_reserve (fam : T_mot ; tete : T_PteurB; C : T_creneau; J : T_jour) return boolean;
   function verif_ageBS (BS : T_PteurB; F : T_famille) return boolean;
   function verif_dispo (BS : T_PteurB; C : T_creneau; J : T_jour) return boolean;
   procedure BS_dispo (tete : T_PteurB; C : T_creneau; J : T_jour; F : T_famille);
   procedure resa_garde (tete : in out T_PteurB; F: T_arbreF);
   end reservation;
