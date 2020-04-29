function modifierSujet(titreSujet, descSujet, imaSujet) {
    /* Données issues de la recette sauvegardée, publiée ou créée*/
    let titre = document.getElementById(titreSujet);
    let descript = document.getElementById(descSujet);   
    let imageSujet = document.getElementById(imaSujet);
    
    /*Récupération des champs dans le formulaire de modification de recette*/
   let titreModif = document.getElementById('titreModif');
   let descriptModif = document.getElementById("descriptionModif");
   let imageModif = document.getElementById("imModif");
  
   /*Mise à jour des champs du formulaire de modification*/
   titreModif.value = titre.textContent;
   descriptModif.value = descript.textContent;
   imageModif.value = imageSujet.textContent;
   
    document.getElementById("modSujet").style.display = "block";
} 

function supprimerSujet(){
    document.getElementById("supSujet").style.display='block';
}
 