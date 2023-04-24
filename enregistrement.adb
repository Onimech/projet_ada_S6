with Sequential_IO, ada.Integer_Text_IO, ada.Text_IO, babysitter, famille, outils;
use babysitter,ada.Integer_Text_IO, ada.Text_IO, babysitter, famille, outils;

package body enregistrement is

   use file_save_fam, file_save_BS, file_save_fam, file_save_jour;

   --procedure pour sauvegarder--------------------------------------------------------
   procedure save_BS(BS : T_PteurB) is
      F : file_save_BS.File_Type;
      BSaux : T_PteurB := BS;

   begin
      Create(F,name=>"Babysitters");
      while BSaux /= null loop
         Write(F,BSaux.Val);
         BSaux := BSaux.suiv;
      end loop;
      close(F);
   end save_BS;


   procedure BF_Fam is
      F : file_save_fam.File_Type;
   begin
      Create(F,Name=>"Familles");
      Close(F);
   end BF_Fam;

   procedure save_fam(fam : T_arbreF) is
      F : file_save_fam.File_Type;
   begin
      if fam /= null then
         Open(F,append_File,Name=>"Familles");
         Write(F,fam.famille); New_Line;
         close(F);
         save_fam(fam.Fg);
         save_fam(fam.fd);
      end if;
   end save_fam;

   procedure save_jour(J : T_jour) is
      F:file_save_jour.File_Type;
   begin
      Create(F,name=>"Jour");
      Write(F, J);
      Close(F);
   end save_jour;

   ------------------------------------------------------------------------------------------

   --procedures pour recuperer---------------------------------------------------------------
   procedure recup_fam (Fam: out T_arbreF) is
      recup : T_famille;
      F : file_save_fam.File_Type;

   begin
      fam := null;
      Open(F,In_File, Name=>"Familles");

      while not End_Of_File(F) loop
         read(F,recup);
         ajout_ABR(fam, recup);
      end loop;
      close(F);
   end recup_fam;

   procedure recup_BS(BS : out T_PteurB) is
      recup : T_BS;
      F: file_save_BS.File_Type;

   begin
      BS := null;
      open(F, In_File, name=>"Babysitters");

      while not End_Of_File(F) loop
         read(F,recup);
         Insertion_BS(recup,BS);
      end loop;
      close(f);
   end recup_BS;


   procedure recup_jour (J : out T_jour)is
      recup : T_jour;
      F : file_save_jour.File_Type;
   begin
      Open(F, In_File, name => "Jour");
      while not End_Of_File(F) loop
         read(F,recup);
         J := recup;

      end loop;
      close(F);
   end recup_jour;


end enregistrement;
