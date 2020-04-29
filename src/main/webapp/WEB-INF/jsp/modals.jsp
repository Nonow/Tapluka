<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Conversation Modal -->
<div id="conversation" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom">
        <div class="dh-container dh-theme-d2">
            <span onclick="document.getElementById('conversation').style.display='none'"
                  class="dh-button dh-display-topright dh-large">x</span>
            <h4>Creer un Sujet de Conversation</h4>
        </div>
        <div class="dh-container">
            <form:form action="newSubject" method="post" modelAttribute="newSubject" enctype="multipart/form-data">
                <br/>
                <div class="form-group">
                    <!--label for="usr">le titre de la conversation</label-->
                    <form:input type="text" cssClass="form-control" name="titre" placeholder="Titre de la conversation"
                                path="title2"/>
                    <form:errors path="title2" cssClass="error"/>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupFileAddon01">  Télécharger</span>
                    </div>
                    <div class="custom-file">
                        <form:input type="file" cssClass="custom-file-input" id="inputGroupFile01"
                                    aria-describedby="inputGroupFileAddon01" path="file2"/>
                        <form:errors path="file2" cssClass="error"/>
                        <label class="custom-file-label" for="inputGroupFile01">Choisir le logo du Sujet</label>
                    </div>
                </div>
                <br/>

                <div class="form-group">
                    <form:textarea cssClass="form-control" rows="5" id="comment" name="text"
                                   placeholder="Une description du Sujet" path="description2"/>
                    <form:errors path="description2" cssClass="error"/>
                </div>
                <p style="margin-left:70%;">
                    <button class="dh-button dh-round-large dh-section" type="submit" id="creer"
                            style="color:#fff !important; background-color:#435761 !important;">CREER
                    </button>
                    <span onclick="document.getElementById('conversation').style.display='none'">
                <button id="annuler" class="dh-button  dh-round-large" type="reset"
                        style="color:#fff !important; background-color:#435761 !important;">ANNULER</button>
              </span>
                </p>
            </form:form>
        </div>
    </div>
</div>

<!-- Challenge Modal -->
<div id="challenge" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom">
        <div class="dh-container dh-theme-d2">
            <span onclick="document.getElementById('challenge').style.display='none'"
                  class="dh-button dh-display-topright dh-large">x</span>
            <h4>Creer un Challenge</h4>
        </div>
        <div class="dh-container">
            <form:form action="newChallenge" method="post" enctype="multipart/form-data" modelAttribute="newChallenge">
                <br/>
                <div class="form-group">
                    <!--label for="usr">le titre de la conversation</label-->
                    <form:input type="text" cssClass="form-control" name="titre" placeholder="Titre du Challenge"
                                path="title"/>
                    <form:errors path="title" cssClass="error"/>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupFileAddon01">Télécharger</span>
                    </div>
                    <div class="custom-file">
                        <form:input type="file" cssClass="custom-file-input" id="inputGroupFile01"
                                    aria-describedby="inputGroupFileAddon01"
                                    path="file"/>
                        <form:errors path="file" cssClass="error"/>
                        <label class="custom-file-label" for="inputGroupFile01">Choisir le logo du Challenge</label>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <form:textarea cssClass="form-control" rows="5" id="comment" name="text"
                                   placeholder="Une description du Challenge" path="description"/>
                    <form:errors path="description" cssClass="error"/>
                </div>
                <p style="margin-left:70%;">
                    <button class="dh-button dh-round-large dh-section" type="submit" id="creer"
                            style="color:#fff !important; background-color:#435761 !important;">CREER
                    </button>
                    <span onclick="document.getElementById('challenge').style.display='none'">
              <button id="annuler" class="dh-button  dh-round-large" type="reset"
                      style="color:#fff !important; background-color:#435761 !important;">ANNULER</button>
            </span>
                </p>
            </form:form>
        </div>
    </div>
</div>

