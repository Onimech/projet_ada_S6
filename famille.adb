with ada.Text_IO, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;
package body famille is

   procedure visu_ABR (A : T_arbreF) is --affichage symétrique pour ordre alphabétique

   begin
      If A /= null then
         visu_ABR(A.Fg);

         put("Nom de Famille : ");
         put(A.famille.nomF); new_line;
         put("Nombre d'enfants");
         put(A.famille.NBE); new_line;
         for i in A.famille.ages'range loop
            put(A.famille.ages(i)); new_line;
         end loop;
         put("Babysitter précédent(e) :");
         put(A.famille.BSpred.Val.identite.prenom); put(A.famille.BSpred.Val.identite.nom); new_line;
         put("Facture en cours :");
         put(A.famille.facture);

         visu_ABR(A.Fd);
      end if;
      end visu_ABR;


   end famille;
