<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<title>Parametre</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!--link rel="stylesheet" href="https://www.dhschools.com/dhcss/4/dh.css"-->
<link rel="stylesheet" href="/css/style_1.css">
<link rel="stylesheet" href="/css/style_2.css">
<!--link rel="stylesheet" href="https://www.dhschools.com/lib/dh-theme-blue-grey.css"-->
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!---script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <cript src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script-->
<style>
    body {
        font-family: "Times New Roman", Georgia, Serif;
        background-image: url("/images/accueil.jpeg");
    }

    h1, h2, h3, h4, h6, span {
        font-family: "Segoe UI";

    }

    .menu {
        display: none;
    }
</style>
<body class="dh-theme-l5">

<!-- Début Barre de menus-->

<div class="dh-top">
    <div class="dh-bar dh-theme-d2 dh-left-align dh-large">
        <div class="dh-row">
            <div class="dh-col m2">
                <a class="dh-bar-item dh-button dh-hide-medium dh-hide-large dh-right dh-padding-large dh-hover-white dh-large"
                   href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
                <div class="dh-container">
                    <a href="/home" class="" style="text-decoration: none; position:relative; top:5px;">
                        <!--i class="fa fa-home dh-margin-right" style="color:white;"></i-->
                        <!--span style="font-family:'Segoe UI',Arial,sans-serif;">FastCook</span-->
                        <img src="/images/fastcook.png" style="width:50%;height: 40px;"/>
                    </a>
                </div>

            </div>

            <div class="dh-col m4">
                <form class="form-inline" action="#">
                    <input class="form-control" type="text" placeholder="Search"
                           style="width:100%; border-radius: 200px; margin-top:7px; margin-right: 70px; margin-bottom: ;">
                </form>
            </div>

            <div class="dh-col m6" id="barreMenu">
                <div class="dh-dropdown-hover dh-hide-small">
                    <button class="dh-button dh-padding-large dh-hover-white" title="Recette"><i
                            class="fa fa-cutlery"></i></button>
                    <div class="dh-dropdown-content dh-card-4 dh-bar-block" style="width:15%">
                        <a href="#" class="dh-bar-item dh-button" style="text-decoration: none;"
                           onclick="document.getElementById('recette').style.display='block'">Créer une Recette</a>
                        <a href="/recipes" class="dh-bar-item dh-button" style="text-decoration: none;">Carnet de
                            Recette</a>
                    </div>
                </div>

                <div class="dh-dropdown-hover dh-hide-small">
                    <button class="dh-button dh-padding-large dh-hover-white" title="Conversations"><i
                            class="fa fa-group"></i></button>
                    <div class="dh-dropdown-content dh-card-4 dh-bar-block" style="width:10%">

                        <a href="#" class="dh-bar-item dh-button" style="text-decoration: none;"
                           onclick="document.getElementById('conversation').style.display='block'">Creer un Sujet</a>
                        <a href="/subjects" class="dh-bar-item dh-button" style="text-decoration: none;">Voir les
                            Sujets</a>
                    </div>
                </div>

                <div class="dh-dropdown-hover dh-hide-small">
                    <button class="dh-button dh-padding-large dh-hover-white" title="Challenge"><i
                            class="fa fa-trophy"></i></button>
                    <div class="dh-dropdown-content dh-card-4 dh-bar-block" style="width:17%">
                        <a href="#" class="dh-bar-item dh-button" style="text-decoration: none;"
                           onclick="document.getElementById('challenge').style.display='block'">Creer un Challenge</a>
                        <a href="/challenges" class="dh-bar-item dh-button" style="text-decoration: none;">Rejoindre
                            un Challenge</a>
                    </div>
                </div>
                
                <div class="dh-dropdown-hover dh-hide-small">
                <a href="#" class="dh-button dh-padding-large dh-hover-white" title="Notifications"><i class="fa fa-bell"></i>
                  <span class="dh-badge dh-right dh-small dh-red" id="nbNotif">3</span></a>
                <div class="dh-dropdown-content dh-card-4 dh-bar-block" style="width:17%">
                  <ul class="dh-ul dh-hoverable dh-white" id="listNotif">
                    <li class="dh-padding">
                      <a href="#" style="text-decoration: none;">
                        <img id="imNotif" src="images/user1.png" alt="Kahina" class="dh-left dh-circle" style="width:20px; margin-right:5px;">
                        <span id="msgeNotif" style="font-size: 14px; position:relative; bottom: 5px;">Kahina a publié une recette</span>
                      </a>
                    </li>
                    <li class="dh-padding">
                      <a href="#" style="text-decoration: none; color:black">
                      <img src="images/user2.png" alt="Hao" class="dh-left dh-circle" style="width:20px; margin-right:5px;">
                      <span style="font-size: 14px; position:relative; bottom: 5px;">Hao aime votre recette</span>
                    </a>
                    </li>
                    <li class="dh-padding">
                      <a href="#" style="text-decoration: none; color:black">
                      <img src="images/profile.png" alt="Sabah" class="dh-left dh-circle" style="width:20px; margin-right:5px;">
                      <span style="font-size: 14px; position:relative; bottom: 5px;">Sabah a commenté votre recette</span>
                    </a>
                    </li>
                   
                  </ul>
                </div>
               </div>
                <div class="dh-dropdown-hover dh-right">
                    <button class="dh-button dh-padding-large dh-hover-white" title="profil"
                            onclick="myFunction('monProfil')"><i class="fa fa-user-circle" style="font-size:20px;"></i>
                    </button>
                    <div class="dh-dropdown-content dh-bar-block" style="right:0">
                        <a href="/profile" class="dh-bar-item dh-button" style="text-decoration: none;"
                           title="Edit Profile"><i class="fa fa-user"></i> | Mon Profil</a>
                        <a href="/settings" class="dh-bar-item dh-button" style="text-decoration: none; "
                           title="Settings"><i class="fa fa-cog"></i> | Paramètres</a>
                        <a href="/logout" class="dh-bar-item dh-button" style="text-decoration: none;"
                           title="Deconnexion"><i class="fa fa-power-off"></i> | Déconnexion</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- Fin barre des menus-->

