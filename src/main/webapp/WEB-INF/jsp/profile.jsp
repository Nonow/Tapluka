<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<title>Profil</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!--link rel="stylesheet" href="https://www.dhschools.com/dhcss/4/dh.css"-->
<link rel="stylesheet" href="/css/style_1.css">
<link rel="stylesheet" href="/css/style_2.css">
<!--link rel="stylesheet" href="https://www.dhschools.com/lib/dh-theme-blue-grey.css"-->
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


<!-- Page Container -->
<div class="dh-container dh-content" style="max-width:1400px;margin-top:20px">

    <!--div class="dh-container dh-content" style="max-width:1300px;margin-top:80px; max-height: 100px;"-->
    <div class="dh-container dh-theme-l5 dh-round dh-padding"
         style="margin-top:50px; margin-bottom:10px; max-width:1222px;">
        <div class="dh-row">
            <div class="dh-col s2">
                <p class="dh-center">
                    <img src="data:${sessionScope.user.file.mimeType};base64, ${sessionScope.user.file.imageInBase64}" class="dh-circle" style="height:120px;width:120px" alt="profil">
                </p>
            </div>
            <div class="dh-col s10 dh-container dh-content dh-padding dh-border dh-center" style="margin-left: 11px; ">
                <h5 class="dh-opacity dh-xlarge"><strong><span class="text-uppercase" style="text-align: center;"> ${sessionScope.user.firstName} ${sessionScope.user.lastName} </span></strong>
                </h5>
                <p>Inscrit depuis le ${sessionScope.user.createDate}</p>
                <p>
                        <span id="contentPropos">A mes heures perdues, faire la cuisine est plus un plaisir pour moi qu'un fardeau
                            Je n'hésite d'oser toutes sortes de recettes qui me traverse la tête.</span>
                    <a href="#" id="modifPropos" style="text-decoration: none;"><i class="fa fa-pencil"
                                                                                   aria-hidden="true" style=""></i></a>
                </p>
            </div>
        </div>
    </div>

    <div class="dh-row">
        <!-- Left Column -->
        <div class="dh-col m2 dh-card dh-theme-l5">

            <div class="dh-center">
                <h6>Mon Profil</h6>
                <button id="myLink" onclick="openMenu(event, 'editprofil');" style="width:100%"
                        class="dh-button dh-block dh-theme-d2 dh-left-align ">

                    <span style="margin-right:30px;">Modification du Profil</span> <i class="fa fa-chevron-right"
                                                                                      aria-hidden="true"></i>

                </button>

                <button onclick="openMenu(event, 'activite');" class="dh-button dh-block dh-theme-d2 dh-left-align">
                    <span style="margin-right:30px;">Activité sur FastCook</span> <i class="fa fa-chevron-right"
                                                                                     aria-hidden="true"></i>
                </button>


            </div>

        </div>


        <div class="dh-col m10">
            <div class="dh-content" id="menu">
                <div class=" dh-theme-l5">


                    <!--Debut Modification Profil-->
                    <div id="editprofil" class="dh-container menu ">
                        <h5 class="dh-opacity dh-medium"><strong><span
                                class="text-uppercase"> Modification du profil</span></strong></h5>
                        <hr class="dh-clear">
                        <div class="dh-white">
                            <form:form action="updateProfile" target="" method="post" modelAttribute="newUser" enctype="multipart/form-data">
                                <div class="dh-row">
                                    <div class="dh-col s6">
                                        <p style="padding-left: 32px; padding-top: 32px;"><label for="nom"
                                                                                                 class="dh-large">Nom</label>
                                            <form:input id="nom" value="${sessionScope.user.lastName}"
                                                        cssStyle="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                                        type="text" placeholder="" name="nom" path="lastName"/>
                                            <form:errors path="lastName" cssClass="error"/>
                                            <small id="erreur1">Vous devez entrer des lettres</small>
                                        </p>
                                    </div>
                                    <div class="dh-col s6">
                                        <p style="padding-left: 32px; padding-top: 32px;"><label for="pNom"
                                                                                                 class="dh-large">Prénom</label>
                                            <form:input id="pNom" value="${sessionScope.user.firstName}"
                                                        style="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                                        type="text" placeholder="" name="pNom" path="firstName"/>
                                            <form:errors path="lastName" cssClass="error"/>
                                            <small id="erreur2">Vous devez entrer des lettres</small>
                                        </p>
                                    </div>
                                </div>
                                <div class="dh-row">
                                    <div class="dh-col s6">
                                        <p style="padding-left: 32px; "><label for="pseudo"
                                                                               class="dh-large">Pseudo</label>
                                            <form:input value="${sessionScope.user.username}"
                                                        cssStyle="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                                        type="text" placeholder="" name="pseudo" path="username"/>
                                            <form:errors path="username" cssClass="error"/>
                                        </p>
                                    </div>
                                    <div class="dh-col s6">
                                        <p style="padding-left: 32px;"><label for="tel"
                                                                              class="dh-large">Téléphone</label>
                                            <form:input id="tel" value="${sessionScope.user.phone}"
                                                        cssStyle="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                                        type="text" placeholder="" name="tel" path="phone"/>
                                            <form:errors path="phone" cssClass="error"/>
                                            <small id="erreur3">Vous devez entrer des chiffres</small>
                                        </p>
                                    </div>
                                </div>

                                <div class="dh-row">
                                    <div class="dh-col s6">
                                        <p style="padding-left: 32px; "><label for="dateNce" class="dh-large">Date de
                                            naissance</label>
                                            <form:input value="${sessionScope.user.dateOfBirthInString}"
                                                        cssStyle="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                                        type="date-local" placeholder="" name="dateNce"
                                                        path="dateOfBirth"/>
                                            <form:errors path="dateOfBirth" cssClass="error"/>
                                        </p>
                                    </div>
                                    <div class="dh-col s6">
                                        <div style="padding-left: 32px;">
                                            <label for="sexe" class="dh-large">Sexe</label>
                                            <div style="position:relative; bottom:2px;">
                                                <div class="form-check-inline"
                                                     style="padding-left:48px; display:inline;">
                                                    <label class="form-check-label" for="hoe">
                                                        <form:radiobutton cssClass="form-check-input" id="hoe"
                                                                          name="sexe" value="Homme" path="civility"
                                                                          checked="${'Homme'.equalsIgnoreCase(sessionScope.user.civility.toString())?'checked':''}"/>Homme
                                                    </label>
                                                </div>
                                                <div class="form-check-inline">
                                                    <label class="form-check-label" for="fem">
                                                        <form:radiobutton cssClass="form-check-input" id="fem"
                                                                          name="sexe" value="Femme" path="civility"
                                                                          checked="${'Femme'.equalsIgnoreCase(sessionScope.user.civility.toString())?'checked':''}"/>Femme
                                                    </label>
                                                </div>
                                            </div>

                                            <!--input style="padding:4px; display:block; border:1px solid #ccc; width:80%;" type="radio" placeholder="" required name="sexe"-->
                                        </div>
                                    </div>
                                </div>
                                <div class="dh-row">
                                    <div class="dh-col s6">
                                        <p style="padding-left: 32px; "><label for="monMail" class="dh-large">Mon
                                            adresse mail</label>
                                            <form:input value="${sessionScope.user.email}"
                                                        cssStyle="padding:4px; display:block; border:1px solid #ccc; width:80%;"
                                                        type="text" placeholder="" name="monMail" path="mail"/>
                                            <form:errors cssClass="error" path="mail"/>
                                        </p>
                                    </div>
                                </div>
                                <div class="dh-row">
                                    <div class="dh-col s6">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="inputGroupFileAddon01">  Télécharger</span>
                                            </div>
                                            <div class="custom-file">
                                                <form:input type="file" cssClass="custom-file-input" id="inputGroupFile01"
                                                            aria-describedby="inputGroupFileAddon01" path="file"/>
                                                <form:errors path="file" cssClass="error"/>
                                                <label class="custom-file-label" for="inputGroupFile01">Choisir l'image</label>
                                            </div>
                                            </br>
                                        </div>
                                    </div>
                                </div>
                                <p style="padding-left:32px; padding-bottom: 32px;">
                                    <button class="dh-button  dh-theme-d2  dh-padding-large" type="submit">
                                        Modifier mon profil
                                    </button>
                                </p>
                            </form:form>
                        </div>


                        <!-- Fin Modification du profil-->
                    </div>

                    <!--Debut Activite  fa-eye  -->
                    <div id="activite" class="dh-container menu ">
                        <h5 class="dh-opacity dh-medium"><strong><span
                                class="text-uppercase"> Mon activité sur FastCook</span></strong></h5>
                        <hr class="dh-clear">


                        <div class="dh-white dh-padding">
                            <div>
                                <div style="display:relative; padding-left: 120px; padding-top: 2%;"
                                     class="dh-row-padding dh-center">
                                    <div class="dh-quarter" style="padding-right: 10px;">
                                        <div class="dh-container dh-teal dh-padding-16">
                                            <div class="dh-left"><i class="fa fa-share-alt dh-xxlarge"></i></div>
                                            <div class="dh-right">
                                                <h3>12</h3>
                                            </div>
                                            <div class="dh-clear"></div>
                                            <h4 class="dh-medium">Publications</h4>
                                        </div>
                                    </div>
                                    <div class="dh-quarter">
                                        <div class="dh-container dh-red dh-padding-16">
                                            <div class="dh-left">
                                                <i class="fa fa-eye dh-xxlarge"></i>
                                            </div>
                                            <div class="dh-right">
                                                <h3>100</h3>
                                            </div>
                                            <div class="dh-clear"></div>
                                            <h4 class="dh-medium">Vues</h4>
                                        </div>
                                    </div>
                                    <div class="dh-quarter">
                                        <div class="dh-container dh-blue dh-padding-16">
                                            <div class="dh-left">
                                                <i class="fa fa-comment dh-xxlarge"></i>
                                            </div>
                                            <div class="dh-right">
                                                <h3>50</h3>
                                            </div>
                                            <div class="dh-clear"></div>
                                            <h4 class="dh-medium">Commentaires</h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="dh-panel">
                                    <div class="dh-row-padding" style="margin:0 -16px">
                                        <div class="dh-third">
                                            <h5>Statistiques</h5>
                                            <hr>
                                            <img src="/images/stats.png" style="width:100%" alt="Google Regional Map">
                                        </div>
                                        <div class="dh-twothird">
                                            <h5>Ces dernières 24 heures</h5>
                                            <hr>
                                            <table class="dh-table dh-striped dh-white">
                                                <tr>
                                                    <td><i class="fa fa-user dh-text-blue dh-large"></i></td>
                                                    <td>Nouvelles publications</td>
                                                    <td><i>10</i></td>
                                                </tr>
                                                <tr>
                                                    <td><i class="fa fa-bell dh-text-red dh-large"></i></td>
                                                    <td>Notifications</td>
                                                    <td><i>20</i></td>
                                                </tr>
                                                <tr>
                                                    <td><i class="fa fa-users dh-text-yellow dh-large"></i></td>
                                                    <td>Groupes créées.</td>
                                                    <td><i>3</i></td>
                                                </tr>
                                                <tr>
                                                    <td><i class="fa fa-comment dh-text-red dh-large"></i></td>
                                                    <td>Nouveaux commentaires</td>
                                                    <td><i>30</i></td>
                                                </tr>

                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>
                        <!--Fin Activite Sur FastCook -->
                    </div>

                </div>

            </div>

        </div>

    </div>
    <div class="dh-container" style="margin-top:50px; max-width:1222px; border:1px solid transparent;">
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



