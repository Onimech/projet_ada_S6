with outils, famille, babysitter;
use outils, famille, babysitter;

package change_jour is

   ----procedures------------------------------------------------------------------------------------
   procedure changement_jour (J : in out T_jour; tete : in out T_PteurB; A : in out T_arbreF);
   procedure MAJ_planning (BS : in out T_PteurB);
   procedure fact_globales (Fam : T_arbreF);
   procedure montants_du (BS : T_PteurB);
   procedure MAJ_nb_gardes (BS : in out T_PteurB);
   procedure remise_zero_BS (tete : in out T_PteurB);
      procedure remise_zero_F (A : in out T_arbreF);
   --------------------------------------------------------------------------------------------------

end change_jour;
