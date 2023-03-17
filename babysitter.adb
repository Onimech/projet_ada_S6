with ada.Text_IO, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;

Package body babysitter is


   ------Saisie d'une baby-sitter ----------------------------------------------------------------------------------------------------------
   Procedure saisie_BS (BS : out T_BS; tete : in T_PteurB; DM_sortie : out boolean) is
      choix : Character;

      k : integer;

   begin
      BS.identite.prenom := (others => ' ');
      BS.identite.nom := (others => ' ');
      DM_sortie := false;

      saisie_identite(BS);

      While homonymieBS(tete, BS.identite) loop
         loop
            put("Un ou une babysitter porte déjà ce nom/prénom, que voulez vous faire ? 0 pour abandonner la saisie, 1 pour compléter avec un deuxième prénom"); get(choix); skip_line;
            case choix is
               when '0' => put_line("Sortie"); DM_sortie := true; exit;
                  when '1' => put("Saisissez les deux prénoms : ");BS.identite.prenom := (others => ' ');
                  Get_Line(BS.identite.prenom,k);
                  BS.identite.prenom := unification(BS.identite.prenom); exit;
                  when others => put("Ce choix n'est pas proposé, veuillez ressayer"); new_line;
            end case;
         end loop;
      end loop;

      If DM_sortie then
         BS.identite.prenom := (others => ' ');
         BS.identite.nom := (others => ' ');
      else
         saisie_age_BS(BS.age);


      end if;
   end saisie_BS;
   -------------------------------------------------------------------------------------------------------------------------------


   ------------insertion d'une BS dans la liste -----------------------------------------------------------------------------
   Procedure Insertion_BS (BS : in T_BS; tete : in out T_PteurB) is --la liste est déjà triée

   Begin
      If tete = null then
         tete := new T_cellB'(BS, tete); --si tete insertion de la cellule en tete

      elsif tete.val.identite.nom > BS.identite.nom then
         tete := new T_cellB'(BS,tete); --si la BS à ajouter est avant insertion avant

      elsif tete.val.identite.nom = BS.identite.nom then --si nom de famille pareil alors
         if tete.val.identite.prenom > BS.identite.prenom then
            tete := new T_cellB'(BS, tete);
         else tete.suiv := new t_cellB'(BS, tete.suiv);

         end if; --si prenom BS avant, insertion avant
      else Insertion_BS(BS, tete.suiv); --si après pour prenom, cellule suivante
      end if;
   end Insertion_BS;
   ------------------------------------------------------------------------------------------------------------------------------------

   ----------Viusualisation de la liste de baby-sitter -----------------------------------------------------------------------------------
   Procedure Visu_BS (tete : T_PteurB) is
   Begin

      If Tete /= null then
         put("Prenom : "); Put(Tete.Val.identite.prenom); new_line;
         put("Nom    : "); Put(Tete.Val.identite.nom); new_line;
         put("Age    : "); Put(Tete.Val.age,2); new_line;
         put("A demandé à partir : ");
         if tete.Val.DM_depart then
            put("Oui ");
         else put("Non ");
         end if;
         New_Line; New_Line;
         Visu_BS(tete.suiv);
      end if;

   end Visu_BS;
   ---------------------------------------------------------------------------------------------------------------------------------------


   ---------------fonction qui vérifie si le nom de la BS n'est pas déja dans la liste -----------------------------------------------------
   function homonymieBS (tete: T_PteurB; id : T_identite) return boolean is

   begin
      if tete /= null then
         if tete.Val.identite = id then
            return (true);
         else
            return(homonymieBS(tete.suiv, id));
         end if;
      else return (false);
      end if;
   end homonymieBS;
   --------------------------------------------------------------------------------------------------------------------------------------------------

   --------------------------------------------------------------------------------
   procedure Visu_Planning (P : T_planning) is

   begin
      for i in T_jour range lundi..samedi loop
         put(T_jour'image(i)); put(" :"); new_line; new_line;
         for j in T_creneau'range loop
            put(T_creneau'image(j)); put(" : ");
            put(P(i,j)); new_line;
         end loop;
         new_line; new_line;
      end loop;

   end Visu_Planning;
   -------------------------------------------------------------------------------------


   ----------recherche d'une BS dans la liste ---------------------------------------------------------------------------
   Function recherche_BS (BS_R : T_BS; tete : T_PteurB) return T_PteurB is

   begin
      if tete /= null then
         if BS_R.identite = tete.val.identite then
            return tete;
         else
            return(recherche_BS(BS_R, tete.suiv));
         end if;
      else return(null);
      end if;
   end recherche_BS;
   -----------------------------------------------------------------------------

   ----------saisie de l'identite d'une BS--------------------------------------------------
   Procedure saisie_identite (BS : out T_BS) is
      k : integer;

   begin
      put("Saisissez Prenom Babysitter : "); get_line(BS.identite.prenom,k); BS.identite.prenom := unification(BS.identite.prenom);
      put("Saisissez Nom Babysitter : "); get_line(BS.identite.nom,k); BS.identite.nom := unification(BS.identite.nom);
   end saisie_identite;
   ---------------------------------------------------------------------------------------------

end babysitter;
