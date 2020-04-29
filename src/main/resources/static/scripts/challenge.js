function modifierChallenge(titreChal, descChal, imChal) {
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

function supprimerChallenge(){
    document.getElementById("supChallenge").style.display='block';
}
 