<!-- Recette Modal -->
<div id="recette" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom">
        <div class="dh-container dh-theme-d2">
            <span onclick="document.getElementById('recette').style.display='none'"
                  class="dh-button dh-display-topright dh-large">x</span>
            <h4>Creer une recette</h4>
        </div>
        <div class="dh-container">
            <form:form enctype="multipart/form-data" action="newRecipe" method="post" modelAttribute="newRecipe">
                <br/>
                <div class="form-group">
                    <!--label for="usr">le titre de la recette</label-->
                    <form:input type="text" cssClass="form-control" id="usr" name="titre"
                                placeholder="Titre de la recette"
                                path="title3"/>
                    <form:errors path="title3" cssClass="error"/>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupFileAddon01">  Télécharger</span>
                    </div>
                    <div class="custom-file">
                        <form:input type="file" cssClass="custom-file-input" id="inputGroupFile01"
                                    aria-describedby="inputGroupFileAddon01" path="file3"/>
                        <form:errors path="file3" cssClass="error"/>
                        <label class="custom-file-label" for="inputGroupFile01">choisir une photo</label>
                    </div>
                </div>
                <br>

                <div class="form-group">
                    <label for="sel1">Catégorie</label>
                    <form:select path="category" cssClass="form-control" id="sel1" name="sellist1">
                        <form:option value="Salade">Salade</form:option>
                        <form:option value="Dessert">Dessert</form:option>
                        <form:option value="Soupe">Soupe</form:option>
                        <form:option value="Gateaux">Gateaux</form:option>
                    </form:select>
                    <form:errors path="category" cssClass="error"/>
                    <br>
                </div>

                <div class="form-group">
                    <label for="sel1">Nombre de part</label>
                    <form:select path="numberOfParts" class="form-control" id="sel1" name="sellist1">
                        <form:option value="1">1</form:option>
                        <form:option value="2">2</form:option>
                        <form:option value="3">3</form:option>
                        <form:option value="4">4</form:option>
                    </form:select>
                    <form:errors path="numberOfParts" cssClass="error"/>
                    <br>
                </div>

                <div class="form-group">
                    <div class="dh-row">
                        <label class="dh-col s5"for="durePModif">Durée Préparation :
                            <form:input type="number" cssClass="form-control" name="durePrepa" id="durePrepa" path="durePrep"/>
                            <form:errors path="durePrep" cssClass="error"/>
                        </label>
                        <label class="dh-col s2"></label>
                        <label class="dh-col s5" for="dureCModif">Durée Cuisson :
                            <form:input type="number" cssClass="form-control" name="dureCuis" id="dureCuis" path="dureCuis"/>
                            <form:errors path="dureCuis" cssClass="error"/>
                        </label>

                    </div>

                </div>

                <div class="form-group">
                    <!--label for="comment">la déscription de la recette</label-->
                    <form:textarea class="form-control" rows="5" id="comment" name="text"
                                   placeholder="Description de la recette"
                                   path="description3"/>
                    <form:errors cssClass="error" path="description3"/>
                </div>

                <p style="margin-left:70%;">
                    <button class="dh-button dh-round-large dh-section" type="submit" id="creer"
                            style="color:#fff !important; background-color:#435761 !important;">CREER
                    </button>
                    <span onclick="document.getElementById('recette').style.display='none'">
              <button id="annuler" class="dh-button  dh-round-large" type="reset"
                      style="color:#fff !important; background-color:#435761 !important;">ANNULER</button>
            </span>
                </p>
            </form:form>
        </div>
    </div>
</div>

</div>
<br/>

