<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<title>Challenge</title>
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
                        <a href="#" class="dh-bar-item dh-button" style="text-decoration: none;">Rejoindre
                            un Challenge</a>
                        <a href="/mesChallenges" class="dh-bar-item dh-button" style="text-decoration: none;">Mes Challenges</a>

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
<!-- Fin Barre des menus-->

<!-- Navbar on small screens -->
<div id="navDemo" class="dh-bar-block dh-theme-d2 dh-hide dh-hide-large dh-hide-medium dh-large">
    <a href="#" class="dh-bar-item dh-button dh-padding-large">Recette</a>
    <a href="#" class="dh-bar-item dh-button dh-padding-large">Conversation</a>
    <a href="#" class="dh-bar-item dh-button dh-padding-large">Challenge</a>
    <a href="#" class="dh-bar-item dh-button dh-padding-large">Profil</a>

</div>

<div class="dh-container dh-content" style="max-width:1400px;margin-top:80px">

    <div class="dh-row">
        <!-- main section -->
        <div class="dh-col m9 dh-theme-l5">
            <div class="dh-center dh-container">
                <b><h4 class="dh-opacity">LISTE DES CHALLENGES</h4></b>
                <hr/>
            </div>

            <div class="dh-row dh-center dh-container" id="challenge1">
                <c:forEach items="${sessionScope.challenges}" var="challenge">
                    <div class="dh-col s4 dh-container dh-margin-bottom" style="height: 50%;">
                        <div class="dh-card">
                            <img src="data:${challenge.file.mimeType};base64, ${challenge.file.imageInBase64}"
                                 style="width:100%; height:150px;" class="">
                            <div class="dh-container dh-white" id="decouverte">
                                <h4 class="dh-titre dh-opacity"><b>${challenge.title}</b></h4>
                                <p class="paragraph1">${challenge.description}</p>
                                <p>
                                    <button id="autre" class="dh-button dh-light-grey dh-block">
                                        Participer </span></button>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="dh-col s4 dh-container dh-margin-bottom" style="height: 50%;">
                    <div class="dh-card">
                        <img src="/images/verrine.jpg" style="width:100%; height:150px;" class="">
                        <div class="dh-container dh-white" id="decouverte">
                            <h4 class="dh-titre dh-opacity"><b>Verrine </b></h4>
                            <p class="paragraph2">Aucun ingrédient n'étant imposé sur le choix du thème que je vous
                                propose vous aurez un large choix:entrée ou dessert.
                                " AUTOUR DE LA VERRINE ". Je suis sure de voir de très belle réalisations,le challenge
                                sera fermé le vendredi soir.
                            </p>
                            <p>
                                <button id="autre" class="dh-button dh-light-grey dh-block">Participer </span></button>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="dh-col s4 dh-container dh-margin-bottom" style="">
                    <div class="dh-card">
                        <img src="/images/buche.jpg" style="width:100%; height:150px;" class="">
                        <div class="dh-container dh-white" id="decouverte">
                            <h4 class="dh-titre dh-opacity"><b>La magie de Noel </b></h4>
                            <p class="paragraph3">La Bûche de Noël est incontournable pour les Fêtes: bûche salée, bûche
                                sucrée, bûche en entrée, en plat ou en dessert,je
                                invite donc à bûcher et à nous proposer votre version de la bûche de fêtes !
                            </p>
                            <p>
                                <button id="autre" class="dh-button dh-light-grey dh-block">Participer </span></button>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Second Photo Grid-->
            <div class="dh-row  dh-center dh-container">
                <div class="dh-col s4 dh-container dh-margin-bottom" style="height: 50%;">
                    <div class="dh-card">
                        <img src="/images/couscous.jpg" style="width:100%; height:150px;" class="">
                        <div class="dh-container dh-white" id="decouverte">
                            <h4 class="dh-titre dh-opacity"><b>Oriental </b></h4>
                            <p class="paragraph4">Le défi d'aujourd'huit est la recette marocaine culte, c'est le délice
                                oriental par excellence? Prenez votre temps, suivez ce pas à pas,
                                régalez-vous avec les odeurs qui se dégagent de la marmite.Faites nous voyager!!
                            </p>
                            <p>
                                <button id="autre" class="dh-button dh-light-grey dh-block">Participer </span></button>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="dh-col s4 dh-container dh-margin-bottom" style="height: 50%;">
                    <div class="dh-card">
                        <img src="/images/lapin.jpg" style="width:100%; height:150px;" class="">
                        <div class="dh-container dh-white" id="decouverte">
                            <h4 class="dh-titre dh-opacity"><b>1,2,3 Patisserref </b></h4>
                            <p class="paragraph5">A vous de nous régaler:le défi est de réaliser un gateau
                                gourmand,facile et pas couteux sur le théme"Paque".Soyez créatifs!!1 2 3 Patisser
                            </p>
                            <p>
                                <button id="autre" class="dh-button dh-light-grey dh-block">Participer </span></button>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="dh-col s4 dh-container dh-margin-bottom" style="height: 50%;">
                    <div class="dh-card">
                        <img src="/images/s.jpg" style="width:100%; height:150px;" class="">
                        <div class="dh-container dh-white" id="decouverte">
                            <h4 class="dh-titre dh-opacity"><b>Le soleil dans votre assiette </b></h4>
                            <p class="paragraph6">c'est le temps idéal pour apporter un peu de soleil à vos assiettes,et
                                pour cela vous disposez de trois ingredients principles:poivron,carottes et tomate
                            </p>
                            <p>
                                <button id="autre" class="dh-button dh-light-grey dh-block">Participer </span></button>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- right section-->
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
        </div>

    </div>

</div>

<!-- Début Blocs modaux-->
<jsp:include page="modals.jsp"/>
<!-- Fin blocs modaux-->

<!-- Footer -->
<!--footer class="dh-container dh-theme-d3 dh-padding-16">
  <p style="text-align: center;">Copyright 2020  | DreamHunter</p>
</footer-->

<footer class="dh-center dh-theme-d2 dh-padding-32">
    <p>Copyright 2020  | DreamHunter</p>
</footer>

<script src="/scripts/dreamhunter.js"></script>

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


</script>

</body>
</html>
  

