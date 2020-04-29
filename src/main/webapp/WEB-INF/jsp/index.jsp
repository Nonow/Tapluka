<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>connexion</title>
    <link rel="stylesheet" type="text/css" href="/css/app.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <style>
        body {
            background-image: url("/images/connexion.jpg");
            font-family: "Times New Roman", Georgia, Serif;
            /*background-color: #cccccc;*/
        }

        span {
            opacity: 0.60;
        }
    </style>

</head>
<body>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-6 col-xl-5 mx-auto">
            <div class="card card-signin flex-row my-5">
                <div class="card-body">
                    <h6 class="card-title text-center">Connectes-toi à FastCook ! </h6>
                    <hr/>
                    <span class="card-title text-center" style="font-size: small;">Et profites de bons plans exclusifs de recettes, publications, Challenges ...</span>
                    <hr/>
                    <form:form method="post" action="/login" modelAttribute="newAuthentication" class="form-signin">
                        <div class="form-label-group">
                            <form:input type="text" id="inputUserame" cssClass="form-control" placeholder="Mail"
                                        path="mail"/>
                            <form:errors path="mail" cssClass="error"/>
                            <label for="inputUserame">Mail</label>
                        </div>
                        <div class="form-label-group">
                            <form:input type="password" id="inputPassword" cssClass="form-control"
                                        placeholder="Mot de passe" path="password"/>
                            <form:errors path="password" cssClass="error"/>
                            <label for="inputPassword">Mot de passe</label>
                        </div>

                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Je me connecte
                        </button>
                        <!--h5 class="card-title text-center">Inscris-toi à FastCook! </h5-->

                        <a class="d-block text-center mt-2 small" href="/register">Je m'inscris</a>
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
