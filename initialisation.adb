with babysitter, outils, famille;
use babysitter, outils, famille;

package body initialisation is

   --------initialisation generale--------------------------------------------------------
   procedure initialisationG (tete:in out T_PteurB; racine: in out T_arbreF) is

   begin
      inibs(tete);
      iniF(racine);
   end initialisationG;
   ---------------------------------------------------------------------------------------

   -- baby-sitter---------------------------------------------------------------------------
   procedure inibs (tete : in out T_PteurB) is
      BS : T_BS;

   begin
      -----BS 1 ------------------------------------------------
      BS.identite.nom := "Alouette"&(9..30=>' ');
      BS.identite.prenom := "Marie"&(6..30=>' ');
      BS.age := 17;

      BS.plcours := (others => (others => (others => ' ' )));
      BS.plcours(lundi,soir):="Montalbano"&(11..30=>' ');
      BS.plcours(mercredi,matin):="Brunetti"&(9..30=>' ');
      BS.plcours(mercredi,aprem):="Brunetti"&(9..30=>' ');
      BS.plcours(jeudi,aprem):="Le floch"&(9..30=>' ');
      BS.plcours(samedi,soir):="Le floch"&(9..30=>' ');

      BS.plsuiv := (others => (others => (others => ' ' )));
      BS.plsuiv(mercredi,matin):="Brunetti"&(9..30=>' ');
      BS.plsuiv(mercredi,aprem):="Brunetti"&(9..30=>' ');
      BS.plsuiv(samedi,soir):="Le floch"&(9..30=>' ');

      BS.argent_semaine := 0;
      BS.DM_depart := false;
      BS.nb_garde:= 3;
      tete := new T_cellB'(BS, null);

      ----------------------------------------------------------

      ------BS 2 -----------------------------------------------
      tete.suiv := new T_cellB'(BS, null);
      BS.identite.nom := "Arlequin"&(9..30=>' ') ;
      BS.identite.prenom := "Marc"&(5..30=>' ') ;
      BS.age := 24;

      BS.plcours := (others => (others => (others => ' ' )));
      BS.plcours(mercredi,matin) := "Poirot"&(7..30=>' ');
      BS.plcours(mercredi,aprem) := "Poirot"&(7..30=>' ');
      BS.plcours(mercredi,soir) := "Poirot"&(7..30=>' ');
      BS.plcours(samedi,aprem) := "Burma"&(6..30=>' ');

      BS.plsuiv := (others => (others => (others => ' ' )));

      BS.argent_semaine := 0;
      BS.DM_depart := false;
      BS.nb_garde:= 0;
      tete.suiv := new T_cellB'(BS, null);

      ----------------------------------------------------------

      ------BS 3 -----------------------------------------------
      BS.identite.nom := "Bergeronnette"&(14..30=>' ') ;
      BS.identite.prenom := "Aline"&(6..30=>' ') ;
      BS.age := 35;

      BS.plcours := (others => (others => (others => ' ' )));
      BS.plsuiv := (others => (others => (others => ' ' )));
      BS.plsuiv(samedi,aprem) :="Poirot"&(7..30=>' ');

      BS.argent_semaine := 0;
      BS.DM_depart := false;
      BS.nb_garde:= 0; --1
      tete.suiv.suiv := new T_cellB'(BS, null);

      ----------------------------------------------------------

      ------BS 4 -----------------------------------------------
      BS.identite.nom := "Bergeronnette"&(14..30=>' ') ;
      BS.identite.prenom := "Bertrand"&(9..30=>' ') ;
      BS.age := 28;

      BS.plcours := (others => (others => (others => ' ' )));
      BS.plcours(mardi,soir):="Poirot"&(7..30=>' ');
      BS.plcours(vendredi,aprem):="Montalbano"&(11..30=>' ');
      BS.plcours(vendredi,soir):="Montalbano"&(11..30=>' ');
      BS.plcours(samedi,soir):="Rouletabille"&(13..30=>' ');

      BS.plsuiv := (others => (others => (others => ' ' )));
      BS.plsuiv(mardi,soir):="Poirot"&(7..30=>' ');
      BS.plsuiv(vendredi,soir):="Poirot"&(7..30=>' ');
      BS.plsuiv(samedi,soir):="Rouletabille"&(13..30=>' ');

      BS.argent_semaine := 0;
      BS.DM_depart := false;
      BS.nb_garde:= 3 ;
      tete.suiv.suiv.suiv := new T_cellB'(BS, null);

      ----------------------------------------------------------

      ------BS 5 -----------------------------------------------
      BS.identite.nom := "Epervier"&(9..30=>' ') ;
      BS.identite.prenom := "Charles"&(8..30=>' ') ;
      BS.age := 16;

      BS.plcours := (others => (others => (others => ' ' )));
      BS.plsuiv := (others => (others => (others => ' ' )));

      BS.argent_semaine := 0;
      BS.DM_depart := true;
      BS.nb_garde:= 0 ;
      tete.suiv.suiv.suiv.suiv := new T_cellB'(BS, null);

      ----------------------------------------------------------

      ------BS 6 -----------------------------------------------
      BS.identite.nom := "Loriot"&(7..30=>' ') ;
      BS.identite.prenom := "Juliette"&(9..30=>' ') ;
      BS.age := 21;

      BS.plcours := (others => (others => (others => ' ' )));
      BS.plsuiv := (others => (others => (others => ' ' )));
      BS.plsuiv(mercredi,aprem):="Montalbano"&(11..30=>' ');
      BS.plsuiv(mercredi,soir):="Montalbano"&(11..30=>' ');
      BS.plsuiv(vendredi,soir):="Le floch"&(9..30=>' ');
      BS.plsuiv(samedi,soir) := "Burma"&(6..30=>' ');

      BS.argent_semaine := 0;
      BS.DM_depart := false;
      BS.nb_garde:= 4 ;
      tete.suiv.suiv.suiv.suiv.suiv := new T_cellB'(BS, null);

      ----------------------------------------------------------
   end inibs;
   -------------------------------------------------------------------------------------------



   ----------initialisation des familles---------------------------------------------------------------
   procedure iniF (racine : in out T_arbreF) is

      famille : T_famille;

   begin
      --famille 1-----------------------------------------------
      famille.nomF :="Montalbano"&(11..30=>' ');
      famille.NBE := 2;
      famille.ages(famille.ages'first) := 5;
      famille.ages(famille.ages'first +1) :=10;
      racine := new T_noeudF'(famille, null, null);
      ------------------------------------------------------------

      --famille 2-----------------------------------------------
      famille.nomF :="Rouletabille"&(13..30=>' ');
      famille.NBE := 1;
      famille.ages(FAMILLE.AGES'first) := 9;
      racine.fd := new t_noeudF'(famille,null,null);
      ------------------------------------------------------------

      --famille 3-----------------------------------------------
      famille.nomF :="Burma"&(6..30=>' ');
      famille.NBE := 4;
      famille.ages(FAMILLE.AGES'first) := 2;
      famille.ages(FAMILLE.AGES'first +1) := 4;
      famille.ages(FAMILLE.AGES'first +2) := 8;
      famille.ages(FAMILLE.AGES'first +3) := 10;
      racine.fg := new t_noeudF'(famille,null,null);
      ------------------------------------------------------------

      --famille 4-----------------------------------------------
      famille.nomF :="Brunetti"&(9..30=>' ');
      famille.NBE := 3;
      famille.ages(FAMILLE.AGES'first) := 5;
      famille.ages(FAMILLE.AGES'first +1) := 7;
      famille.ages(FAMILLE.AGES'first +2) := 12;
      racine.fg.fg := new t_noeudF'(famille,null,null);
      ------------------------------------------------------------

      --famille 5-----------------------------------------------
      famille.nomF :="Poirot"&(7..30=>' ');
      famille.NBE := 5;
      famille.ages(FAMILLE.AGES'first) := 1;
      famille.ages(FAMILLE.AGES'first +1) := 3;
      famille.ages(FAMILLE.AGES'first +2) := 5;
      famille.ages(FAMILLE.AGES'first +3) := 7;
      famille.ages(FAMILLE.AGES'first +4) := 9;
      racine.fd.fg := new t_noeudF'(famille,null,null);
      ------------------------------------------------------------

      --famille 6-----------------------------------------------
      famille.nomF :="Le floch"&(9..30=>' ');
      famille.NBE := 3;
      famille.ages(FAMILLE.AGES'first) := 8;
      famille.ages(FAMILLE.AGES'first +1) := 9;
      famille.ages(FAMILLE.AGES'first +2) := 11;
      racine.fg.fd := new t_noeudF'(famille,null,null);
      ------------------------------------------------------------
   end iniF;
   -----------------------------------------------------------------------------
end initialisation;