<!-- Modifier Recette Modal -->
<div id="modiRecette" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom">
        <div class="dh-container dh-theme-d2">
            <span onclick="document.getElementById('modiRecette').style.display='none'" class="dh-button dh-display-topright dh-large">x</span>
            <h4>Modifier une recette</h4>
        </div>
        <div class="dh-container">

            <form:form enctype="multipart/form-data" action="editRecette" method="post" modelAttribute="editRecette">
                <br/>
                <div class="form-group">
                    <form:input type="hidden" id="updateRecipeId" name="recipeId" path="updateId" />
                    <!--label for="usr">le titre de la recette</label-->
                    <form:input type="text" cssClass="form-control" id="titreModif" name="usr"  path="title3"/>
                    <form:errors path="title3" cssClass="error"/>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">  Upload</span>
                    </div>
                    <div class="custom-file">
                        <form:input type="file" cssClass="custom-file-input" id="imModif" aria-describedby="inputGroupFileAddon01"
                                    path="file3"/>
                        <form:errors path="file3" cssClass="error"/>
                        <label class="custom-file-label" for="inputGroupFile01">choisir une image</label>
                    </div>
                </div>
                <br>

                <div class="form-group">
                    <label for="categorieModif">Catégorie</label>
                    <form:select path="category" cssClass="form-control" id="categorieModif" name="categorieModif">
                        <form:option value="Salade">Salade</form:option>
                        <form:option value="Dessert">Dessert</form:option>
                        <form:option value="Soupe">Soupe</form:option>
                        <form:option value="Gateau">Gateau</form:option>
                    </form:select>
                    <form:errors path="category" cssClass="error"/>

                    <br>
                </div>

                <div class="form-group">
                    <label for="partModif">Nombre de part</label>
                        <form:select path="numberOfParts" class="form-control" id="partModif" name="partModif">
                            <form:option value="1">1</form:option>
                            <form:option value="2">2</form:option>
                            <form:option value="3">3</form:option>
                            <form:option value="4">4</form:option>
                        </form:select>
                        <form:errors path="numberOfParts" cssClass="error"/>
                    <br>
                </div>

                <div class="form-group">
                    <div class="dh-row">
                        <label class="dh-col s5"for="durePModif">Durée Préparation :
                            <form:input type="number" cssClass="form-control" name="durePModif" id="durePModif" path="durePrep"/>
                            <form:errors path="durePrep" cssClass="error"/>
                        </label>
                        <label class="dh-col s2"></label>
                        <label class="dh-col s5" for="dureCModif">Durée Cuisson :
                            <form:input type="number" cssClass="form-control" name="dureCModif" id="dureCModif" path="dureCuis"/>
                            <form:errors path="dureCuis" cssClass="error"/>
                        </label>

                    </div>

                </div>

                <div class="form-group">
                    <form:textarea class="form-control" rows="5" id="descriptionModif" name="descriptionModif"
                                   path="description3"/>
                    <form:errors cssClass="error" path="description3"/>
                </div>

                <p style="margin-left:70%;">
                    <button class="dh-button dh-round-large dh-section" type="submit" id="creer" style="color:#fff !important; background-color:#435761 !important;">MODIFIER</button>
                    <span onclick="document.getElementById('modiRecette').style.display='none'">
              <button id="annuler" class="dh-button  dh-round-large" type="reset" style="color:#fff !important; background-color:#435761 !important;">ANNULER</button>
                </span>
                </p>
            </form:form>
        </div>
    </div>
</div>

<!-- Supprimer Recette-->
<div id="supRecette" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom" style="width:40%">
        <form:form action="deleteRecipe" method="post" modelAttribute="deleteDto">
            <form:input type="hidden" id="deleteRecipeId" name="deleteRecipeId" path="deleteId"/>
            <div class="dh-container dh-theme-d2 dh-center">

                <span onclick="document.getElementById('supRecette').style.display='none'" class="dh-button dh-display-topright dh-large">x</span>
                <h4>Etes-vous sûr de vouloir supprimer cette recette ?</h4>
            </div>
            <div class="dh-container">
                <div class="dh-padding">
                    <button class="dh-button  dh-round dh-theme-d2" type="submit" style="margin-left:100px; color:#fff !important; background-color:#4d636f !important;"><i class="fa fa-check"></i> Confirmer</button>
                    <span onclick="document.getElementById('supRecette').style.display='none'" class="">
                  <button class="dh-button  dh-round dh-theme-d2" type="reset" style="color:#fff !important; background-color:#4d636f !important;"><i class=""></i> Annuler</button>
              </span>
                </div>
            </div>
        </form:form>
    </div>
