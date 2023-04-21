with outils, babysitter;
use outils, babysitter;

Package famille is

   ---- definition sous type et arbres---------------------------------------------------------------
   subtype T_NBE is integer range 1..8;
   subtype AgeE is integer range 0..12;


   Type T_ageE is array (T_NBE) of AgeE;

   Type T_famille is record
      nomF : T_mot:=(others =>' ');
      NBE : T_NBE;
      ages : T_ageE := (others => 0);
      BSpred : T_PteurB := null;
      facture : integer := 0;
   end record;

   Type T_noeudF;
   Type T_arbreF is access T_noeudF;
   Type T_noeudF is record
      famille : T_famille;
      Fg, Fd : T_arbreF;
   end record;
   --------------------------------------------------------------------------------------------------


   -----procedures ----------------------------------------------------------------------------------
   procedure visu_ABR (A : T_arbreF);
   Procedure ajout_ABR (A : in out T_arbreF; F : in out T_famille);
   Procedure saisie_famille (F : out T_famille);
   procedure choix_famille (Fam: out T_arbreF; F : T_arbreF );
   procedure traite_max (A : in out T_arbreF; max : out T_famille);
   procedure supprime (fam : T_famille; Familles : in out T_arbreF);
   --------------------------------------------------------------------------------------------------

   ----functions-------------------------------------------------------------------------------------
   function famille_pointe (A : T_arbreF; nom : T_mot) return T_arbreF;
   function moins7 (fam : T_famille) return boolean;
   --------------------------------------------------------------------------------------------------


end famille;
