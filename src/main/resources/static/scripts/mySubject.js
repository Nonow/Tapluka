function modifierSujet(titreSujet, descSujet, imaSujet, idComp) {
    /* Données issues de la recette sauvegardée, publiée ou créée*/
    let titre = document.getElementById(titreSujet);
    let descript = document.getElementById(descSujet);   
    let imageSujet = document.getElementById(imaSujet);
    let idComponent = document.getElementById(idComp);

    /*Récupération des champs dans le formulaire de modification de recette*/
   let titreModif = document.getElementById('sujetTitreModif');
   let descriptModif = document.getElementById("sujetDescriptionModif");
   let imageModif = document.getElementById("sujetImModif");
   let idHiddenInput = document.getElementById("updateSubjectId");
  
   /*Mise à jour des champs du formulaire de modification*/
   idHiddenInput.value = idComponent.value;
   titreModif.value = titre.textContent;
   descriptModif.value = descript.textContent;
   imageModif.value = imageSujet.textContent;
   
   document.getElementById("modSujet").style.display = "block";
} 

function supprimerSujet(idComp){
   let idComponent = document.getElementById(idComp);
   let idHiddenInput = document.getElementById("deleteSubjectId");
   idHiddenInput.value = idComponent.value;
   document.getElementById("supSujet").style.display='block';
}
 