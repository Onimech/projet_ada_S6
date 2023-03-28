with ada.Text_IO, ada.Integer_Text_IO, ada.Characters.Handling;
use ada.Text_IO, ada.Integer_Text_IO, ada.Characters.Handling;
package body outils is


   -------------------saisie d'un jour--------------------------------------------------------
   procedure saisie_jour (J : out T_jour) is

      S : string(1..9);
      k : integer;
   begin

      loop
         begin
            put_line("Saisssez un jour : "); get_line(S,k);
            J := T_jour'value(s(1..k));
            exit;
         exception
            when Constraint_Error => put_line("Erreur de saisie, ressayez");
         end;
      end loop;
   end saisie_jour;
   -----------------------------------------------------------------------------------------------------------------

   --------------------saisie creneau ---------------------------------------------------------------------------------
   procedure saisie_creneau (C : out T_creneau) is
      S : string(1..6);
      k : integer;

   begin

      loop
         begin
            put_line("Saisssez un creneau : "); get_line(S,k);
            C := T_creneau'value(s(1..k));
            exit;
         exception
            when Constraint_Error => put_line("Erreur de saisie, ressayez");
         end;
      end loop;
   end saisie_creneau;
   -----------------------------------------------------------------------------------------------------------------------------


   ---------------saisie du nombre d'enfants-----------------------------------------------------------
   procedure saisie_NBE (N : out T_NBE) is

   Begin
      loop
         begin
            put_line("Saisissez un nombre d'enfants compris entre 1 et 8 :"); get(N); skip_line;
            exit;
         exception
            when data_error => skip_line; put("Erreur de saisie, veuillez ressayer");
            When Constraint_Error => skip_line; put("Erreur de saisie, veuillez ressayer");
         end;
      end loop;
   end saisie_NBE;
   -----------------------------------------------------------------------------------------------------------------------------------

   -------------saisie de lage de la bs------------------------------------------------------------------------------------------------
   Procedure saisie_age_BS (A : out T_AgeBS) is
   begin
      loop
         Begin

            Put_line("Saisissez âge Babysitter, ce dernier doit être minimum égal à 16 :"); get(A); skip_line;
            exit;
         exception
            when Data_Error => Skip_Line; Put("Erreur de saisie, veuillez ressayer");
            when Constraint_Error => Skip_Line; put("Erreur de saisie, veuillez ressayer");
         end;
      end loop;
   end saisie_age_BS;
   -------------------------------------------------------------------------------------------------------------------------------------

   ---------------------saisie de l'age d'un enfant -------------------------------------------------------------------------------------
   Procedure saisie_age_E (Age : out T_AgeE) is

   begin
      loop
         Begin
            Put_line("Saisissez l'âge de l'enfant, ce dernier doit être inférieur ou égal à 12 :"); get(Age); skip_line;
            exit;
         exception
            when Data_Error => Skip_Line; Put("Erreur de saisie, veuillez ressayer");
            when Constraint_Error => Skip_Line; put("Erreur de saisie, veuillez ressayer");
         end;
      end loop;
   end saisie_age_E;
   ---------------------------------------------------------------------------------------------------------------------------------------


--------------fonction qui unifie la saisie --------------------------------------------------------------------------
Function unification (mot : t_mot) return t_mot is
   mot_uni : t_mot;
begin
   mot_uni := To_Lower(mot);
   mot_uni(mot_uni'first) := To_Upper(mot_uni(mot_uni'first));
   return(mot_uni);
end unification;
--------------------------------------------------------------------------------------------------------------------------------

end outils;