</div>

<!-- Modifier Avis-->
<div id="publicationAvis" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom" style="width:40%">
        <div class="dh-container dh-theme-d2">
            <span onclick="document.getElementById('publicationAvis').style.display='none'" class="dh-button dh-display-topright dh-large">x</span>
            <h4>Modifier Avis</h4>
        </div>
        <div class="dh-container">
            <form:form enctype="multipart/form-data" action="editAvis" method="post" modelAttribute="editAvis">

                <div class="dh-row dh-padding">

                <div class="dh-col s9" >
                    <form:textarea class="dh-border dh-padding dh-white" rows="4" cols="50" name="aviModi" id="aviModi" path="aviModi"/>
                    <form:errors cssClass="error" path="aviModi"/>
                </div>
                <span onclick="document.getElementById('publicationAvis').style.display='none'" class="dh-col s3">
                      <button class="dh-button  dh-round dh-theme-d2" type="submit" style="position:relative; top:50px; margin-left:20px; color:#fff !important; background-color:#4d636f !important;">
                        <i class="fa fa-pencil"></i>
                        <span>Modifier</span>
                      </button>
                </span>
             </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Supprimer Avis-->
<div id="suprimerAvis" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom" style="width:40%">
        <div class="dh-container dh-theme-d2 dh-center">
            <span onclick="document.getElementById('suprimerAvis').style.display='none'" class="dh-button dh-display-topright dh-large">x</span>
            <h4>Etes-vous sûr de vouloir supprimer cet avis ?</h4>
        </div>
        <div class="dh-container">
            <div class="dh-padding">
                <button class="dh-button  dh-round dh-theme-d2" type="submit" style="margin-left:100px; color:#fff !important; background-color:#4d636f !important;"><i class="fa fa-check"></i> Confirmer</button>
                <span onclick="document.getElementById('suprimerAvis').style.display='none'" class="">
              <button class="dh-button  dh-round dh-theme-d2" type="reset" style="color:#fff !important; background-color:#4d636f !important;"><i class=""></i> Annuler</button>
          </span>
            </div>
        </div>
    </div>
</div>



<!-- Supprimer Sujet-->
<div id="supSujet" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom" style="width:40%">
        <div class="dh-container dh-theme-d2 dh-center">
            <span onclick="document.getElementById('supSujet').style.display='none'" class="dh-button dh-display-topright dh-large">x</span>
            <h4>Etes-vous sûr de vouloir supprimer ce sujet ?</h4>
        </div>
        <div class="dh-container">
            <div class="dh-padding">
                <button class="dh-button  dh-round dh-theme-d2" type="submit" style="margin-left:100px; color:#fff !important; background-color:#4d636f !important;"><i class="fa fa-check"></i> Confirmer</button>
                <span onclick="document.getElementById('supSujet').style.display='none'" class="">
              <button class="dh-button  dh-round dh-theme-d2" type="reset" style="color:#fff !important; background-color:#4d636f !important;"><i class=""></i> Annuler</button>
          </span>
            </div>
        </div>
    </div>
</div>

