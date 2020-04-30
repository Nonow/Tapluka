<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>discussion</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style_1.css">
<link rel="stylesheet" href="/css/style_2.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="/static/scripts/dh.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
    body {
        font-family: "Times New Roman", Georgia, Serif;
        background-image: url("/images/accueil.jpeg");
    }

    h1, h2, h3, h4, h5, h6 {
        /*font-family: "Playfair Display";
        letter-spacing: 0px;*/
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
                        <a href="#" class="dh-bar-item dh-button" style="text-decoration: none;">Liste des Sujets</a>
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


<!-- Fin Barre de menus-->

<!-- Navbar on small screens -->
<div id="navDemo" class="dh-bar-block dh-theme-d2 dh-hide dh-hide-large dh-hide-medium dh-large">
    <a href="#" class="dh-bar-item dh-button dh-padding-large">Recette</a>
    <a href="#" class="dh-bar-item dh-button dh-padding-large">Conversation</a>
    <a href="#" class="dh-bar-item dh-button dh-padding-large">Challenge</a>
    <a href="#" class="dh-bar-item dh-button dh-padding-large">Profil</a>

</div>

<!-- Début section principale-->
<div class="dh-container dh-content" style="max-width:1400px;margin-top:80px">

    <div class="dh-row">
        <!-- section du milieu -->
        <div class="dh-col m9 dh-theme-l5">

            <div id="listeConv" class="conversation">
                <div class="dh-center dh-container">
                    <b><h4 class="dh-opacity">TOUS LES SUJETS DE DISCUSSIONS</h4></b>
                    <hr/>
                </div>

                <div class="dh-container dh-display-container dh-margin-bottom">
                    <!--div class="dh-container dh-theme-d2">
                      <h4 class="dh-titre dh-opacity"><b>Notifications</b></h4>
                    </div-->
                    <ul class="dh-ul dh-white">
                        <c:forEach items="${subjects}" var="subject">
                            <input type="hidden" id="subjectId${subject.id}" value="subjectId${subject.id}" name="subjectId${subject.id}"/>
                            <li class="">
                                <div class="dh-row">
                                    <div class="dh-col s2">
                                        <a href="#" onclick="openConv(event, subjectId${subject.id});"> <img
                                                src="data:${subject.file.mimeType};base64, ${subject.file.imageInBase64}"
                                                alt="Image" class="dh-left dh-margin-right"
                                                style="width:70px; height:70px;"></a>
                                    </div>
                                    <div class="dh-col s10">
                                        <a href="#" onclick="openConv(event, 'Sconversation${subject.id}', 'subjectId${subject.id}');"
                                           style="text-decoration: none;"><h6
                                                class="dh-large dh-opacity">${subject.title}</h6></a><span
                                            class="dh-small dh-opacity"> (${subject.comments.size()} discussions)</span>
                                        <p class="dh-left">Par ${subject.user.firstName} |
                                            le ${subject.createDate}</p>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                        <li class="">
                            <div class="dh-row">
                                <div class="dh-col s2">
                                    <a href="#"><img src="/images/magret.jpg" alt="Image"
                                                     class="dh-left dh-margin-right"
                                                     style="width:70px; height:70px;"></a>
                                </div>
                                <div class="dh-col s10">
                                    <a href="#" onclick="openConv(event, 'Sconversation22');"
                                       style="text-decoration: none;"><h6 class="dh-large dh-opacity">Comment chauffer
                                        un magret au canard ? </h6></a> <span class="dh-small dh-opacity">(5 discussions)</span>
                                    <p class="dh-left">Par Kahina | le 11 avril 2020</p>
                                </div>
                            </div>
                        </li>
                        <li class="">
                            <div class="dh-row">
                                <div class="dh-col s2">
                                    <a href="#"><img src="/images/champignon.jpg" alt="Image"
                                                     class="dh-left dh-margin-right"
                                                     style="width:70px; height:70px;"></a>
                                </div>
                                <div class="dh-col s10">
                                    <a href="#" onclick="openConv(event, 'Sconversation23');"
                                       style="text-decoration: none;"><h6 class="dh-large dh-opacity">Congélation des
                                        champignons pieds de mouton </h6></a><span class="dh-small dh-opacity">(2 discussions)</span>
                                    <p class="dh-left">Par Jalil | le 24 mars 2020</p>
                                </div>
                            </div>
                        </li>
                        <li class="">
                            <div class="dh-row">
                                <div class="dh-col s2">
                                    <a href="#"><img src="/images/boeuf.jpg" alt="Image" class="dh-left dh-margin-right"
                                                     style="width:70px; height:70px;"></a>
                                </div>
                                <div class="dh-col s10">
                                    <a href="#" onclick="openConv(event, 'Sconversation24');"
                                       style="text-decoration: none;"><h6 class="dh-large dh-opacity">Boeuf bourguignon,
                                        ma viande est dure </h6></a><span
                                        class="dh-opacity dh-small">(9 discussions)</span>
                                    <p class="dh-left">Par MichDavh | le 03 janvier 2020</p>
                                </div>
                            </div>
                        </li>
                        <li class="">
                            <div class="dh-row">
                                <div class="dh-col s2">
                                    <a href="#"><img src="/images/pintade.png" alt="Image"
                                                     class="dh-left dh-margin-right"
                                                     style="width:70px; height:70px;"></a>
                                </div>
                                <div class="dh-col s10">
                                    <a href="#" onclick="openConv(event, 'Sconversation25');"
                                       style="text-decoration: none;"><h6 class="dh-large dh-opacity">Comment faire une
                                        pintade farcie aux abricots </h6></a> <span class="dh-small dh-opacity">(12 discussions)</span>
                                    <p class="dh-left">Par Sabah | le 08 février 2020</p>
                                </div>
                            </div>
                        </li>


                    </ul>
                </div>
            </div>

            <!-- sujet1-->
            <c:forEach items="${subjects}" var="subject">
                <div id="Sconversation${subject.id}" class="dh-container conversation" style="display: none;">
                    <h5 class="dh-opacity dh-medium dh-center"><a onclick="openConv(event, 'listeConv');" href="#"
                                                                  title="Retour à la liste des sujets"> <i
                            class="fa fa-arrow-left" aria-hidden="true"></i> </a> | <strong><span class="text-uppercase"> ${subject.title} </span></strong>
                    </h5>
                    <hr/>
                    <div class="dh-container">
                        <c:forEach items="${subject.comments}" var="comment">
                            <div class="dh-row dh-white dh-content dh-container dh-margin">
                                <div class="dh-col s2 dh-padding">
                                    <img class="dh-round dh-margin-right dh-circle" src="/images/user1.png"
                                         style="height:30px; width:30px;">
                                    <span class="dh-opacity dh-large" style="display: block;">Sarah</span>
                                    <small>Le ${subject.createDate} </small>
                                </div>
                                <div class="dh-col s10 dh-padding dh-justify">
                                    <p>
                                        ${comment.content}
                                    </p>
                                    <p class="dh-left">
                                        <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                                class="fa fa-thumbs-up"></i> Aimé</b></button>
                                    </p>
                                    <p class="dh-right">
                                        <button class="dh-button dh-theme-d2" onclick="myFunction('reponse')"><b>Répondre </b>
                                        </button>
                                    </p>
                                    <br/><br/>
                                    <div id="reponse" contenteditable="true"
                                         style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                         class="dh-border">
                                        <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                    <!-- Fin sujet 1-->
                </div>
            </c:forEach>

            <!-- sujet 10-->
            <div id="Sconversation22" class="dh-container conversation" style="display: none;">
                <h5 class="dh-opacity dh-medium dh-center"><a onclick="openConv(event, 'listeConv');" href="#"
                                                              title="Retour à la liste des sujets"> <i
                        class="fa fa-arrow-left" aria-hidden="true"></i> </a> | <strong><span class="text-uppercase"> Comment chauffer un magret au canard ?</span></strong>
                </h5>
                <hr/>
                <div class="dh-container">
                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/user1.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Sarah</span>
                            <small>Le 9 mars 2020 à 11h50</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour à tous, <br/>
                                J'ai une question un peu générale. Nous avons un hachoir à viande et donc nous aimerions
                                faire nos propres steak haché/ boulettes / saucisses etc.
                                Sachant que nous ne mangeons ni bœuf, ni veau, quelles pièces de viande utiliser pour
                                les différents types de préparation? <br/>
                                Merci d'avance de votre aide
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/user2.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Odette</span>
                            <small>Le 12 mars 2020 à 10h00</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour, <br/>
                                J'utilise de la viande bovine, c'est très bon https://www.kupino.fr/catalogues/aldi
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse1')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse1" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/profile.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Judith</span>
                            <small>Le 12 mars 2020 à 10h20</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour, <br/>
                                Regardes sur le site Journal des femmes
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse2')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse2" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Fin sujet 2-->
            </div>

            <!-- sujet 3-->
            <div id="Sconversation23" class="dh-container conversation" style="display: none;">
                <h5 class="dh-opacity dh-medium dh-center"><a onclick="openConv(event, 'listeConv');" href="#"
                                                              title="Retour à la liste des sujets"> <i
                        class="fa fa-arrow-left" aria-hidden="true"></i> </a> | <strong><span class="text-uppercase"> Congélation des champignons pieds de mouton </span></strong>
                </h5>
                <hr/>
                <div class="dh-container">
                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/user1.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Sarah</span>
                            <small>Le 9 mars 2020 à 11h50</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour à tous, <br/>
                                J'ai une question un peu générale. Nous avons un hachoir à viande et donc nous aimerions
                                faire nos propres steak haché/ boulettes / saucisses etc.
                                Sachant que nous ne mangeons ni bœuf, ni veau, quelles pièces de viande utiliser pour
                                les différents types de préparation? <br/>
                                Merci d'avance de votre aide
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/user2.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Odette</span>
                            <small>Le 12 mars 2020 à 10h00</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour, <br/>
                                J'utilise de la viande bovine, c'est très bon https://www.kupino.fr/catalogues/aldi
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse1')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse1" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/profile.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Judith</span>
                            <small>Le 12 mars 2020 à 10h20</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour, <br/>
                                Regardes sur le site Journal des femmes
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse2')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse2" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Fin sujet 3-->
            </div>

            <!-- sujet 4-->
            <div id="Sconversation24" class="dh-container conversation" style="display: none;">
                <h5 class="dh-opacity dh-medium dh-center"><a onclick="openConv(event, 'listeConv');" href="#"
                                                              title="Retour à la liste des sujets"> <i
                        class="fa fa-arrow-left" aria-hidden="true"></i> </a> | <strong><span class="text-uppercase"> Boeuf bourguignon, ma viande est dure </span></strong>
                </h5>
                <hr/>
                <div class="dh-container">
                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/user1.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Sarah</span>
                            <small>Le 9 mars 2020 à 11h50</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour à tous, <br/>
                                J'ai une question un peu générale. Nous avons un hachoir à viande et donc nous aimerions
                                faire nos propres steak haché/ boulettes / saucisses etc.
                                Sachant que nous ne mangeons ni bœuf, ni veau, quelles pièces de viande utiliser pour
                                les différents types de préparation? <br/>
                                Merci d'avance de votre aide
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/user2.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Odette</span>
                            <small>Le 12 mars 2020 à 10h00</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour, <br/>
                                J'utilise de la viande bovine, c'est très bon https://www.kupino.fr/catalogues/aldi
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse1')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse1" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/profile.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Judith</span>
                            <small>Le 12 mars 2020 à 10h20</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour, <br/>
                                Regardes sur le site Journal des femmes
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse2')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse2" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Fin sujet 4-->
            </div>

            <!-- sujet5-->
            <div id="Sconversation25" class="dh-container conversation" style="display: none;">
                <h5 class="dh-opacity dh-medium dh-center"><a onclick="openConv(event, 'listeConv');" href="#"
                                                              title="Retour à la liste des sujets"> <i
                        class="fa fa-arrow-left" aria-hidden="true"></i> </a> | <strong><span class="text-uppercase"> Comment faire une pintade farcie aux abricots</span></strong>
                </h5>
                <hr/>
                <div class="dh-container">
                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/user1.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Sarah</span>
                            <small>Le 9 mars 2020 à 11h50</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour à tous, <br/>
                                J'ai une question un peu générale. Nous avons un hachoir à viande et donc nous aimerions
                                faire nos propres steak haché/ boulettes / saucisses etc.
                                Sachant que nous ne mangeons ni bœuf, ni veau, quelles pièces de viande utiliser pour
                                les différents types de préparation? <br/>
                                Merci d'avance de votre aide
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/user2.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Odette</span>
                            <small>Le 12 mars 2020 à 10h00</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour, <br/>
                                J'utilise de la viande bovine, c'est très bon https://www.kupino.fr/catalogues/aldi
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse1')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse1" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                    <div class="dh-row dh-white dh-content dh-container dh-margin">
                        <div class="dh-col s2 dh-padding">
                            <img class="dh-round dh-margin-right dh-circle" src="/images/profile.png"
                                 style="height:30px; width:30px;">
                            <span class="dh-opacity dh-large" style="display: block;">Judith</span>
                            <small>Le 12 mars 2020 à 10h20</small>
                        </div>
                        <div class="dh-col s10 dh-padding dh-justify">
                            <p>
                                Bonjour, <br/>
                                Regardes sur le site Journal des femmes
                            </p>
                            <p class="dh-left">
                                <button class="dh-button dh-theme-d2 dh-border" onclick="aiméCommentaire(this)"><b><i
                                        class="fa fa-thumbs-up"></i> Aimé</b></button>
                            </p>
                            <p class="dh-right">
                                <button class="dh-button dh-theme-d2" onclick="myFunction('reponse2')"><b>Répondre </b>
                                </button>
                            </p>
                            <br/><br/>
                            <div id="reponse2" contenteditable="true"
                                 style="display:none; position:relative; top:45px; width:400px; height:40px; left:90px;"
                                 class="dh-border">
                                <!--textarea style="width:50%;" class="form-control" rows="1" name="comment" placeholder=""> </textarea> <br-->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Fin sujet 5-->
            </div>

        </div>

        <!-- section à droite-->
        <div class="dh-col m3">
            <div class="dh-container dh-display-container dh-margin-bottom" style="display: none;">
                <div class="dh-container dh-theme-d2">
                    <h4 class="dh-titre dh-opacity"><b>Notifications</b></h4>
                </div>
                <ul class="dh-ul dh-hoverable dh-white">
                    <li class="">
                        <img src="/images/user1.png" alt="Image" class="dh-left dh-margin-right dh-circle"
                             style="width:50px">
                        <span class="dh-large">Kahina</span><br>
                        <span>A publié une nouvelle recette</span>
                    </li>
                    <li class="">
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
        </div>
    </div>
</div>
<!-- Fin  section principale-->

<!-- Début Blocs modaux-->
<script src="/scripts/dreamhunter.js"></script>
<jsp:include page="modals.jsp"/>
<!-- Fin blocs modaux-->

<!-- Footer -->
<!--footer class="dh-container dh-theme-d3 dh-padding-16">
  <p style="text-align: center;">Copyright 2020  | DreamHunter</p>
</footer-->

<footer class="dh-center dh-theme-d2 dh-padding-32">
    <p>Copyright 2020  | DreamHunter</p>
</footer>


<script>
    /*Modifier Publication*/
    let mAvis = document.getElementById('modifierPub');
    mAvis.addEventListener('click', () => {
        let pmAv1 = document.getElementById('pub1_avant');

        let pmAp1 = document.getElementById("pub_1_apres");
        pmAp1.contentEditable = true;
        pmAp1.textContent = pmAv1.textContent;
        document.getElementById("publiAv").style.display = 'block';
    });

    /* Supprimer Publication*/
    let sAvis = document.getElementById('supAvis');
    sAvis.addEventListener('click', () => {
        /*let pAv1 = document.getElementById('pub1_avant');

        let apP = document.getElementById("pub_1_apres");
        apP.contentEditable = true;
        apP.textContent= pAv1.textContent;*/
        document.getElementById("supAv1").style.display = 'block';
    });

    function menuD(id) {
        var x = document.getElementById(id);
        if (x.className.indexOf("dh-show") == -1) {
            x.className += " dh-show";
            x.previousElementSibling.className += " dh-theme-d1";
        } else {
            x.className = x.className.replace("dh-show", "");
            x.previousElementSibling.className =
                x.previousElementSibling.className.replace(" dh-theme-d1", "");
        }
    }

    /* Modifier Publication 1*/
    let modifAv = document.getElementById('modifAvis');
    modifAv.addEventListener('click', () => {
        let pub1_avant = document.getElementById('pub1_avant');
        let pub_1_apres = document.getElementById('pub1_apres');
        pub_1_apres.contentEditable = true;
        pub_1_apres.textContent = pub1_avant.textContent;
        document.getElementById('pub1').style.display = 'block';
    });

    /* Fonction qui change le statut */
    function FunctionInteressé(x) {
        x.style.fontWeight = "bold";
        x.innerHTML = "✓ Interessé";
        /* Incrémentation du nombre d'inscrits*/
        let inscrit = document.getElementById('nbInscrit');
        let total = document.getElementById('nbTotal');
        let total_entier = parseInt(total.textContent);
        let inscrit_entier = parseInt(inscrit.textContent);

        inscrit_entier++;
        if (inscrit_entier == total_entier)
            inscrit.textContent = total_entier;

        inscrit.textContent = inscrit_entier;


        /*do{
          inscrit_entier++;
          inscrit.textContent = inscrit_entier;
        }while(inscrit_entier==total_entier)*/
    }

    // Tabbed Menu
    function openConv(evt, convName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("conversation");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }

        document.getElementById(convName).style.display = "block";
    }

    document.getElementById("listeConv").click();

    /* Aimé un commentaire dans une discussion*/
    function aiméCommentaire(x) {
        x.style.fontWeight = "bold";
        x.innerHTML = "✓ Aimé";

    }


</script>

</body>
</html>
  

