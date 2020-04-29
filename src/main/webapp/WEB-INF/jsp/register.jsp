<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>inscription</title>
    <link rel="stylesheet" type="text/css" href="/css/app.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background-image: url("/images/inscription.jpg"), url("paper.gif");
            font-family: "Times New Roman", Georgia, Serif;
            /*background-color: #cccccc;*/
        }

        span, .infco {
            opacity: 0.60;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-xl-5 mx-auto">
            <div class="card card-signin flex-row my-5">

                <div class="card-body">
                    <h5 class="card-title text-center"> INSCRIPTION</h5>
                    <hr/>
                    <span><center>Vous n'êtes pas encore inscrit ? On se disait bien qu'il manquait quelqu'un !</center></span>
                    <hr/>
                    <!--h6 class="card-title text-center">	Vos informations de connexion</h6-->

                    <form:form action="/subscribe" modelAttribute="newSubscription" method="post" class="form-signin">

                        <fieldset>
                            <p style="text-align: center; font-size: 16px; font-weight: 400;"
                               class="infco text-uppercase"><b>Vos informations de connexion</b></p>
                            <div class="form-label-group">
                                <form:input type="email" id="inputEmail" cssClass="form-control" placeholder="Email"
                                            path="mail"/>
                                <form:errors cssClass="error" path="mail"/>
                                <label for="inputEmail">Email</label>
                            </div>

                            <div class="form-label-group">
                                <form:input type="password" id="inputPassword" cssClass="form-control"
                                            placeholder="Mot de passe" path="password"/>
                                <form:errors cssClass="error" path="password"/>
                                <label for="inputPassword">Mot de passe</label>
                            </div>

                            <div class="form-label-group">
                                <form:input type="password" id="inputConfirmPassword" cssClass="form-control"
                                            placeholder="Confirmer mot de passe"
                                            path="confirmPassword"/>
                                <form:errors cssClass="error" path="confirmPassword"/>
                                <label for="inputConfirmPassword">Confirmer mot de passe</label>
                            </div>


                        </fieldset>


                        <!--h6 class="card-title text-center"> Vos Informations personnelles</h6-->

                        <p style="text-align: center; font-size: 16px; font-weight: 400;"
                           class="infco text-uppercase"><b>Vos Informations Personnelles</b></p>

                        <div class="form-label-group">
                            <form:input type="text" id="inputUserame" cssClass="form-control" placeholder="Pseudo"
                                        path="username"/>
                            <form:errors path="username" cssClass="errors"/>
                            <label for="inputUserame">Pseudo</label>
                        </div>

                        <div class="form-label-group">
                            <form:input type="text" id="inputNom" cssClass="form-control" placeholder="Nom"
                                        path="lastName"/>
                            <form:errors cssClass="errors" path="lastName"/>
                            <label for="inputNom">Nom</label>
                        </div>

                        <div class="form-label-group">
                            <form:input type="text" id="inputPrenom" cssClass="form-control" placeholder="Prenom"
                                        path="firstName"/>
                            <form:errors cssClass="errors" path="firstName"/>
                            <label for="inputPrenom">Prénom</label>
                        </div>

                        <div class="form-label-group">
                            <form:input type="text" id="inputNumeroMobile" cssClass="form-control"
                                        placeholder="Numero de mobile" path="phone"/>
                            <form:errors cssClass="errors" path="phone"/>
                            <label for="inputNumeroMobile">Numero de mobile</label>
                        </div>

                        <div class="form-label-group">
                            <p for="dnce">Date de naissance</p>
                            <form:input type="date" id="dnce" name="dnce" path="dateOfBirth"/>
                            <form:errors cssClass="errors" path="dateOfBirth"/>
                        </div>

                        <p for="sexe">Sexe</p>
                        <div class="form-check-inline">
                            <label class="form-check-label" for="radio1">
                                <form:radiobutton class="form-check-input" id="radio1" name="optradio" value="Homme"
                                                  path="civility" disabled="false"/>Homme
                            </label>
                        </div>
                        <div class="form-check-inline">
                            <label class="form-check-label" for="radio2">
                                <form:radiobutton class="form-check-input" id="radio2" name="optradio"
                                                  value="Femme" path="civility"/>Femme
                            </label>
                        </div>
                        <br/><br/>
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Je m'inscris
                        </button>
                        <!--a class="d-block text-center mt-2 small" href="connexion.html">Se connecter</a-->
                        <hr class="my-4">


                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</div>

</body>
</html>
