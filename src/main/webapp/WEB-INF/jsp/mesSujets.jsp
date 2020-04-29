<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>Mes Sujets de conversation</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style_1.css">
<link rel="stylesheet" href="css/style_2.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
body {
  font-family: "Times New Roman", Georgia, Serif;
  background-image: url("images/accueil.jpeg");
}

h1, h2, h3, h4, h6 {
  /*font-family: "Playfair Display";
  letter-spacing: 0px;*/
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
                
                <div class="dh-content " id="menu" >
                   
                    <!--div class="dh-col s8"-->
                    <div class="row">
                        <div class="col-sm-3 dh-theme-l5 ">
                            <div class="dh-center">
                                <!--h6>Tous mes Sujets</h6--><br/>
                                <button id="myLink" onclick="openMenu(event, 'sujetCree');" style="width:100%" class="dh-button dh-block dh-theme-d2 dh-left-align ">
                                    Mes Sujets créées (<span>3</span>)
                                </button>
                                <div id="Demo1" class="dh-container">
                                    <button onclick="openMenu(event, 'sujetEntrees');" class="dh-button dh-block dh-theme-l5 dh-left-align">Entrées (<span>1</span>) </button>
                                    <button onclick="openMenu(event, 'sujetPlat');" class="dh-button dh-block dh-theme-l5 dh-left-align">Plats principaux (<span>1</span>) </button>
                                    <button onclick="openMenu(event, 'sujetDessert');" class="dh-button dh-block dh-theme-l5 dh-left-align">Desserts (<span>1</span>)</button>
                                </div>
                                <div class="dh-container"></div>
                            </div>
                        </div>
                        <div class="col-sm-9 dh-white">
                            <!--Debut Toutes mes sujets créés-->

                            <div id="sujetCree" class="dh-container menu dh-padding">
                                    <h5 class="dh-opacity text-uppercase dh-medium"><strong>Tous mes sujets créés </strong></h5>
                                    <c:if test="${not empty mySubjects}">
                                    <c:forEach items="${mySubjects}" var="subject">
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                      <div class="dh-col m2 text-center">
                                        <img class="dh-circle"
                                          src="data:${subject.file.mimeType};base64, ${subject.file.imageInBase64}"
                                          style="width:40px;height:40px" id="imageSuj">
                                      </div>
                                      <div class="dh-col m10 dh-container">
                                        <h4 style="font-size:medium" class="dh-left" id="titreSujet">${subject.title} </h4>
                                        <p id="descriptSujet" class="dh-hide">${subject.content}</p>
                                        <div class="dh-right dh-medium">
                                            <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                            <div class="dh-dropdown-hover dh-right dh-hide-small" id="modRec"> <!-- Pour survoler-->
                                                <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                              <div id="edit" class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                <a href="#"  onclick="modifierSujet('titreSujet', 'descriptSujet', 'imageSuj');" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                <a href="#"  onclick="supprimerSujet();" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                              </div>
                                            </div>
                                          </div>

                                      </div>
                                    </div>
                                    </c:forEach>
                                    </c:if>
                                    <hr class="dh-clear">
                                    <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                          <img class="dh-circle" src="/images/champignon.jpg" style="width:40px;height:40px" id="imSujet2">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                          <h4 style="font-size:medium" class="dh-left" id="tSujet2">Congélation des champignons pieds de mouton </h4>
                                          <p id="dSujet2" class="dh-hide">L'objectif de discuter sur les différents moyens de congélation des pieds de mouton</p>    
                                          <div class="dh-right dh-medium">
                                              <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                              <div class="dh-dropdown-hover dh-right dh-hide-small" id="modRec"> <!-- Pour survoler-->
                                                  <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                <div id="edit" class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                  <a href="#" onclick="modifierSujet('tSujet2', 'dSujet2', 'imSujet2');" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                  <a href="#" onclick="supprimerSujet();" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                </div>
                                              </div>
                                            </div>
                                      
                                        </div>
                                      </div>
                                      <hr class="dh-clear">
                                      <div class="dh-row">
                                        <div class="dh-col m2 text-center">
                                          <img class="dh-circle" src="/images/boeuf.jpg" style="width:40px;height:40px" id="imSujet3">
                                        </div>
                                        <div class="dh-col m10 dh-container">
                                          <h4 style="font-size:medium" class="dh-left" id="tSujet3">Boeuf bourguignon, ma viande est dure</h4>
                                          <p id="dSujet3" class="dh-hide">J'ai besoin de vos suggestions pour rendre ma viande plus molle.</p>      
                                          <div class="dh-right dh-medium">
                                              <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                              <div class="dh-dropdown-hover dh-right dh-hide-small" id="modRec"> <!-- Pour survoler-->
                                                  <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                                <div id="edit" class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                                  <a href="#" onclick="modifierSujet('tSujet3', 'dSujet3', 'imSujet3');" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                                  <a href="#" onclick="supprimerSujet();" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                                </div>
                                              </div>
                                            </div>
                                      
                                        </div>
                                      </div>
                                      <hr class="dh-clear">
                                      <br/><br/><br/><br/>

                                    
                             <!--Fin Tous les sujets créés-->
                            </div>

                            <!-- Debut Entrées sujets créés-->
                            <div id="sujetEntrees" class="dh-container menu dh-padding">
                                <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase ">Sujets sur les Entrées </span></strong></h5>
                                <hr class="dh-clear">
                                <div class="dh-row">
                                    <div class="dh-col m2 text-center">
                                      <img class="dh-circle" src="/images/viande.png" style="width:40px;height:40px" id="imSEntre">
                                    </div>
                                    <div class="dh-col m10 dh-container">
                                      <h4 style="font-size:medium" class="dh-left" id="tSEntre">Comment cuisiner une viande Hachée sans boeuf ? </h4>
                                      <p id="dSEntre" class="dh-hide">L'objectif de savoir comment cuisiner une viande hachée.</p>    
                                      <div class="dh-right dh-medium">
                                          <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                          <div class="dh-dropdown-hover dh-right dh-hide-small" id="modRec"> <!-- Pour survoler-->
                                              <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                            <div id="edit" class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                              <a href="#" onclick="modifierSujet('tSEntre', 'dSEntre', 'imSEntre');" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                              <a href="#" onclick="supprimerSujet();" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                            </div>
                                          </div>
                                        </div>
                                  
                                    </div>
                                  </div>
                                <hr class="dh-clear">
                                  <br/><br/><br/><br/>
                                  <br/><br/><br/><br/>
                                  <br/><br/><br/><br/>
                                <!-- FIn Entrées Sujets créés-->
                            </div>

                              <!-- Debut Plat Sujets créés-->
                              <div id="sujetPlat" class="dh-container menu dh-padding">
                                <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase "> Sujets sur les Plats principaux </span></strong></h5>
                                <hr class="dh-clear">
                                
                                <div class="dh-row">
                                    <div class="dh-col m2 text-center">
                                      <img id="imSPlat" class="dh-circle" src="/images/champignon.jpg" style="width:40px;height:40px">
                                    </div>
                                    <div class="dh-col m10 dh-container">
                                      <h4 style="font-size:medium" class="dh-left" id="tSPlat">Congélation des champignons pieds de mouton </h4>
                                      <p id="dSPlat" class="dh-hide">L'objectif est que chacun donne son avis sur la congélation des champignons 
                                          des pieds de mouton.
                                      </p>      
                                      <div class="dh-right dh-medium">
                                          <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                          <div class="dh-dropdown-hover dh-right dh-hide-small" id="modRec"> <!-- Pour survoler-->
                                              <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                            <div id="edit" class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                              <a href="#" onclick="modifierSujet('tSPlat', 'dSPlat', 'imSPlat');" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                              <a href="#" onclick="supprimerSujet();" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                            </div>
                                          </div>
                                        </div>
                                  
                                    </div>
                                  </div>

                                <hr class="dh-clear">
                                <br/><br/><br/><br/>
                                <br/><br/><br/>
                                <br/><br/><br/><br/>
                                
                                <!-- FIn Plat Sujets créés-->
                            </div>

                              <!-- Debut Dessert Sujets créés-->
                              <div id="sujetDessert" class="dh-container menu dh-padding">
                                <h5 class="dh-opacity dh-medium"><strong><span class="text-uppercase"> Sujets sur les desserts</span> </strong></h5>
                                <hr class="dh-clear">
                                <div class="dh-row">
                                    <div class="dh-col m2 text-center">
                                      <img class="dh-circle" src="/images/boeuf.jpg" style="width:40px;height:40px" id="imSDessert">
                                    </div>
                                    <div class="dh-col m10 dh-container">
                                      <h4 style="font-size:medium" class="dh-left" id="tSDessert">Boeuf bourguignon, ma viande est dure</h4>
                                      <p id="dSDessert" class="dh-hide">J'ai besoin de vos suggestions pour rendre ma viande plus molle.</p>        
                                      <div class="dh-right dh-medium">
                                          <span style="margin-right: 4px;" class="dh-opacity">|</span>
                                          <div class="dh-dropdown-hover dh-right dh-hide-small" id="modRec"> <!-- Pour survoler-->
                                              <i class="fa fa-ellipsis-h" aria-hidden="true" style="cursor: pointer; "></i>
                                            <div id="edit" class="dh-dropdown-content dh-card-4 dh-bar-block" style="right:0;">
                                              <a href="#" onclick="modifierSujet('tSDessert', 'dSDessert', 'imSDessert');" style="text-decoration:none;" class="dh-bar-item dh-white dh-button">modifier</a>
                                              <a href="#" onclick="supprimerSujet();" style="text-decoration:none;" class="dh-bar-item dh-button">supprimer</a>
                                            </div>
                                          </div>
                                        </div>
                                  
                                    </div>
                                  </div>
                                
                                <hr class="dh-clear">
                                <br/><br/><br/><br/>
                                <br/><br/><br/>
                                <br/><br/><br/>
                                <!-- FIn Dessert Sujets créés-->
                            </div>

                        </div>
                       
                    </div>

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
            <img src="/images/user1.png" alt="Image" class="dh-left dh-margin-right dh-circle" style="width:50px">
            <span class="dh-large">Kahina</span><br>
            <span>A publié une nouvelle recette</span>
          </li>
          <li class="dh-padding">
            <img src="/images/user2.png" alt="Image" class="dh-left dh-margin-right dh-circle" style="width:50px">
            <span class="dh-large">Hao</span><br>
            <span>Vous invites à rejoindre son challenge</span>
          </li> 
          <li class="dh-padding">
            <img src="/images/profile.png" alt="Image" class="dh-left dh-margin-right dh-circle" style="width:50px">
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
      <br/>
    </div>
</div>
<!-- Fin Page Container-->
  
  </div>
  <br/>
  
  </div>
  <br/>
  
  <!-- Footer -->
  <!--footer class="dh-container dh-theme-d3 dh-padding-16">
    <p style="text-align: center;">Copyright 2020  | DreamHunter</p>
  </footer-->

  <script src="/scripts/dreamhunter.js"></script>
  <script src="/scripts/mySubject.js"></script>
 <jsp:include page="modals.jsp"/>

 <footer class="dh-center dh-theme-d3 dh-padding-32">
    <p>Copyright 2020  | DreamHunter</p>
  </footer>
  

  <script>
   
  </script>

  </body>
  </html> 