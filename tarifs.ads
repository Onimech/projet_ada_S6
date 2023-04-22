with outils, babysitter, famille, ada.Text_IO;
use outils, babysitter, famille, ada.Text_IO;

package tarifs is
   function tarif_garde (famille : T_famille; C : T_creneau) return integer;
   procedure maj_factures(A : T_arbreF; Famille : T_famille; ajout : integer);
   procedure maj_montants(tete : T_PteurB; BS : T_BS; ajout : integer);

end tarifs;
