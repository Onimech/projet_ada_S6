with babysitter;
use babysitter;

package body initialisation is

   -- baby-sitter---------------------------------------------------------------------------
   procedure inibs (tete : T_PteurB) is

   begin
      -----BS 1 ------------------------------------------------
      tete.identite.nom := "Alouette"&(9..30=>' ') ;
      tete.identite.prenom := "Marie"&(6..30=>' ') ;
      tete.age := 17;
      tete.plcours := (others => (others => (others => ' ' )));
      tete.plsuiv := (others => (others => (others => ' ' )));
      tete.argent_semaine := 0;
      tete.DM_depart := false;
      ----------------------------------------------------------

      ------BS 2 -----------------------------------------------
      tete.suiv.identite.nom := "Arlequin"&(10..30=>' ') ;
      tete.suiv.identite.prenom := "Marc"&(5..30=>' ') ;
      tete.suiv.age := 24;
      tete.suiv.plcours := (others => (others => (others => ' ' )));
      tete.suiv.plsuiv := (others => (others => (others => ' ' )));
      tete.suiv.argent_semaine := 0;
      tete.suiv.DM_depart := false;
      ----------------------------------------------------------

      ------BS 3 -----------------------------------------------
      tete.suiv.suiv.identite.nom := "Bergeronnette"&(14..30=>' ') ;
      tete.suiv.suiv.identite.prenom := "Aline"&(6..30=>' ') ;
      tete.suiv.suiv.age := 35;
      tete.suiv.suiv.plcours := (others => (others => (others => ' ' )));
      tete.suiv.suiv.plsuiv := (others => (others => (others => ' ' )));
      tete.suiv.suiv.argent_semaine := 0;
      tete.suiv.suiv.DM_depart := false;
      ----------------------------------------------------------

      ------BS 4 -----------------------------------------------
      tete.suiv.suiv.suiv.identite.nom := "Bergeronnette"&(14..30=>' ') ;
      tete.suiv.suiv.suiv.identite.prenom := "Bertrand"&(8..30=>' ') ;
      tete.suiv.suiv.suiv.age := 28;
      tete.suiv.suiv.suiv.plcours := (others => (others => (others => ' ' )));
      tete.suiv.suiv.suiv.plsuiv := (others => (others => (others => ' ' )));
      tete.suiv.suiv.suiv.argent_semaine := 0;
      tete.suiv.suiv.suiv.DM_depart := false;
      ----------------------------------------------------------

      ------BS 5 -----------------------------------------------
      tete.suiv.suiv.suiv.suiv.identite.nom := "Epervier"&(9..30=>' ') ;
      tete.suiv.suiv.suiv.suiv.identite.prenom := "Charles"&(8..30=>' ') ;
      tete.suiv.suiv.suiv.suiv.age := 16;
      tete.suiv.suiv.suiv.suiv.plcours := (others => (others => (others => ' ' )));
      tete.suiv.suiv.suiv.suiv.plsuiv := (others => (others => (others => ' ' )));
      tete.suiv.suiv.suiv.suiv.argent_semaine := 0;
      tete.suiv.suiv.suiv.suiv.DM_depart := true;
      ----------------------------------------------------------

      ------BS 6 -----------------------------------------------
      tete.suiv.suiv.suiv.suiv.suiv.identite.nom := "Loriot"&(7..30=>' ') ;
      tete.suiv.suiv.suiv.suiv.suiv.identite.prenom := "Juliette"&(9..30=>' ') ;
      tete.suiv.suiv.suiv.suiv.suiv.age := 21;
      tete.suiv.suiv.suiv.suiv.suiv.plcours := (others => (others => (others => ' ' )));
      tete.suiv.suiv.suiv.suiv.suiv.plsuiv := (others => (others => (others => ' ' )));
      tete.suiv.suiv.suiv.suiv.suiv.argent_semaine := 0;
      tete.suiv.suiv.suiv.suiv.suiv.DM_depart := false;
      ----------------------------------------------------------
      
      procedure iniF (racine : in out T_noeudF) is
   
   famille := T_famille;
   
   begin
   --famille 1-----------------------------------------------
   famille.nomF :="Montalbano"&(11..30=>' ');
   famille.NBE := 2;
   famille.ages(T_ageE'first) := 5;
   familles.ages(T_ageE'first +1) :=10;
   ------------------------------------------------------------_
   
   
   

   end inibs;

  

--famille 2-----------------------------------------------
   famille.nomF :="Rouletabille"&(13..30=>' ');
   famille.NBE := 1;
   famille.ages(T_ageE'first) := 9;
   racine.fd := new t_noeudF'(famille,null,null);
    ------------------------------------------------------------_
   
   --famille 3-----------------------------------------------
   famille.nomF :="Burma"&(6..30=>' ');
   famille.NBE := 4;
   famille.ages(T_ageE'first) := 2;
   famille.ages(T_ageE'first +1) := 4;
   famille.ages(T_ageE'first +2) := 8;
   famille.ages(T_ageE'first +3) := 10;
   racine.fg := new t_noeudF'(famille,null,null);
    ------------------------------------------------------------_
   
   --famille 4-----------------------------------------------
   famille.nomF :="Brunetti"&(9..30=>' ');
   famille.NBE := 3;
   famille.ages(T_ageE'first) := 5;
   famille.ages(T_ageE'first +1) := 7;
   famille.ages(T_ageE'first +2) := 12;
   racine.fg.fg := new t_noeudF'(famille,null,null);
    ------------------------------------------------------------_
   
   --famille 5-----------------------------------------------
   famille.nomF :="Poirot"&(7..30=>' ');
   famille.NBE := 5;
   famille.ages(T_ageE'first) := 1;
   famille.ages(T_ageE'first +1) := 3;
   famille.ages(T_ageE'first +2) := 5;
   famille.ages(T_ageE'first +3) := 7;
   famille.ages(T_ageE'first +4) := 9;
   racine.fd.fg := new t_noeudF'(famille,null,null);
    ------------------------------------------------------------_
   
   --famille 6-----------------------------------------------
   famille.nomF :="Le Floch"&(9..30=>' ');
   famille.NBE := 3;
   famille.ages(T_ageE'first) := 8;
   famille.ages(T_ageE'first +1) := 9;
   famille.ages(T_ageE'first +2) := 11;
   racine.fg.fd := new t_noeudF'(famille,null,null);
    ------------------------------------------------------------_




end initialisation;
