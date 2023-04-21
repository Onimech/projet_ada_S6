with ada.Text_IO, ada.Integer_Text_IO, babysitter, initialisation, famille, outils, reservation, change_jour;
use ada.Text_IO, ada.Integer_Text_IO, babysitter, initialisation, famille, outils, reservation, change_jour;

procedure Main is
   choix1 , choix2: Character;
   bs_ajout : t_bs;
   liste_BS : T_PteurB;
   sortie : boolean;
   ABR_F : T_arbreF;
   famille : T_famille;
   BS_voulue : T_BS;
   BS_depart : T_BS;
   Pt_BS_voulue : T_PteurB;
   jour_actuel : T_jour := samedi ; -- penser à enlever l'initialisation

   min : Integer := 100;


begin
   initialisationG(liste_BS,ABR_F);
   montants_du(liste_BS);
   fact_globales(ABR_F);




   Put_Line("BIENVENUE SUR L APPLICATION 'NOS CHERS PETITS' !!!");
   loop
      Put_Line("Vous pouvez acceder : ");
      Put_Line("1- Espace famille");
      Put_Line("2- Espace Baby-Sitter");
      Put_Line("3- Gestion des gardes");
      Put_Line("4- Passer au jour suivant");
      Put_Line("5- Sauvegarde");
      Put_Line("X- Sortir");

      Put("Quel est votre choix ? "); get(choix1); Skip_Line;

      case choix1 is
         when '1' =>
            loop
               Put_Line("Vous pouvez accéder : ");
               Put_Line("1- Afficher les familles");
               Put_Line("2- Inscrire une famille ");
               Put_Line("3- Désinscrire une famille  ");
               Put_Line("4- Affichage planning des gardes pour une famille  ");
               Put_Line("5- Statistiques liées aux familles ");
               Put_Line("X- Sortir");

               put("Quel est votre choix ? "); get(choix2); Skip_Line;

               case choix2 is
               when '1' => visu_ABR(ABR_F);
               when '2' => saisie_famille(Famille); ajout_ABR(ABR_F,famille);
               when '3' => supp_famille(ABR_F, liste_BS, jour_actuel);
               when '4' => affichages_gardes(ABR_F,liste_BS, jour_actuel);
               when '5' => null;
               when 'X'|'x' => exit;
                  when others => Put_Line("Ce choix n'est pas proposé, veuillez recommencer");
               end case;
            end loop;



         when '2' =>
            loop
               Put_Line("Vous pouvez accéder : ");
               Put_Line("1- Afficher les baby-sitters ");
               Put_Line("2- Ajouter une/un baby-sitter  ");
               Put_Line("3- Effectuer une demande de départ");
               Put_Line("4- Affichage plannings de la semaine ");
               Put_Line("5- Statistiques liées aux baby-sitters ");
               Put_Line("6- Afficher les demandes de départs");
               Put_Line("X- Sortir");


               Put("Quel est votre choix ? "); get(choix2); Skip_Line;

               case choix2 is
               when '1' => Put_Line("Vous avez choisi de visualiser la liste de baby-sitter, la voici: "); Visu_BS(liste_BS);
               when '2' =>
                  if jour_actuel = dimanche then
                     saisie_BS(BS_ajout, liste_BS, sortie);
                     If sortie = false then
                        Insertion_BS(bs_ajout, liste_BS);
                     end if;
                  else
                     Put_Line("L'ajout n'est pas possible, veuillez ressayer dimanche.");
                  end if;

               when '3' => If jour_actuel = dimanche then
                     put_line("Pour quelle babysitter voulez-vous faire la demande de départ ?");
                     saisie_identite(BS_depart);
                     modif_depart(liste_BS, BS_depart);
                     put_line("La demande de départ a bien été prise en compte");


                  else put_line("la demande de départ n'est pas possible, veuillez ressayer dimanche");
                  end if;

               when '4' =>
                  put_line("De quel/quelle babysitter voulez-vous connaitre le planning ?");
                  saisie_identite(BS_voulue);
                  Pt_BS_voulue := recherche_BS(BS_voulue, liste_BS);

                  if Pt_BS_voulue /= null then
                     loop
                        Put_Line("Vous pouvez visualiser le planning de");
                        Put_Line("1- La semaine en cours");
                        Put_Line("2- La semaine suivante");
                        Put_Line("X- Sortir");

                        Put("Quel est votre choix ? "); get(choix2); Skip_Line;
                        case choix2 is
                        when '1' => Visu_Planning(Pt_BS_voulue.Val.plcours);
                        when'2' => Visu_Planning(Pt_BS_voulue.Val.plsuiv);
                        when 'X'|'x' => exit;
                           when others => Put_Line("Ce choix n'est pas propose, veuillez recommencer");
                        end case;
                     end loop;
                  else Put_Line("Le/La Baby-sitter n'a pas été trouvé(e) dans la liste, veuillez recommencer. "); New_Line;
                  end if;

                  when '5' => null;
                  when '6' => null;
                  when 'X'|'x' => exit;
                     when others => put_line("Ce choix n'est pas propose, veuillez recommencer");
               end case;
            end loop;


         when '3' =>
            loop
               Put_Line("Vous pouvez acceder : ");
               Put_Line("1- Reservation d'une garde");
               Put_Line("2- Annulation d'une garde");
               Put_Line("3- Statistiques liees aux gardes");
               Put_Line("X- Sortir");

               Put("Quel est votre choix ? "); get(choix2); Skip_Line;

               case choix2 is
                  when '1' => resa_garde(liste_BS, ABR_F);
                  when '2' => annulation(liste_BS, ABR_F, jour_actuel);
                  when '3' => null;
                  when 'X'|'x' => exit;
                     when others => put_line("Ce choix n'est pas propose, veuillez recommencer");
               end case;
            end loop;

         when '4' => changement_jour(jour_actuel, liste_BS, ABR_F);
         when '5' => null;
         when 'X'|'x' => exit;
            when others => put_line("Ce choix n'est pas propose, veuillez recommencer");
      end case;
   end loop;




end Main;
