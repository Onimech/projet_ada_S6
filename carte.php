<!DOCTYPE HTML>

<html>
<head>
<meta charset="UTF-8" />
<title> Utilisateurs </title>
<link rel="stylesheet" media="screen" href="mise_en_page.css">
</head>
<body> 
    <ul>
            <li> <a href="index.php">Accueil</a> </li>
            <li> <a href="presentation.php">C'est quoi les Playoff de la NBA?</a> </li>
            <li> <a href="tableau.php">Tableau Séries</a> </li>
            <li> <a href="carte.php">Carte Intéractive</a> </li>
            <li> <a href="equipes.php">Liste Equipes</a> </li>
            <li> <a href="joueurs.php">Liste Joueurs</a> </li>
            <li> <a href="coachs.php">Liste Coachs</a> </li>
    </ul>

    
    <?php

    //Connexion à la BD
    $user = 'root';
    $password = 'root';
    $db = 'oiseaux';
    $host = 'localhost';

    $con = mysqli_connect($host, $user, $password, $db);

    if(mysqli_connect_errno())
        echo "Fail to connect :".mysqli_connect_errno();

    $requete1="SELECT pseudo FROM Utilisateur;";
    $reponse1 = mysqli_query($con,$requete1);
    ?>
    <center>
    <tbody><tr>