<script>
    /* Action à la modification de l'avant Propos*/
    let modifP = document.getElementById('modifPropos');
    modifP.addEventListener('click', modifAvPropos);

    /* Vérifier le contenu du nom dans le formulaire Profil*/
    let contentNom = document.getElementById('nom');
    let erreurNom = document.getElementById('erreur1');
    erreurNom.style.display = 'none';
    contentNom.addEventListener('keyup', () => {
        if (!isNaN(contentNom.value)) {
            erreurNom.style.color = 'red';
            erreurNom.style.display = 'inline';
        } else {
            erreurNom.style.display = 'none';
        }
    });

    /* Vérifier le contenu du prénom dans le formulaire Profil*/
    let contentpNom = document.getElementById('pNom');
    let erreurpNom = document.getElementById('erreur2');
    erreurpNom.style.display = 'none';
    contentpNom.addEventListener('keyup', () => {
        if (!isNaN(contentpNom.value)) {
            erreurpNom.style.color = 'red';
            erreurpNom.style.display = 'inline';
        } else {
            erreurpNom.style.display = 'none';
        }
    });


    /* Vérifier le contenu du numéro de téléphone dans le formulaire Profil*/
    let contentTel = document.getElementById('tel');
    let erreurTel = document.getElementById('erreur3');
    erreurTel.style.display = 'none';
    contentTel.addEventListener('keyup', () => {
        if (isNaN(contentTel.value)) {
            erreurTel.style.color = 'red';
            erreurTel.style.display = 'inline';
        } else {
            erreurTel.style.display = 'none';
        }
    });

    function verifContentProfil() {
        if (!isNaN(contentNom.value)) {
            erreurNom.style.color = 'red';
            erreurNom.style.display = 'inline';
        } else {
            erreurNom.style.display = 'none';
        }
    }

</script>

</body>
</html>