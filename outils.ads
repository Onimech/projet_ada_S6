
Package outils is

   ----definition des sous types---------------------------------------------------------------------
   Subtype T_AgeBS is integer range 16..99;
   subtype T_AgeE is integer range 0..12;
   subtype T_NBE is integer range 1..8;

   Subtype T_mot is string(1..30);
   Type T_creneau is (matin, aprem, soir);
   Type T_jour is (lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche);
   --------------------------------------------------------------------------------------------------

   ---------procedure--------------------------------------------------------------------------------
   procedure saisie_jour (J : out T_jour);
   procedure saisie_creneau (C : out T_creneau);
   procedure saisie_NBE (N : out T_NBE);
   procedure saisie_age_BS (A : out T_AgeBS);
   Procedure saisie_age_E (Age : out T_AgeE);
   --------------------------------------------------------------------------------------------------

   ------fonctions-----------------------------------------------------------------------------------
   Function unification (mot : t_mot) return t_mot;
   --------------------------------------------------------------------------------------------------

end outils;