<h2>Équipes qualifiées</h2>
<center>
<table style="text-align:center;">
<td width="250px" rowspan="4"><table class="DebutCarte" style="width:auto; margin:0; border:none; border-spacing:0; padding:0; text-align:center;">
<tbody><tr><td style="border:none; padding:0"><div style="position:relative;;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/0/03/Usa_edcp_%28%2BHI_%2BAK%29_location_map.svg/600px-Usa_edcp_%28%2BHI_%2BAK%29_location_map.svg.png"  width="600" height="371"/></a>
<div style="position:absolute;top:63.719917694136%;left:21.156812616859%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left: 0.5em;text-align:left;width:12em;line-height:1.2em;"><a href="/wiki/Suns_de_Phoenix" title="Suns de Phoenix">Phoenix</a></b></span></div></div></div>
<div style="position:absolute;top:90.56877679549%;left:81.08873205974%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left:-12.6em;text-align:right;width:12em;line-height:1.2em;"><a href="/wiki/Heat_de_Miami" title="Heat de Miami">Miami</a></b></span></div></div></div>
<div style="position:absolute;top:61.292765070039%;left:60.634497374396%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left:-12.6em;text-align:right;width:12em;line-height:1.2em;"><a href="/wiki/Grizzlies_de_Memphis" title="Grizzlies de Memphis">Memphis</a></b></span></div></div></div>
<div style="position:absolute;top:69.997495604458%;left:48.550948123866%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left:-12.6em;text-align:right;width:12em;line-height:1.2em;"><a href="/wiki/Mavericks_de_Dallas" title="Mavericks de Dallas">Dallas</a></b></span></div></div></div>
<div style="position:absolute;top:33.214760679381%;left:62.787108068245%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left:-12.6em;text-align:right;width:12em;line-height:1.2em;"><a href="/wiki/Bucks_de_Milwaukee" title="Bucks de Milwaukee">Milwaukee</a></b></span></div></div></div>
<div style="position:absolute;top:29.869330189713%;left:89.756806693093%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-1.75em;left: -6em;text-align:center;width:12em;line-height:1.2em;"><a href="/wiki/Celtics_de_Boston" title="Celtics de Boston">Boston</a></b></span></div></div></div>
<div style="position:absolute;top:38.845898736532%;left:84.212302498974%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top: 0.00em;left: 0.6em;text-align:left;width:12em;line-height:1.2em;"><a href="/wiki/76ers_de_Philadelphie" title="76ers de Philadelphie">Philadelphie</a></b></span></div></div></div>
<div style="position:absolute;top:42.550979709184%;left:5.8304045175601%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left: 0.5em;text-align:left;width:12em;line-height:1.2em;"><a href="/wiki/Warriors_de_Golden_State" title="Warriors de Golden State">Golden State</a></b></span></div></div></div>
<div style="position:absolute;top:38.589198982217%;left:24.108726205448%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-1.75em;left: -6em;text-align:center;width:12em;line-height:1.2em;"><a href="/wiki/Jazz_de_l%27Utah" title="Jazz de l&#39;Utah">Utah</a></b></span></div></div></div>
<div style="position:absolute;top:37.148356711127%;left:63.434651293968%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left: 0.5em;text-align:left;width:12em;line-height:1.2em;"><a href="/wiki/Bulls_de_Chicago" title="Bulls de Chicago">Chicago</a></b></span></div></div></div>
<div style="position:absolute;top:28.300391117708%;left:75.974696932935%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-1.75em;left: -6em;text-align:center;width:12em;line-height:1.2em;"><a href="/wiki/Raptors_de_Toronto" title="Raptors de Toronto">Toronto</a></b></span></div></div></div>
<div style="position:absolute;top:45.80088330522%;left:35.693217669219%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left: 0.5em;text-align:left;width:12em;line-height:1.2em;"><a href="/wiki/Nuggets_de_Denver" title="Nuggets de Denver">Denver</a></b></span></div></div></div>
<div style="position:absolute;top:64.556929400136%;left:70.804814071608%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left: 0.5em;text-align:left;width:12em;line-height:1.2em;"><a href="/wiki/Hawks_d%27Atlanta" title="Hawks d&#39;Atlanta">Atlanta</a></b></span></div></div></div>
<div style="position:absolute;top:79.424249544845%;left:62.026922634514%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-1.75em;left: -6em;text-align:center;width:12em;line-height:1.2em;"><a href="/wiki/Pelicans_de_La_Nouvelle-Orl%C3%A9ans" title="Pelicans de La Nouvelle-Orléans">La Nouvelle-Orléans</a></b></span></div></div></div>
<div style="position:absolute;top:35.647436621582%;left:85.822299939993%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-0.80em;left: 0.5em;text-align:left;width:12em;line-height:1.2em;"><a href="/wiki/Nets_de_Brooklyn" title="Nets de Brooklyn">Brooklyn</a></b></span></div></div></div>
<div style="position:absolute;top:28.585721604499%;left:54.401099954019%;"><div style="position:relative;top:-8px;left:-8px;width:16px;height:16px;background-color:transparent;"><img src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f0/City_locator_3.svg/16px-City_locator_3.svg.png"  width="16" height="16" /></div><div style="position:relative;top:-17px;"><div style="font-size:100%;position:relative;top:-1.75em;left: -6em;text-align:center;width:12em;line-height:1.2em;"><a href="/wiki/Timberwolves_du_Minnesota" title="Timberwolves du Minnesota">Minneapolis</a></b></span></div></div></div>
</div></td></tr></tbody></table>
</td></tr></tbody></table></center>

    |}</center>
    <?php
    echo "<h1> Utilisateur</h1>";
    echo "<form method=\"post\">";
    echo "<select name=\"menuUser\" id=\"menuUser\">";
    while($ligne = mysqli_fetch_array($reponse1))
        echo "<option value=\"".$ligne['pseudo']."\">".$ligne['pseudo']."</option>";

    mysqli_free_result($reponse1);

    echo "</select>";
    echo "<input type=\"submit\" name=\"afficher\"  value=\"Afficher\"/>";
    echo "</form>";


    $selected=$_POST['menuUser'];
    if(!$selected)
        $selected = '';

    echo "<BR><BR>";

    /***************************************************************************/
    // ****** Exercice 3 : Affichage des informations d'un utilisateur ****** //
    /***************************************************************************/

