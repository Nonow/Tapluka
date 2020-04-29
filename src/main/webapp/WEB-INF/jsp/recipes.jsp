<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>Carnet de Recette</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style_1.css">
<link rel="stylesheet" href="/css/style_2.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body {
        font-family: "Times New Roman", Georgia, Serif;
        background-image: url("/images/accueil.jpeg");
    }

    h1, h2, h3, h4, h6 {
        font-family: "Playfair Display";
        letter-spacing: 0px;
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
                        <a href="/subjects" class="dh-bar-item dh-button" style="text-decoration: none;">Liste des
                            Sujets</a>
                        <a href="/mesSujets" class="dh-bar-item dh-button" style="text-decoration: none;">Mes Sujets</a>

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
                        <a href="/mesChallenges" class="dh-bar-item dh-button" style="text-decoration: none;">Mes Challenges</a>

                    </div>
                </div>
                <a href="#" class="dh-bar-item dh-button dh-hide-small dh-padding-large dh-hover-white"
                   title="Notifications"><i class="fa fa-bell"></i>
                    <span class="dh-badge dh-right dh-small dh-red">3</span></a>

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


<!-- Page Container -->
<div class="dh-container dh-content" style="max-width:1400px;margin-top:80px">
    <div class="dh-row dh-padding">
        <!-- Left Column -->
        <div class="dh-col m9">
            <!-- Menu Container -->
            <!--div class="dh-container "-->
            <!-- Sidebar/menu -->

            <div class="dh-content " id="menu">

                <!--div class="dh-col s8"-->
                <div class="row">
                    <div class="col-sm-3 dh-theme-l5 ">
                        <div class="dh-center">
                            <h6>Toutes mes recettes</h6>
                            <button id="myLink" onclick="openMenu(event,'RecSauv');" style="width:100%"
                                    class="dh-button dh-block dh-theme-d2 dh-left-align ">
                                Recettes Sauvegardées (3)
                            </button>
                            <div id="Demo1" class="dh-container">
                                <button onclick="openMenu(event,'RecSEntrees');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Entrées (1)
                                </button>
                                <button onclick="openMenu(event,'RecSPlat');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Plats principaux (1)
                                </button>
                                <button onclick="openMenu(event,'RecSDessert');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Desserts (1)
                                </button>
                            </div>
                            <button onclick="openMenu(event,'RecPub');"
                                    class="dh-button dh-block dh-theme-d2 dh-left-align">
                                Recettes Publiées (3)
                            </button>
                            <div id="Demo2" class="dh-container">
                                <button onclick="openMenu(event,'RecPubEntrees');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Entrées (1)
                                </button>
                                <button onclick="openMenu(event,'RecPubPlat');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Plats principaux (1)
                                </button>
                                <button onclick="openMenu(event,'RecPubDessert');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Desserts (1)
                                </button>
                            </div>
                            <button onclick="openMenu(event,'RecCre');"
                                    class="dh-button dh-block dh-theme-d2 dh-left-align">
                                Recettes Brouillons (3)
                            </button>
                            <div id="Demo3" class="dh-container">
                                <button onclick="openMenu(event,'RecCreEntree');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Entrées (1)
                                </button>
                                <button onclick="openMenu(event,'RecCrePlat');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Plats principaux (1)
                                </button>
                                <button onclick="openMenu(event,'RecCreDessert');"
                                        class="dh-button dh-block dh-theme-l5 dh-left-align">Desserts (1)
                                </button>
                            </div>
                            <div class="dh-container"></div>
                        </div>
                    </div>

                            <div class="col-sm-9 dh-white">
                                <!--Debut Toutes les Recettes sauvegardées-->
                                <div id="RecSauv" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity text-uppercase dh-medium"><strong>Recettes sauvegardées </strong></h5>

                                    <c:forEach items="${sessionScope.user.recipes}" var="recipe">
                                    <input type="hidden" id="recipeId" name="recipeId" value="${recipe.id}">
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle"
                                            src="data:${recipe.file.mimeType};base64, ${recipe.file.imageInBase64}"
                                            style="width:70px;height:70px" id="imRecS1">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <div>
                                                <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_1');">
                                                    <h4 style="font-size:medium" class="dh-left" id="tRecS1"> ${recipe.title} </h4>
                                                </a>
                                                <div class="dh-right dh-medium">
                                                    <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                    <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                        <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                        <div class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                            <a href="#" onclick="modifierRecette('modiRecette','tRecS1', 'descRecetS1', 'partRecetS1', 'cateRecetS1', 'imRecS1', 'dPRecS1', 'dCRecS1', 'recipeId');" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                            <a href="#" onclick="supprimerRecette('supRecette','recipeId');" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6"><span id="dPRecS1">${recipe.durationOfPreparationInMinutes}</span> min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6"><span id="dCRecS1">${recipe.durationOfCookingInMinutes}</span> min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_1" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span id="cateRecetS1">Dessert</span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span id="partRecetS1">3</span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" id="descRecetS1">
                                                    <p>
                                                        ${recipe.description}
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>

                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image3" style="width:70px;height:70px" id="imRecS2">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_2');">
                                                <h4 style="font-size:medium" class="dh-left" id="tRecS2">Burger Crispy Chicken</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  onclick="modifierRecette('modiRecette','tRecS2', 'descRecetS2', 'partRecetS2', 'cateRecetS2',
                                                'imRecS2', 'dPRecS2', 'dCRecS2');" style="text-decoration:none;"
                                                           class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#" onclick="supprimerRecette('supRecette');" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6"><span id="dPRecS2">2</span> min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6"><span id="dCRecS2">5</span> min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_2" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span id="cateRecetS2"> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span id="partRecetS2"> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" id="descRecetS2">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr class="dh-clear">

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" id="imRecS3" src="/images/image6.jpeg" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_3');">
                                                <h4 style="font-size:medium" class="dh-left" id="tRecS3">Plat méditéranéen</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#" onclick="modifierRecette('modiRecette', 'tRecS3', 'descRecetS3', 'partRecetS3', 'cateRecetS3',
                                                'imRecS3', 'dPRecS3', 'dCRecS3');" style="text-decoration:none;"
                                                           style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#" onclick="supprimerRecette('supRecette');" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6"><span id="dPRecS3">7</span> min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6"><span id="dCRecS3">22</span> min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_3" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span id="cateRecetS3"> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span id="partRecetS3"> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" id="descRecetS3">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr class="dh-clear">

                                    <br>
                                    <!--Fin Toutes les Recettes sauvegardées-->
                                </div>

                                <!-- Debut Entrées Recette sauvegardées-->
                                <div id="RecSEntrees" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase ">Recettes Sauvegardées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Entrées</strong></h5>
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image1" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">

                                            <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_4');"><h4 style="font-size:medium" class="dh-left"  > Côtelettes de porc</h4></a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#" id="modifEntSauv" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#" id="supEntSauv" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">3 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">25 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_4" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span id="cateRecet1"> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span id="partRecet1"> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" id="descRecet1">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="dh-clear">

                                    <!-- FIn Entrées Recette sauvegardées-->
                                </div>

                                <!-- Debut Plat Recette sauvegardées-->
                                <div id="RecSPlat" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase "> Recettes Sauvegardées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Plats principaux</strong></h5>
                                    <hr class="dh-clear">

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image6.jpeg" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_5');">
                                                <h4 style="font-size:medium" class="dh-left">Plat méditéranéen</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#" id="modifPlatSauv" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#" id="supPlatSauv" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">7 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">22 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_5" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span id="cateRecet2"> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span id="partRecet2"> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" id="descRecet2">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr class="dh-clear">

                                    <!-- FIn Plat Recette sauvegardées-->
                                </div>

                                <!-- Debut Dessert Recette sauvegardées-->
                                <div id="RecSDessert" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase"> Recettes Sauvegardées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Desserts</strong></h5>
                                    <hr class="dh-clear">

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image7" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_6');">
                                                <h4 style="font-size:medium" class="dh-left">Crèpes au Yaourt</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#" id="modifDeSauv" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#" id="supDeSauv" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">10 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">10 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_6" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span id="cateRecet3"> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span id="partRecet3"> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" id="descRecet3">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- FIn Dessert Recette sauvegardées-->
                                </div>

                                <!--Debut Toutes les Recettes publiées-->
                                <div id="RecPub" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity text-uppercase dh-medium"><strong>Recettes Publiées</strong></h5>
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image4" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_7');">
                                                <h4 style="font-size:medium" class="dh-left"> Tartre Feta au poulet</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">5 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">15 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_7" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span > Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span > 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" >
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="dh-clear">

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/recette4.jpeg" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_8');">
                                                <h4 style="font-size:medium" class="dh-left">Plat Algérien</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">10 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">30 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_8" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span > Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span > 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" >
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr class="dh-clear">

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image8" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a href="#" style="text-decoration: none;" onclick="detailRecette('detail_9');">
                                                <h4 style="font-size:medium" class="dh-left">Champignons à l'ail</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">5 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">20 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_9" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span > Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span > 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" >
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <hr class="dh-clear">



                                    <br>
                                    <!--Fin Toutes les Recettes publiées-->
                                </div>

                                <!--Debut Entrées Recettes publiées-->
                                <div id="RecPubEntrees" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase">Recettes Publiées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Entrées</strong></h5>
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image11" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_10');">
                                                <h4 style="font-size:medium">Salade d'été</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">3 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">5 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_10" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span > Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span > 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" >
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Fin Entrées Recettes Publiées-->
                                </div>

                                <!--Debut Plat Recettes publiées-->
                                <div id="RecPubPlat" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase">Recettes Publiées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Plats principaux</strong></h5>
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/recette4.jpeg" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_11');">
                                                <h4 style="font-size:medium">Plat Algérien </h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">10 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">30 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_11" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span > Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span > 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" >
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>




                                    <hr class="dh-clear">

                                    <!-- Fin Plat Recettes Publiées-->
                                </div>

                                <!--Debut Dessert Recettes publiées-->
                                <div id="RecPubDessert" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase">Recettes Publiées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Desserts</strong></h5>
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image4" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_12');">
                                                <h4 style="font-size:medium"> Tartre Feta au poulet</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">5 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">15 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_12" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span > Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span > 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" >
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="dh-clear">
                                    <!-- Fin Dessert Recettes publiées-->
                                </div>

                                <!--Debut Toutes les Recettes créées-->
                                <div id="RecCre" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase">Recettes créés</span></strong></h5>
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image5" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_13');">
                                                <h4 style="font-size:medium"> Tartre Feta au poulet</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">5 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">15 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_13" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span > Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span > 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" >
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr class="dh-clear">

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image2" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_14');">
                                                <h4 style="font-size:medium">Brochettes de crevettes grillées</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">4 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">12 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_14" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr/>

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image10" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_15');">
                                                <h4 style="font-size:medium">Cotelettes de porc</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">4 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">25 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_15" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr/>

                                    <!--Fin Toutes les Recettes créées-->
                                </div>

                                <!-- Debut Entrées Recette créées-->
                                <div id="RecCreEntree" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class=" text-uppercase">Recettes créées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Entrées</strong></h5>
                                    <hr class="dh-clear">


                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image2" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_16');">
                                                <h4 style="font-size:medium">Brochettes de crevettes grillées</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small"> <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">4 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><p>Cuisson</p></span>  <span class="dh-col s6">12 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_16" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- FIn Entreés Recette créées-->
                                </div>

                                <!-- Debut Plats Recette créées-->
                                <div id="RecCrePlat" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong> <span class="text-uppercase">Recettes créées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Plats principaux</strong></h5>
                                    <hr class="dh-clear">

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image10" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a  class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_17');">
                                                <h4 style="font-size:medium">Cotelettes de porc</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">4 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">25 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_17" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Type de recette : </b> <span > Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span > 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <!-- FIn Plats Recette créées-->
                                </div>

                                <!-- Debut Dessert Recette créées-->
                                <div id="RecCreDessert" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase">Recettes créées <i class="fa fa-chevron-right" aria-hidden="true"></i></span> Dessert</strong></h5>
                                    <hr class="dh-clear">

                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                            <img class="dh-circle" src="/images/image5" style="width:70px;height:70px">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                            <a class="dh-left" href="#" style="text-decoration: none;" onclick="detailRecette('detail_18');">
                                                <h4 style="font-size:medium"> Tartre Feta au poulet</h4>
                                            </a>
                                            <div class="dh-right dh-medium">
                                                <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                                <div class="dh-dropdown-hover dh-right dh-hide-small" > <!-- Pour survoler-->
                                                    <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                    <div  class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                        <a href="#"  style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="dh-row">
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Préparation</b></span>  <span class="dh-col s6">5 min</span>
                                                    </div>
                                                </div>
                                                <div class="dh-col s2">
                                                    <span>|</span>
                                                </div>
                                                <div class="dh-col s5">
                                                    <div class="dh-row">
                                                        <span class="dh-col s6"><b>Cuisson</b></span>  <span class="dh-col s6">15 min</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="detail_18" class="dh-hide dh-container detail dh-theme-l5">
                                                <div class="dh-row">
                                                    <p></p>
                                                    <div class="dh-col s6">

                                                        <p>
                                                            <b>Type de recette : </b> <span id="cateRecet"> Salade </span>
                                                        </p>
                                                    </div>
                                                    <div class="dh-col s6">
                                                        <p>
                                                            <b>Nombre de parts : </b> <span id="partRecet"> 4 </span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="dh-row" id="descRecet">
                                                    <p>
                                                        <b>Etapes de préparation : </b> <br/>
                                                        <span style="margin-left: 50px;">Etape 1 : </span><span> Epulcher</span><br/>
                                                        <span style="margin-left: 50px;">Etape 2 : </span><span> Cuire</span><br/>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="dh-clear">
                                    <!-- FIn Dessert Recette créées-->
                                </div>


                            </div>

                </div>


                <!--/div-->


            </div>

        </div>


        <!-- Right Column -->

        <div class="dh-col m3" style="padding-left: 16px;">

            <!-- Notifications-->
            <div class="dh-container dh-display-container dh-margin-bottom">
                <div class="dh-container dh-theme-d2">
                    <h4 class="dh-titre dh-opacity"><b>Notifications</b></h4>
                </div>
                <ul class="dh-ul dh-hoverable dh-white">
                    <li class="dh-padding">
                        <img src="/images/user1.png" alt="Image" class="dh-left dh-margin-right dh-circle"
                             style="width:50px">
                        <span class="dh-large">Kahina</span><br>
                        <span>A publié une nouvelle recette</span>
                    </li>
                    <li class="dh-padding">
                        <img src="/images/user2.png" alt="Image" class="dh-left dh-margin-right dh-circle"
                             style="width:50px">
                        <span class="dh-large">Hao</span><br>
                        <span>Vous invites à rejoindre son challenge</span>
                    </li>
                    <li class="dh-padding">
                        <img src="/images/profile.png" alt="Image" class="dh-left dh-margin-right dh-circle"
                             style="width:50px">
                        <span class="dh-large">Sabah</span><br>
                        <span>Aime une recette</span>
                    </li>

                </ul>
            </div>

            <!-- Annonces -->
            <!--br>
            <div class="dh-container dh-display-container dh-margin-bottom">
            <div class="dh-card">
              <div class="dh-container dh-white dh-padding" >
              <img src="images/recette5.jpeg" style="width:100%; height:150px; padding-top: 8px; "-->
            <!--small class="dh-right">Challenge</small-->
            <!--/div>
            <div class="dh-container dh-white" id="decouverte">
                <h4 class="dh-titre dh-opacity"><b>Ratatouille en 10 min  <span style="font-size: 13px;"> | <a href="#" style="text-decoration: none;">Challenge</a></span> </b></h4>
                <p >Imagine une recette de Ratatouille que tu vas réaliser en 10 min.
                  Oses comme tu peux.
                </p>
                <div class="dh-row">
                  <div class="dh-col s8">
                    <p class=""><button id="interesse" class="dh-button dh-white dh-border" onclick="FunctionInteressé(this)"><b> Intéresser <i class="fa fa-question"></i></b></button></p>
                  </div>
                  <div class="dh-col s4 dh-hide-small">
                    <p class="dh-right"><button class="dh-button dh-theme-d2" onclick="myFunction('demo3')"><b>Inscrits  </b> <span class="dh-tag dh-white"><span id="nbInscrit">3</span>/<span id="nbTotal">10</span></span></button></p>
                  </div-->
            <!--p class=""><button class="dh-button dh-center dh-white dh-border"><b><i class="fa fa-thumbs-up"></i> Intéressé</b></button></p-->
            <!--/div>
            <p><button id="autre" class="dh-button dh-light-grey dh-block"><span>Autres Challenges </span><i class="fa fa-angle-double-right" aria-hidden="true"></i></button></p-->

            <!--hr> <a style="text-decoration: none; " href="#"><h6 class="dh-center">Autres Challenges <i class="fa fa-angle-double-right" aria-hidden="true"></i></h6></a-->

            <!--/div>

            </div>
          </div-->
            <!-- End Right Column -->
        </div>


        <br>


    </div>
</div>
<!-- Fin Page Container-->

<!-- End Page Container -->

<script src="/scripts/dreamhunter.js"></script>
<script src="/scripts/recipe.js"></script>

<jsp:include page="modals.jsp"/>
<!-- Footer -->
<!--footer class="dh-container dh-theme-d3 dh-padding-16">
  <p style="text-align: center;">Copyright 2020  | DreamHunter</p>
</footer-->

<footer class="dh-center dh-theme-d3 dh-padding-32">
    <p>Copyright 2020  | DreamHunter</p>
</footer>



</body>
</html>