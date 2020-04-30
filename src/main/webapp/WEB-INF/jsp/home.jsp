<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<title>Fast Cook</title>
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
                    <a href="#" class="" style="text-decoration: none; position:relative; top:5px;">
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
                <!-- Début Menu Notification" -->
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
                    
             <!-- Fin Menu Notification" -->

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


<!-- Page Container -->
<div class="dh-container dh-content" style="max-width:1400px;margin-top:80px">
    <!-- The Grid -->
    <div class="dh-row">
        <!-- Left Column -->
        <div class="dh-col m2">
            <!--div style="border: 1px solid transparent;">

            </div-->
            <!-- Profile -->
            <!-- Debut profile -->
            <div class=" dh-hide" id="monProfil">
                <div class="dh-card dh-round dh-white">
                    <div class="dh-container">
                        <a href="/profile" style="text-decoration: none;"><h5 class="dh-center dh-opacity"><b>Mon
                            Profil</b></h5></a>
                        <hr>
                        <p class="dh-center">
                            <img src="/images/profile.png" class="dh-circle" style="height:106px;width:106px"
                                 alt="profil">
                        </p>
                        <hr>
                        <p><i class="fa fa-pencil fa-fw dh-margin-right dh-text-theme"></i> Etudiant</p>
                        <p><i class="fa fa-home fa-fw dh-margin-right dh-text-theme"></i> Paris, France</p>
                        <p><i class="fa fa-birthday-cake fa-fw dh-margin-right dh-text-theme"></i>10 Avril 1998</p>
                    </div>
                </div>
                <br>
                <!-- fin profile-->


            </div>
            <br>
        </div>

        <!-- Début Colonne du milieu -->
        <div class="dh-col m7">

            <!-- Début Poster Avis -->
           <div class="dh-row-padding">
            <div class="dh-col m12">
              <div class="dh-card dh-round dh-white">
                <div class="dh-container dh-padding">
                  <h6 class="dh-opacity"><strong>Des idées, des conseils, Exprimez-vous ici !!!</strong></h6><hr>
                  <div contenteditable="true" onclick="publierAvis()" class="dh-border dh-padding" id="postAvis" style="height:40px;"></div>
                  <br/>
                </div>
              </div>
            </div>
          </div>
          <!--Fin Poster Avis-->

            <!-- Début Display Avis-->
            <c:if test="${not empty publications}">
            <c:forEach items="${publications}" var="publication">
              <input type="hidden" id="publicationId${publication.id}" name="publicationId" value="${publication.id}" />
              <div class="dh-container dh-card dh-white dh-round dh-margin"><br>
                  <img src="data:${publication.getUser().file.mimeType};base64, ${publication.getUser().file.imageInBase64}" alt="${publication.user.username}" class="dh-left dh-circle dh-margin-right"
                       style="width:60px">
                  <div class="dh-right">
                      <span>${publication.createDate} </span> <span style="margin-right: 4px;"> | </span>
                      <div class="dh-dropdown-hover dh-right" id="modProf1"> <!-- Pour survoler-->
                          <a style="text-decoration:none;" class="" href="#" id="ic_modifSup">
                              <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                          </a>

                          <div id="edit" class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                              <a href="#" onclick="modifierAvis('avisPub','publicationId${publication.id}');" style="text-decoration:none;" class="dh-bar-item dh-button">modifier</a>
                              <a href="#" onclick="supprimerAvis('publicationId${publication.id}');" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                          </div>

                      </div>
                  </div>
                  <span class="dh-opacity"
                        style="font-size:16px; font-family:'Segoe UI',Arial,sans-serif; font-weight:400;"><b>${publication.user.username} | Idées</b></span><br>
                  <hr class="dh-clear">
                  <p id="avisPub">${publication.content}</p>
                    <button class="dh-button dh-white dh-border dh-left" onclick="$.post('/newReaction?pubId=${publication.id}&reactionType=${publication.reactionType}');likeFunction(this)"><b><i class="fa fa-thumbs-up"></i><c:if test="${ publication.reactionType eq 0 }" >LIKE</c:if><c:if test="${ publication.reactionType eq 1 }" >✓ LIKED</c:if></b></button>
                  <p><button class="dh-button dh-theme-d1 dh-right" onclick="voirComment('com', 'sepCom')" id="btnCom"><b>Reponses  </b> <span class="dh-tag dh-white">${publication.comments.size()}</span></button></p>
                  <span class="dh-clear"></span>
                  <div  id="com" style="display:none">
                     <hr/>
                     <div class="dh-col-s4"></div>

                      <div style="margin-left: 70px;">
                          <c:if test="${not empty publication.comments}" >
                              <c:forEach items="${publication.comments}" var="comment">
                                <div class="dh-row">
                                  <img src="data:${comment.user.file.mimeType};base64, ${comment.user.file.imageInBase64}" style="width:30px;" class="dh-circle dh-col s2 dh-margin-right">
                                  <div class="dh-col s10" style="position : relative; top:-10px;">
                                    <h4 >
                                    <span id="idUserComment">"${comment.user.username}"</span>
                                    <span class="dh-opacity dh-medium"><span id="dateCom">Le ${comment.createDate}</span> </span></h4>
                                    <p id="c">${comment.content}</p>
                                  </div>
                                </div>
                              </c:forEach>
                          </c:if>
                      </div>
                       <div class="dh-row" style="margin-left: 70px;">

                          <img src="images/profile.png" style="width:30px;" class="dh-circle dh-col s2 dh-margin-right">
                          <form:form enctype="multipart/form-data" action="newComment" method="post" modelAttribute="newComment"  class="dh-col s10">
                            <form:input type="hidden" id="pubIdToComment" path="publicationId" value="${publication.id}" name="pubIdToComment" />
                            <div class="dh-row">
                               <form:textarea style="width:70%;"  class="dh-border dh-padding dh-white dh-col s10" rows="1"  name="comment" id="comment" path="content" placeholder="Laisses ton commentaire ici !!!"/>
                              <form:errors cssClass="error" path="content"/>
                              <button class=" dh-section" type="submit" id="comment" style="margin-left: 4px; background-color: transparent;">
                                <i class="fa fa-paper-plane" style="color:#4d636f; position: relative; top: 1px;" aria-hidden="true"></i>
                              </button>
                            </div>
                          </form:form>
                      </div>
                  </div>
                  <br/>
            </div>
            </c:forEach>
            </c:if>
            <div class="dh-container dh-card dh-white dh-round dh-margin"><br>
                <img src="/images/user2.png" alt="Mich Davh" class="dh-left dh-circle dh-margin-right"
                     style="width:60px">
                <div class="dh-right">
                    <span>1 min </span> <span style="margin-right: 4px;"> | </span>
                    <div class="dh-dropdown-hover dh-right" id="modProf1"> <!-- Pour survoler-->
                        <a style="text-decoration:none;" class="" href="#" id="ic_modifSup">
                            <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
                <span class="dh-opacity"
                      style="font-size:16px; font-family:'Segoe UI',Arial,sans-serif; font-weight:400;"><b>Mich Davh | Idées</b></span><br>
                <hr class="dh-clear">
                <p id="avisPub">Manger 5 fruits et Légumes par Jour.</p>
                <button class="dh-button dh-white dh-border dh-left" onclick="likeFunction(this)"><b><i class="fa fa-thumbs-up"></i> Like</b></button>
                <p><button class="dh-button dh-theme-d1 dh-right" onclick="voirComment('com', 'sepCom')" id="btnCom"><b>Reponses  </b> <span class="dh-tag dh-white">1</span></button></p>
                <span class="dh-clear"></span>
                <div  id="com" style="display:none">
                   <hr/>
                   <div class="dh-col-s4"></div>

                    <div style="margin-left: 70px;">
                        <div class="dh-row">
                          <img src="images/user1.png" style="width:30px;" class="dh-circle dh-col s2 dh-margin-right">
                          <div class="dh-col s10" style="position : relative; top:-10px;">
                            <h4 ><span id="idUserComment">Jalil</span> <span class="dh-opacity dh-medium"><span id="dateCom">3 mars 2020</span>, <span></span id="heureCom">6:32 </span></h4>
                            <p id="c">Bon conseil mec !</p>
                          </div>
                        </div>
                    </div>
                     <div class="dh-row" style="margin-left: 70px;">

                        <img src="images/profile.png" style="width:30px;" class="dh-circle dh-col s2 dh-margin-right">
                        <form:form enctype="multipart/form-data" action="newComment" method="post" modelAttribute="newComment"  class="dh-col s10">
                          <div class="dh-row">
                             <form:textarea style="width:70%;"  class="dh-border dh-padding dh-white dh-col s10" rows="1"  name="comment" id="comment" path="content" placeholder="Laisses ton commentaire ici !!!"/>
                            <form:errors cssClass="error" path="content"/>
                            <button class=" dh-section" type="submit" id="comment" style="margin-left: 4px; background-color: transparent;">
                              <i class="fa fa-paper-plane" style="color:#4d636f; position: relative; top: 1px;" aria-hidden="true"></i>
                            </button>
                          </div>
                        </form:form>
                    </div>
                </div>
                <br/>
            </div>
            <!-- Fin Display Avis -->
            
        <!-- Début Display Publication Recette-->

            <div class="dh-container dh-card dh-white dh-round dh-margin"><br>
        <img src="images/user1.png" alt="Sabah" class="dh-left dh-circle dh-margin-right" style="width:60px">
        <div class="dh-right">
          <span>15 min </span> <span style="margin-right: 4px;"> | </span>
          <!--div class="dh-dropdown-click dh-right" id="modProf1"--> <!-- Pour le clic-->
          <div class="dh-dropdown-hover dh-right" id="modProf2"> <!-- Pour survoler-->
            <a style="text-decoration:none;" class="" href="#" id="ic_modifSupRec"> 
              <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
            </a>
            <div id="edit" class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
              <a href="#" onclick="modifierRecette('modRecet','titreR', 'descRecet', 'partRecet', 'cateRecet', 
              'imageRec', 'durRecP', 'durRecC');"
               style="text-decoration:none;" class="dh-bar-item dh-button">modifier</a>
              <a href="#" onclick="supprimerRecette('supRecette');" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
            </div>
          </div>
        </div>
         <span class="dh-opacity" style="font-size:16px; font-family:'Segoe UI',Arial,sans-serif; font-weight:400;"><b>Jalil | Recette</b></span><br>
        <hr class="dh-clear">

        <p id="titreR">Gateaux d'Algéries</p>
          <div class="dh-row-padding" style="margin:0 -16px">
            <div class="dh-half">
              <img id="imageRec" src="images/recette7.jpeg" style="width:100%" alt="Gateau 1" class="dh-margin-bottom">
            </div>
           <div class="dh-half">
            <div class="dh-row">
                    <span class="dh-half">
                      <b>Catégorie : </b> <span id="cateRecet"> Gateau  </span>
                    </span>
                  <span class="dh-half">
                    <b>Nombre de parts : </b><span id="partRecet"> 4 </span>
                  </span>
                
             </div>
             <div class="dh-row">
                <span class="dh-col s6">
                  <b>Préparation : </b> <span id="durRecP"> 4 </span> min
                </span>
                
             
                <span class="dh-col s6">
                  <b>Cuisson : </b> <span id="durRecC"> 10 </span> min
                </span>
              
            </div>
            <div>
               <p id="descRecet">
                <b>Etapes de préparation : </b> <br/>
                <span style="margin-left: 50px;"><i><b>Etape 1 : </b></i></span><span> <i>Epulcher</i></span><br/>
                <span style="margin-left: 50px;"><i><b>Etape 2 : </b></i></span><span> <i>Cuire</i></span><br/>
               </p>
             
             </div>
           </div>
        </div>

        <div class=" dh-left" style="display: inline;">
          <button class="dh-button dh-white dh-border" onclick="likeFunction(this)">
            <b><i class="fa fa-thumbs-up"></i> Like</b>
          </button>
          <div style="display: inline; position: relative; top: 10px; margin-left: 2px;">
            <span onclick="noter(this)" id="1one" style="font-size:30px; cursor:pointer;"  class="fa fa-star"></span>
            <span onclick="noter(this)" id="2one"  style="font-size:30px; cursor:pointer;" class="fa fa-star "></span>
            <span onclick="noter(this)" id="3one"  style="font-size:30px; cursor:pointer;" class="fa fa-star "></span>
            <span onclick="noter(this)" id="4one"  style="font-size:30px; cursor:pointer;" class="fa fa-star"></span>
            <span onclick="noter(this)" id="5one"  style="font-size:30px; cursor:pointer;" class="fa fa-star"></span>  
          </div>
           <span style="display: inline; position: relative; top: 7px;" class="dh-opacity">(Note : <span id="note">0</span>/5)</span> 
        </div>
        
        <p><button class="dh-button dh-theme-d1 dh-right" onclick="voirComment('com2', 'sepCom')" id="btnCom"><b>Reponses  </b> <span class="dh-tag dh-white">1</span></button></p>
        <span class="dh-clear"></span>
        <div  id="com2" style="display:none">
           <hr/>
           <div class="dh-col-s4"></div>
            
            <div style="margin-left: 70px;">
                <div class="dh-row">
                  <img src="images/user2.png" style="width:30px;" class="dh-circle dh-col s2 dh-margin-right">
                  <div class="dh-col s10" style="position : relative; top:-10px;">
                    <h4 ><span id="idUserComment">Sarah</span> <span class="dh-opacity dh-medium"><span id="dateCom">2 mars 2020</span>, <span></span id="heureCom">18:09 </span></h4>
                    <p id="c">Très bonne recette.</p>
                  </div>
                </div>
            </div>
            <div class="dh-row" style="margin-left: 70px;">
              
              <img src="images/profile.png" style="width:30px;" class="dh-circle dh-col s2 dh-margin-right">
              <form action="#" class="dh-col s10">
                <div class="dh-row">
                  <textarea id="comment" style="width:70%;" class="form-control dh-col s10" rows="1" name="comment" placeholder="Laisses ton commentaire ici !!!">
                  </textarea>
                  <button class=" dh-section" type="submit" id="comment" style="margin-left: 4px; background-color: transparent;">
                    <i class="fa fa-paper-plane" style="color:#4d636f; position: relative; top: 1px;" aria-hidden="true"></i>
                  </button>
                </div>
              </form>
          </div>
        </div>
       
        <br/>
      </div>
      <!--Fin Display Publication Recette-->

            <!-- Fin  Colonne du milieu -->
        </div>

        <!-- Début colonne de droite -->

        <div class="dh-col m3">

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

            <!--/div-->
            <br>
            <div class="dh-container dh-display-container dh-margin-bottom">
                <div class="dh-card">
                    <div class="dh-container dh-white dh-padding">
                        <img src="/images/recette5.jpeg" style="width:100%; height:150px; padding-top: 8px; ">
                        <!--small class="dh-right">Challenge</small-->
                    </div>
                    <div class="dh-container dh-white" id="decouverte">
                        <h4 class="dh-titre dh-opacity"><b>Ratatouille en 10 min <span style="font-size: 13px;"> | <a
                                href="#" style="text-decoration: none;">Challenge</a></span> </b></h4>
                        <p>Imagine une recette de Ratatouille que tu vas réaliser en 10 min.
                            Oses comme tu peux.
                        </p>
                        <div class="dh-row">
                            <div class="dh-col s8">
                                <p class="">
                                    <button id="interesse" class="dh-button dh-white dh-border"
                                            onclick="FunctionInteressé(this)"><b> Intéresser <i
                                            class="fa fa-question"></i></b></button>
                                </p>
                            </div>
                            <div class="dh-col s4 dh-hide-small">
                                <p class="dh-right">
                                    <button class="dh-button dh-theme-d2" onclick="myFunction('demo3')"><b>Inscrits </b>
                                        <span class="dh-tag dh-white"><span id="nbInscrit">3</span>/<span id="nbTotal">10</span></span>
                                    </button>
                                </p>
                            </div>
                            <!--p class=""><button class="dh-button dh-center dh-white dh-border"><b><i class="fa fa-thumbs-up"></i> Intéressé</b></button></p-->
                        </div>
                        <p><a href="/challenges" style="text-decoration:none;" id="autre"
                              class="dh-button dh-light-grey dh-block"><span>Autres Challenges </span><i
                                class="fa fa-angle-double-right" aria-hidden="true"></i></a></p>

                        <!--hr> <a style="text-decoration: none; " href="#"><h6 class="dh-center">Autres Challenges <i class="fa fa-angle-double-right" aria-hidden="true"></i></h6></a-->

                    </div>

                </div>
            </div>
        </div>


        <br>


        <!-- Fin Colonne de droite -->
    </div>

    <!-- End Grid -->
</div>

<!-- End Page Container -->

<!-- Début Blocs modaux-->
<script src="/scripts/dreamhunter.js"></script>
<script src="/scripts/home.js"></script>
<script src="/scripts/recipe.js"></script>

<jsp:include page="modals.jsp"/>
<!-- Fin blocs modaux-->

<!-- Footer -->
<!--footer class="dh-container dh-theme-d3 dh-padding-16">
  <p style="text-align: center;">Copyright 2020  | DreamHunter</p>
</footer-->

<footer class="dh-center dh-theme-d2 dh-padding-32">
    <p>Copyright 2020  | DreamHunter</p>
</footer>





</body>
</html> 
