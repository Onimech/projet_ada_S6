with outils;
use outils;

package babysitter is
   Subtype T_AgeBS is integer range 16..99;

   Type T_identite is record
      nom : t_mot;
      prenom : t_mot;
   end record;

   Type T_planning is array (T_jour range lundi..samedi, T_creneau) of T_mot;

   Type T_BS is record
      identite : T_identite;
      age : integer;
      plcours : T_planning;
      plsuiv : T_planning;
      argent_semaine : integer;
      DM_depart : boolean;
   end record;

   Type T_cellB;
   Type T_PteurB is access T_cellB;
   Type T_cellB is record
      Val : T_BS;
      suiv : T_PteurB;
   end record;


   Procedure saisie_BS (BS : out T_BS);
   function homonymieBS (tete: T_PteurB; id : T_identite) return boolean;
    Procedure Visu_BS (tete : T_PteurB);
   end babysitter;
