function modifierChallenge(titreChal, descChal, imChal, idComp) {

    let idComponent = document.getElementById(idComp);
    let idHiddenInput = document.getElementById("updateChallengeId");
    idHiddenInput.value = idComponent.value;

    /* Données issues de la recette sauvegardée, publiée ou créée*/
    let titre = document.getElementById(titreChal);
    let descript = document.getElementById(descChal);   
    let imageC = document.getElementById(imChal);
    
    /*Récupération des champs dans le formulaire de modification de recette*/
   let titreModif = document.getElementById('titreMod');
   let descriptModif = document.getElementById("detailMod");
   let imageModif = document.getElementById("imageMod");
  
   /*Mise à jour des champs du formulaire de modification*/
   titreModif.value = titre.textContent;
   descriptModif.value = descript.textContent;
   imageModif.value = imageC.textContent;
   
    document.getElementById("modifChallenge").style.display = "block";
} 

function supprimerChallenge(idComp){
       let idComponent = document.getElementById(idComp);
       let idHiddenInput = document.getElementById("deleteChallengeId");
       idHiddenInput.value = idComponent.value;
    document.getElementById("supChallenge").style.display='block';
}
 