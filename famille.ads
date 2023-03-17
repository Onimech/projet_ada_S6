with outils, babysitter;
use outils, babysitter;

Package famille is


   subtype T_NBE is integer range 1..8;


   Type T_ageE is array (T_NBE) of integer;

   Type T_famille is record
      nomF : T_mot;
      NBE : T_NBE;
      ages : T_ageE;
      BSpred : T_PteurB;
      facture : integer;
   end record;

   Type T_noeudF;
   Type T_arbreF is access T_noeudF;
   Type T_noeudF is record
      famille : T_famille;
      Fg, Fd : T_arbreF;
   end record;

procedure visu_ABR (A : T_arbreF);

end famille;
