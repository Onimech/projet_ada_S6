with outils, babysitter;
use outils, babysitter;

Package famille is


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

   procedure visu_ABR (A : T_arbreF);
   Procedure ajout_ABR (A : in out T_arbreF; F : in out T_famille);
    Procedure saisie_famille (F : out T_famille);

end famille;
