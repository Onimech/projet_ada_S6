with outils, babysitter, famille, ada.Text_IO;
use outils, babysitter, famille, ada.Text_IO;

package reservation is

   PROCEDURE Choix_Jour_Creneau (C : OUT T_Creneau; J : OUT T_Jour);
   procedure BS_dispo (tete : T_PteurB; C : T_creneau; J : T_jour; F : T_famille);
   procedure resa_garde (tete : in out T_PteurB; F: T_arbreF);
   procedure reattribution_BS (BS_choisi : in out T_PteurB; Liste_BS : T_PteurB; Fam : T_famille; C : T_creneau; J : T_jour);
   procedure enre_BS_choisi (BS_choisi: T_PteurB; Fam : in out T_arbreF; J : T_jour ; C : T_creneau);

   Function pas_reserve (fam : T_arbreF ; tete : T_PteurB; C : T_creneau; J : T_jour) return boolean;
   function verif_ageBS (BS : T_PteurB; F : T_famille) return boolean;
   function verif_dispo (BS : T_PteurB; C : T_creneau; J : T_jour) return boolean;
   function cherche_BS_pred (tete : T_PteurB; nomF : T_arbreF ) return T_PteurB;


   procedure visu_garde_fam_cours (F : T_famille; BS :T_PteurB; J : T_jour);
   procedure annulation (ListeBS : in out T_PteurB; F : T_arbreF;  Jour : T_jour) ;
   procedure visu_garde_fam_suiv (F : T_famille; BS :T_PteurB);
   procedure enre_annulation (ListeBS: in out T_PteurB; Fam : T_arbreF; sem_cours : Boolean; J : T_jour ; C : T_creneau);
   Function reserve (fam : T_arbreF ; tete : T_PteurB; sem_cours : Boolean; C : T_creneau; J : T_jour) return boolean;
   procedure affichages_gardes (Fam:T_arbreF; listeBS : T_PteurB; Jour : T_jour);

   procedure supp_famille (Familles : in out  T_arbreF;listesBS: in out T_PteurB;  jour_actuel : T_jour);
   procedure supp_gardes (ListesBS : in out T_PteurB; fam :T_famille; jour_actuel : T_jour) ;
   end reservation;

