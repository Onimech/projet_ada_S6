with outils;
use outils;

package babysitter is
  -- Subtype T_AgeBS is integer range 16..99;

   ------definition des types---------------------------------------------------------------
   Type T_identite is record
      nom : t_mot := (others => ' ');
      prenom : t_mot := (others => ' ');
   end record;

   Type T_planning is array (T_jour range lundi..samedi, T_creneau) of T_mot;

   Type T_BS is record
      identite : T_identite;
      age : integer;
      plcours : T_planning := ((others => (others => (others => ' '))));
      plsuiv : T_planning := ((others => (others => (others => ' '))));
      argent_semaine : integer := 0;
      DM_depart : boolean:= false;
   end record;
   -----------------------------------------------------------------------------------------------

   -------definition de la liste-------------------------------------------------------------------
   Type T_cellB;
   Type T_PteurB is access T_cellB;
   Type T_cellB is record
      Val : T_BS;
      suiv : T_PteurB;
   end record;
   ---------------------------------------------------------------------------------------------------


   -----------sous programmes ---------------------------------------------------------------
   Procedure saisie_BS (BS : out T_BS; tete : in T_PteurB; DM_sortie : out boolean);
   Procedure Insertion_BS (BS : T_BS; tete : in out T_PteurB);
   function homonymieBS (tete: T_PteurB; id : T_identite) return boolean;
   Procedure Visu_BS (tete : T_PteurB);
   procedure Visu_Planning (P : T_planning);
   Function recherche_BS (BS_R : T_BS; tete : T_PteurB) return T_PteurB;
   Procedure saisie_identite (BS : out T_BS);
   -------------------------------------------------------------------------------------------------------------
end babysitter;

