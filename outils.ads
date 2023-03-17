
Package outils is

   Subtype T_AgeBS is integer range 16..99;
   subtype T_NBE is integer range 1..8;

   Subtype T_mot is string(1..30);
   Type T_creneau is (matin, aprem, soir);
   Type T_jour is (lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche);

   procedure saisie_jour (J : out T_jour);
   procedure saisie_creneau (C : out T_creneau);
   procedure saisie_NBE (N : out T_NBE);
   procedure saisie_age_BS (A : out T_AgeBS);
end outils;
