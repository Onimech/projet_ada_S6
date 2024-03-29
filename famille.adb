with ada.Text_IO, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;
package body famille is

   -------------visualisation de l'arbre des familles------------------------------------------------
   procedure visu_ABR (A : T_arbreF) is --affichage sym�trique pour ordre alphab�tique

   begin
      If A /= null then
         put("Nom de Famille : ");
         put(A.famille.nomF); new_line;
         put("Nombre d'enfants : ");
         put(A.famille.NBE,2); new_line;
         put("Age(s) :");
         for i in A.famille.ages'range loop
            if A.famille.Ages(i) /= 0 then
               put(A.famille.ages(i),4);
            end if;
         end loop; new_line;
         put("Babysitter pr�c�dent(e) : ");
         if A.famille.BSpred /= null then
            put(A.famille.BSpred.Val.identite.prenom); put(A.famille.BSpred.Val.identite.nom); new_line;
         else put("pas de baby-sitter precedente"); New_Line;
         end if;
         put("Facture en cours :");
         put(A.famille.facture,2);
         put(" euros");
         New_Line; New_Line;
         visu_ABR(A.Fg);
         visu_ABR(A.Fd);
      end if;
   end visu_ABR;
   --------------------------------------------------------------------------------------------------


   ----------ajout d'une famille dans l'arbre--------------------------------------------------------
   Procedure ajout_ABR (A : in out T_arbreF; F : in out T_famille) is
   begin

      If A = null then
         A := new T_noeudF'(F, null, null);
      else
         if F.nomF > A.famille.nomF then
            ajout_ABR(A.Fd, F);
         elsif F.nomF < A.famille.nomF then
            ajout_ABR(A.Fg, F);
         else
            put("Nom de famille deja existant, incription dans le registre sous le nom de ");
            for i in F.nomF'range loop
               if F.nomF(i)=' ' then F.nomF(i) :='2';
                  exit;
               end if;
            end loop;
            put(F.nomF); New_Line;
            ajout_ABR(A.fd, F);
         end if;
      end if;
   end ajout_ABR;
   --------------------------------------------------------------------------------------------------

   -------------saisie d'une famille-----------------------------------------------------------------
   Procedure saisie_famille (F : out T_famille) is
      k : integer;

   begin
      F.nomF := (others =>' '); f.ages := (others => 0);
      put("Nom de la famille : "); get_line(F.nomF,k); F.nomF:=unification(F.nomF); New_Line;
      put("Combien d'enfants dans la famille? "); saisie_NBE(F.NBE);
      for i in 1..F.NBE loop
         saisie_age_E(F.ages(i));
      end loop;

   end saisie_famille;
   --------------------------------------------------------------------------------------------------

   ---------------fonction qui associe un nom saisi � une famille------------------------------------
   function famille_pointe (A : T_arbreF; nom : T_mot) return T_arbreF is

   Begin
      If A /= null then
         if A.famille.nomF = nom then
            return (A);
         elsif A.famille.nomF<nom then
            return(famille_pointe(A.fd, nom));
         else
            return(famille_pointe(A.fg,nom));
         end if;
      else
         return null;
      end if;




   end famille_pointe;
   --------------------------------------------------------------------------------------------------


   -----------------fonction pour savoir si il y a au moins un enfant de moins de 7 ans dans une famille-----
   function moins7 (fam : T_famille) return boolean is
   begin
      for i in 1..Fam.NBE loop
         if Fam.ages(i) < 7 then return true;
         end if;
      end loop;
      return false;
   end moins7;
   --------------------------------------------------------------------------------------------------


   ----- supprime la famille-------------------------------------------------------------------------
   procedure supprime (fam : T_famille; Familles : in out T_arbreF) is
   begin
      if familles /= null then
         if fam.nomF < familles.famille.nomF then supprime(fam,Familles.Fg);
         elsif fam.nomF>familles.famille.nomF then supprime(fam,Familles.Fd);
         else
            if Familles.fg = null then
               Familles := Familles.fd;
            elsif FamilleS.Fd = null then
               familles:= Familles.Fg;
            else
               traite_max(familles.Fg, familles.famille);
            end if;
         end if;
      end if;
   end supprime;

   procedure traite_max (A : in out T_arbreF; max : out T_famille) is
   begin
      if A.fd = null then
         max := A.famille;
         A := A.fg;
      else
         traite_max(A.fd, max);
      end if;
   end traite_max;
   --------------------------------------------------------------------------------------------------


    ----choix de la famille--------------------------------------------------------------------------
   procedure choix_famille (Fam: out T_arbreF; F : T_arbreF ) is
      k : Integer;
      nom : t_mot :=' '&(2..30=>' ');

   begin
      Put("Nom de la famille : ");
      Get_Line(nom,k);
      nom := unification(nom);
      Fam := famille_pointe(F, nom);
   end choix_famille;
   --------------------------------------------------------------------------------------------------




end famille;