/* -> à enlever pour passer à l'exercice 3

    // Todo : Ecrire la requête pour récupérer l'utilisateur dont le pseudo est stocké dans la variable $selected
    // Todo : Envoyer au serveur pour générer la réponse
    // ici votre code de la requête et génération de la réponse
    $requete2="";

    echo "<div class=\"user\">";

    // Todo : Traiter la réponse ligne par ligne afin d'afficher dans un tableau:
    // 1ère ligne : la photo de l'utilisateur
    // 2ème ligne : le pseudo de l'utilisateur en l'affichant avec un titre en h3
    // 3ème ligne : Nom (en gras) : le nom de l'utilisateur
    // 4ème ligne : Prénom (en gras) : le prénom de l'utilisateur

    if($ligne['nom']){

        echo "<table>";
        echo "<td align=center bgcolor=\"#E3F6CE\" width=\"200px\" height=\"10px\" rowspan=\"1\" colspan=\"5\"> <h2>Profil </h2></td>";

        // Ici votre code pour afficher les informations de l'utilisateur dans le tableau

        echo "</table>";
    }
    mysqli_free_result($reponse2);
    echo "</div>";
à enlever pour passer à l'exercice 3 -> */

/* -> à enlever pour passer à l'exercice 4

    if($ligne['nom']){

        //************************************************************************** //
        // ****** Exercice 4 : Affichage des amis d'un utilisateur ****** //
        //************************************************************************* //

        // Todo : Ecrire la requête pour récupérer les amis de l'utilisateur dont le pseudo est stocké dans la variable $selected
        // Todo : Envoyer au serveur pour générer la réponse
        // ici votre code de la requête et génération de la réponse


        $requete3="";

        echo "<div class=\"infoUser\">";

        echo "<table>";
        echo "<td align=center bgcolor=\"#E3F6CE\" width=\"1000px\" height=\"10px\" rowspan=\"1\" colspan=\"5\"> <h2>Ses amis </h2></td>";
    
         // Todo : Traiter la réponse ligne par ligne afin d'afficher dans un tableau les amis de l'utilisateur avec 2 colonnes maxi
         // Chaque colonne affiche un ami :
             // la photo de l'ami de l'utilisateur
             // le nom et le prénom de l'utilisateur ami en l'affichant avec un titre en h3
        // Si l'utilisateur n'a aucun ami : le message "Aucun ami" est affichant dans la 1ère ligne du tableau


        // ici : votre code pour afficher le tableau

        echo "</table>";

        // libération du tableau de réponse
        mysqli_free_result($reponse3);
       
        echo "</div>";

à enlever pour passer à l'exercice 4 -> */

        //**************************************************************************//
        // ****** Exercice 5 : Affichage des oiseaux d'un utilisateur ****** //
        //*************************************************************************//

        // Todo : Ecrire la requête pour récupérer les oiseaux de l'utilisateur dont le pseudo est stocké dans la variable $selected
        // Todo : Envoyer au serveur pour générer la réponse
        // ici votre code de la requête et génération de la réponse

/* -> à enlever pour passer à l'exercice 5

        $requete4="";

        echo "<div class=\"infoUser\">";

        echo "<table>";
        echo "<td align=center bgcolor=\"#E3F6CE\" width=\"1000px\" height=\"10px\" rowspan=\"1\" colspan=\"5\"> <h2>Ses oiseaux </h2></td>";
        echo "<tr>";
        
        // Todo : Traiter la réponse ligne par ligne afin d'afficher dans un tableau les oiseaux de l'utilisateur avec 2 colonnes maxi.
        // Chaque colonne affiche un oiseau:
            //  la photo de l'oiseau de l'utilisateur
            //  le nom commun de l'oiseau de l'utilisateur en l'affichant avec un titre en h3
        // Si l'utilisateur n'a aucun oiseau : le message "Aucun oiseau" est affiché dans la 1ère ligne du tableau

        // ici : votre code pour afficher le tableau

        echo "</tr>";
        mysqli_free_result($reponse4);
        echo "</table>";
        echo "</div>";
        }
à enlever pour passer à l'exercice 5 -> */

    mysqli_close($con);
?>

</body>

</html>

