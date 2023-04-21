with outils, famille, babysitter;
use outils, famille, babysitter;

package change_jour is
   procedure changement_jour (J : in out T_jour; tete : in out T_PteurB; A : T_arbreF);
   procedure MAJ_planning (BS : in out T_PteurB);
   procedure fact_globales (Fam : T_arbreF);
   procedure montants_du (BS : T_PteurB);

end change_jour;