<!-- Modification Challenge Modal -->
<div id="modifChallenge" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom">
        <div class="dh-container dh-theme-d3">
            <span onclick="document.getElementById('modifChallenge').style.display='none'" class="dh-button dh-display-topright dh-large">x</span>
            <h4>Modifier un Challenge</h4>
        </div>
        <div class="dh-container">
            <form:form enctype="multipart/form-data" action="editChallenge" method="post" modelAttribute="editChallenge">
                <br/>
                <div class="form-group">
                    <form:input type="text" cssClass="form-control" id="titreMod" name="titreMod"  path="titreMod"/>
                    <form:errors path="titreMod" cssClass="error"/>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Télécharger</span>
                    </div>
                    <div class="custom-file">
                        <form:input type="file" cssClass="custom-file-input" id="imageMod" aria-describedby="inputGroupFileAddon01"
                                    path="imageMod" name="imageMod"/>
                        <form:errors path="imageMod" cssClass="error"/>
                        <label class="custom-file-label" for="imageMod">Choisir le logo du Challenge</label>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <form:textarea class="form-control" rows="5" id="detailMod" name="detailMod" path="detailMod"/>
                    <form:errors cssClass="error" path="detailMod"/>
                </div>
                <p style="margin-left:70%;">
                    <button class="dh-button dh-round-large dh-section" type="submit" id="modifier" style="color:#fff !important; background-color:#435761 !important;">MODIFIER</button>
                    <span onclick="document.getElementById('modifChallenge').style.display='none'">
                  <button id="annuler" class="dh-button  dh-round-large" type="reset" style="color:#fff !important; background-color:#435761 !important;">ANNULER</button>
                </span>
                </p>
            </form:form>
        </div>
    </div>
</div>

<!-- Modifier Conversation Modal -->
<div id="modSujet" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom">
        <div class="dh-container dh-theme-d3">
            <span onclick="document.getElementById('modSujet').style.display='none'" class="dh-button dh-display-topright dh-large">x</span>
            <h4>Modifier un Sujet de Conversation</h4>
        </div>
        <div class="dh-container">
            <form:form enctype="multipart/form-data" action="editSujet" method="post" modelAttribute="editSujet">
                <br/>
                <div class="form-group">
                    <form:input type="text" cssClass="form-control" id="titreModif" name="titreModif"  path="titreModif"/>
                    <form:errors path="titreModif" cssClass="error"/>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" >  Upload</span>
                    </div>
                    <div class="custom-file">
                        <form:input type="file" cssClass="custom-file-input" id="imModif" name="imModif" aria-describedby="inputGroupFileAddon01"
                                    path="imModif"/>
                        <form:errors path="imageMod" cssClass="error"/>
                        <label class="custom-file-label" for="inputGroupFile01">Choisir le logo du Sujet</label>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <form:textarea class="form-control" rows="5" id="descriptionModif" name="descriptionModif" path="descriptionModif"/>
                    <form:errors cssClass="error" path="descriptionModif"/>
                </div>
                <p style="margin-left:70%;">
                    <button class="dh-button dh-round-large dh-section" type="submit" id="creer" style="color:#fff !important; background-color:#435761 !important;">MODIFIER</button>
                    <span onclick="document.getElementById('modSujet').style.display='none'">
                  <button id="annuler" class="dh-button  dh-round-large" type="reset" style="color:#fff !important; background-color:#435761 !important;">ANNULER</button>
                </span>
                </p>
            </form:form>
        </div>
    </div>

</div>


<!-- Supprimer Challenge-->
<div id="supChallenge" class="dh-modal">
    <div class="dh-modal-content dh-animate-zoom" style="width:40%">
        <div class="dh-container dh-theme-d2 dh-center">
            <span onclick="document.getElementById('supChallenge').style.display='none'" class="dh-button dh-display-topright dh-large">x</span>
            <h4>Etes-vous sûr de vouloir supprimer ce challenge ?</h4>
        </div>
        <div class="dh-container">
            <div class="dh-padding">
                <button class="dh-button  dh-round dh-theme-d2" type="submit" style="margin-left:100px; color:#fff !important; background-color:#4d636f !important;"><i class="fa fa-check"></i> Confirmer</button>
                <span onclick="document.getElementById('supChallenge').style.display='none'" class="">
              <button class="dh-button  dh-round dh-theme-d2" type="reset" style="color:#fff !important; background-color:#4d636f !important;"><i class=""></i> Annuler</button>
          </span>
            </div>
        </div>
    </div>
</div>