function modifierRecette(idModifRec, titreRec, desRec, parRec, catRec, imRec, dureRecPrep, dureRecCuis, idRec){

     /* Données issues de la recette sauvegardée, créée, publiée*/
   let titre = document.getElementById(titreRec);
   let descript = document.getElementById(desRec);
   let part = document.getElementById(parRec);
   let categorie = document.getElementById(catRec);
   let imageRec = document.getElementById(imRec);
   let dureP = document.getElementById(dureRecPrep);
   let dureC = document.getElementById(dureRecCuis);
   let id = document.getElementById(idRec);
    
    /*Récupération des champs dans le formulaire de modification de recette*/
   let titreModif = document.getElementById('titreModif');
   let descriptModif = document.getElementById("descriptionModif");
   let imageModif = document.getElementById("imModif");
   let catModif = document.getElementById("categorieModif");
   let partModif = document.getElementById("partModif");
   let durPModif = document.getElementById("durePModif");
   let durCModif = document.getElementById("dureCModif");
   let idHiddenInput = document.getElementById("updateRecipeId");

   /*Mise à jour des champs du formulaire de modification*/
   titreModif.value = titre.textContent;
   descriptModif.value = descript.textContent;
   imageModif.src = imageRec.src;
   //imageModif.setAttribute(imageRec.getAttribute('src'));
    catModif.options[catModif.selectedIndex].value = categorie.textContent;
    partModif.options[partModif.selectedIndex].value = part.textContent;
    durPModif.value = dureP.textContent;
    durCModif.value = dureC.textContent;
    idHiddenInput.value = id.value;
    document.getElementById(idModifRec).style.display = "block";
} 

/* Supprimer une recette */
function supprimerRecette(idSRece, idRec){
    let idComponent = document.getElementById(idRec);
    let idHiddenInput = document.getElementById('deleteRecipeId');
    idHiddenInput.value = idComponent.value;
    document.getElementById(idSRece).style.display='block';
}

/* Détails Recette */

  function detailRecette(idDetail) {
    var x = document.getElementById(idDetail);
    var i, y;

    y = document.getElementsByClassName("detail");
    for (i = 0; i < y.length; i++) {
       //if (y[i].className.indexOf("dh-show") !== -1)
            y[i].className = y[i].className.replace("dh-show", "");

    }
    if (x.className.indexOf("dh-show") == -1) {
        x.className += " dh-show";

       
     } else { 
          
        x.className = x.className.replace("dh-show", "");
      }

       
    
  }