<!-- Page Container -->
<div class="dh-container dh-content" style="max-width:1400px;margin-top:80px">
    <div class="dh-row">
        <!-- Left Column -->
        <div class="dh-col m2 dh-card dh-theme-l5">

            <div class="dh-center">
                <h6>Paramètres du Compte</h6>
                <button id="myLink" onclick="openMenu(event, 'notifs');" style="width:100%"
                        class="dh-button dh-block dh-theme-d2 dh-left-align ">

                    <span style="margin-right:45px;" class="dh-titre"><i class="fa fa-bell" aria-hidden="true"
                                                                         style="color:white;"></i>       Notification </span>
                    <!--i class="fa fa-chevron-right" aria-hidden="true"></i-->

                </button>

                <button onclick="openMenu(event, 'password');" class="dh-button dh-block dh-theme-d2 dh-left-align">
                    <span style="margin-right:45px;" class="dh-titre"><i class="fa fa-unlock-alt" style="color:white;"
                                                                         aria-hidden="true"></i>     Mot de passe</span>
                    <!--i class="fa fa-chevron-right" aria-hidden="true"></i-->
                </button>

                <button onclick="openMenu(event, 'delete');" class="dh-button dh-block dh-theme-d2 dh-left-align">
                    <span style="margin-right:1px;" class="dh-titre"><i class="fa fa-remove" style="color:white;"
                                                                        aria-hidden="true"></i>      Suppression compte</span>
                    <!--i class="fa fa-chevron-right" aria-hidden="true"></i-->
                </button>
            </div>

        </div>


        <div class="dh-col m10">
            <div class="dh-content" id="menu">
                <div class=" dh-theme-l5">
                    <!--Debut gestion des notifications -->
                    <div id="notifs" class="dh-container menu dh-padding">
                        <h5 class="dh-opacity dh-medium"><strong><span
                                class="text-uppercase"> Notifications</span></strong></h5>
                        <hr class="dh-clear">
                        <p>
                            <b class="dh-large">Je souhaite recevoir les notifications</b>
                        </p>
                        <div class=" dh-row" style="margin-left: 10px;">
                            <div class="dh-col s5" style="margin-right: 16px;">
                                <ul class="dh-ul dh-card-4 dh-white">

                                    <li class="">
                                        <span class="dh-titre">Par mon adresse mail</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif1" id="notif1_on"
                                           onclick="notif(event, 'notif1_off', 'notif1')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif1" id="notif1_off"
                                           onclick="notif(event, 'notif1_on', 'notif1')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                    <li class="">
                                        <span class="dh-titre">Sur ma file d'actualité</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif2" id="notif2_on"
                                           onclick="notif(event, 'notif2_off', 'notif2')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif2" id="notif2_off"
                                           onclick="notif(event, 'notif2_on', 'notif2')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                    <li class="">
                                        <span class="dh-titre">Ma recette publiée a été notée</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif3" id="notif3_on"
                                           onclick="notif(event, 'notif3_off', 'notif3')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif3" id="notif3_off"
                                           onclick="notif(event, 'notif3_on', 'notif3')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                    <li class="">
                                        <span class="dh-titre">Ma recette publiée a été aimée</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif4" id="notif4_on"
                                           onclick="notif(event, 'notif4_off', 'notif4')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif4" id="notif4_off"
                                           onclick="notif(event, 'notif4_on', 'notif4')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                    <li class="">
                                        <span class="dh-titre">Invitation à rejoindre un sujet de conversation</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif5" id="notif5_on"
                                           onclick="notif(event, 'notif5_off', 'notif5')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif5" id="notif5_off"
                                           onclick="notif(event, 'notif5_on', 'notif5')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                </ul>
                            </div>
                            <div class="dh-col s2 dh-card-4">

                            </div>
                            <div class="dh-col s5">
                                <ul class="dh-ul dh-card-4 dh-white">
                                    <li class="">
                                        <span class="dh-titre">Invitation à participer à un challenge</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif6" id="notif6_on"
                                           onclick="notif(event, 'notif6_off', 'notif6')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif6" id="notif6_off"
                                           onclick="notif(event, 'notif6_on', 'notif6')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                    <li class="">
                                        <span class="dh-titre">Modification d'un challenge</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif7" id="notif7_on"
                                           onclick="notif(event, 'notif7_off', 'notif7')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif7" id="notif7_off"
                                           onclick="notif(event, 'notif7_on', 'notif7')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                    <li class="">
                                        <span class="dh-titre">Suppression d'un challenge</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif8" id="notif8_on"
                                           onclick="notif(event, 'notif8_off', 'notif8')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif8" id="notif8_off"
                                           onclick="notif(event, 'notif8_on', 'notif8')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                    <li class="">
                                        <span class="dh-titre">Modification d'un sujet de conversation</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif9" id="notif9_on"
                                           onclick="notif(event, 'notif9_off', 'notif9')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif9" id="notif9_off"
                                           onclick="notif(event, 'notif9_on', 'notif9')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                    <li class="">
                                        <span class="dh-titre">Suppression d'un sujet de conversation</span>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif10" id="notif10_on"
                                           onclick="notif(event, 'notif10_off', 'notif10')"
                                           style="cursor:pointer; color:blue;" aria-hidden="true"></i>
                                        <i class="fa fa-toggle-on dh-right dh-xlarge notif10" id="notif10_off"
                                           onclick="notif(event, 'notif10_on', 'notif10')"
                                           style="cursor:pointer; color:black;" aria-hidden="true"></i>
                                    </li>
                                </ul>
                            </div>

                        </div>

                        <br/>
                        <!-- Fin Gestion des notifications-->
                    </div>


                    <!--Debut Gestion des mots de passe-->
                    <div id="password" class="dh-container menu dh-padding">
                        <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase"> Gestion de mon mot de passe</span></strong>
                        </h5>
                        <hr class="dh-clear">
                        <div class="dh-white">
                            <form action="#" target="">
                                <p style="padding-left: 32px; padding-top: 32px;"><label for="curmdp" class="dh-titre">Mot
                                    de passe actuel</label>
                                    <input style="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                           type="text" placeholder="" required name="curmdp">
                                </p>
                                <p style="padding-left: 32px;">
                                    <label for="newmdp" class="dh-titre">Nouveau mot de passe</label>
                                    <input style="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                           type="text" placeholder="" required name="newmdp">
                                </p>
                                <p style="padding-left: 32px;">
                                    <label for="confmdp" class="dh-titre">Confirmer le mot de passe</label>
                                    <input style="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                           type="text" placeholder="" required name="confmdp">
                                </p>
                                <p style="padding-left:32px; padding-bottom: 32px;">
                                    <button class="dh-button  dh-theme-d2  dh-padding-large" type="submit">
                                        Changer le mot de passe
                                    </button>
                                </p>
                            </form>
                        </div>


                        <!-- Fin Gestion des mots de passe dh-light-grey -->
                    </div>

                    <!--Debut Suppression Compte -->
                    <div id="delete" class="dh-container menu dh-padding">
                        <h5 class="dh-opacity dh-medium"><strong><span
                                class="text-uppercase"> Supprimer son compte</span></strong></h5>
                        <hr class="dh-clear">

                        <p class="dh-large dh-center">
                            Pouvez-vous nous faire part des raisons de suppression de votre compte ?

                        </p>
                        <hr class="dh-clear">
                        <form class="dh-container dh-card-4 dh-white dh-padding">
                            <p class="dh-titre">
                                <input id="raison1" class="dh-radio" type="radio" name="raison">
                                <label for="raison1">Notre site n'est pas assez interessant </label></p>
                            <p class="dh-titre">
                                <input id="raison2" class="dh-radio" type="radio" name="raison">
                                <label for="raison2">Vous voulez le désactiver momentanément </label></p>
                            <p class="dh-titre">
                                <input id="raison3" class="dh-radio" type="radio" name="raison">
                                <label for="raison3">Vous avez un autre Compte </label></p>
                            <p>
                                <button class="dh-button  dh-theme-d2  dh-padding-large" type="submit">
                                    Je supprime mon compte
                                </button>
                            </p>

                        </form>
                        <br/>
                        <!--Fin Suppression Compte -->
                    </div>

                </div>

            </div>

        </div>

    </div>
</div>
<!-- Fin Page Container-->

<!-- End Page Container -->

<script src="/scripts/dreamhunter.js"></script>
<jsp:include page="modals.jsp"/>

<!-- Footer -->
<!--footer class="dh-container dh-theme-d3 dh-padding-16">
  <p style="text-align: center;">Copyright 2020  | DreamHunter</p>
</footer-->

<footer class="dh-center dh-theme-d3 dh-bottom">
    <p>Copyright 2020  | DreamHunter</p>
</footer>




</body>
</html>