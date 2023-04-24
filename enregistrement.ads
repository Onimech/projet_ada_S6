with Sequential_IO, ada.Integer_Text_IO, ada.Text_IO, babysitter, famille, outils;
use babysitter,ada.Integer_Text_IO, ada.Text_IO, babysitter, famille, outils;

package enregistrement is

   package file_save_BS is new Sequential_IO(T_BS);
   use file_save_BS;

   package file_save_fam is new Sequential_IO(T_famille);
   use file_save_fam;

   package file_save_jour is new Sequential_IO(T_jour);
   use file_save_jour;

   procedure save_BS(BS : T_PteurB);
   procedure BF_fam;
   procedure save_fam(Fam: T_arbreF);
   procedure save_jour(J : T_jour);

   procedure recup_BS(BS: out T_PteurB);
   procedure recup_fam(Fam : out T_arbreF);
   procedure recup_jour(J : out T_jour);

end enregistrement;
