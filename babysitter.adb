with ada.Text_IO, ada.Integer_Text_IO;
use ada.Text_IO, ada.Integer_Text_IO;

Package body babysitter is


   Procedure saisie_BS (BS : out T_BS) is
      tete : T_PteurB; --aller voir annie
      choix : Character;
      DM_sortie : Boolean := false;
   begin

      put("Saisissez Prenom Babysitter :"); get(BS.identite.prenom); skip_line;
      put("Saisissez Nom Babysitter :"); get(BS.identite.nom); skip_line;


      While homonymieBS(tete, BS.identite) loop

         loop
            put("Un ou une babysitter porte déjà ce nom/prénom, que voulez vous faire ? 0 pour abandonner la saisie, 1 pour compléter avec un deuxième prénom"); get(choix); skip_line;
            case choix is
               when '0' => put_line("Sortie"); DM_sortie := true; exit;
                  when '1' => put("Saisissez les deux prénoms"); get(BS.identite.prenom); skip_line; exit;
                  when others => put("Ce choix n'est pas proposé, veuillez ressayer"); new_line;
            end case;
         end loop;
      end loop;


      If DM_sortie then
         BS.identite.prenom := (others => ' ');
         BS.identite.nom := (others => ' ');

      else

         put("Saisissez Age babysitter :"); saisie_age_BS(BS.age);
         BS.plcours := ((others => (others => (others => ' '))));
         BS.plsuiv := ((others => (others => (others => ' '))));
         BS.argent_semaine := 0;
         BS.DM_depart := false;
      end if;

   end saisie_BS;


   Procedure Insertion_BS (BS : T_BS; tete : in out T_PteurB) is --la liste est déjà triée
   Begin
      If tete = null then
         tete := new T_cellB'(BS, tete); --si tete insertion de la cellule en tete

      elsif tete.val.identite.nom > BS.identite.nom then
         tete := new T_cellB'(BS,tete); --si la BS à ajouter est avant insertion avant

      elsif tete.val.identite.nom = BS.identite.nom then --si nom de famille pareil alors
         if tete.val.identite.prenom > BS.identite.prenom then
            tete := new T_cellB'(BS, tete);
         end if; --si prenom BS avant, insertion avant
      else Insertion_BS(BS, tete.suiv); --si après pour prenom, cellule suivante
      end if;
   end Insertion_BS;

   Procedure Visu_BS (tete : T_PteurB) is
   Begin

      If Tete /= null then
         put("Prenom :"); Put(Tete.Val.identite.prenom); new_line;
         put("Nom :"); Put(Tete.Val.identite.nom); new_line;
         put("Age :"); Put(Tete.Val.age); new_line;
         put("A demandé à partir : ");
         if tete.Val.DM_depart then
            put("oui");
         else put("non");
         end if;
      end if;

   end Visu_BS;





   function homonymieBS (tete: T_PteurB; id : T_identite) return boolean is

   begin
      if tete /= null then
         if tete.Val.identite = id then return true;
         else return(homonymieBS(tete.suiv, id));
         end if;
      else return (false);
      end if;
   end homonymieBS;

end babysitter;
