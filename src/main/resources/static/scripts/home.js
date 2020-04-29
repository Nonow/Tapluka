
  /*Modifier Recette*/
  let mRec = document.getElementById('modifRec');
  mRec.addEventListener('click', () => {
    /* Données issues du formulaire de création recette*/
    let titre = document.getElementById('titreR');
    let descript = document.getElementById("descriptionRec");
    let part = document.getElementById("part");
    let categorie = document.getElementById("categorie");
    let imageRec = document.getElementById("imageRec");

    /*Récupération des champs dans le formulaire de modification de recette*/
    let titreModif = document.getElementById('titreModif');
    let descriptModif = document.getElementById("descriptionModif");
    let partModif = document.getElementById("partModif");
    let categorieModif = document.getElementById("categorieModif");
    let imageModif = document.getElementById("imModif");

    /*Mise à jour des champs du formulaire de modification*/
    titreModif.value = titre.textContent;
    descriptModif.textContent = descript.textContent;
    partModif.textContent = part.textContent;
    categorieModif.textContent = categorie.textContent;
    imageModif.textContent = imageRec.textContent;

    document.getElementById("Modifrecette").style.display='block';
  });
 
  /* Supprimer Recette*/
  let sRec = document.getElementById('supRec');
  sRec.addEventListener('click', () => {
   
    document.getElementById("supAvRec").style.display='block';
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
  pub_1_apres.textContent= pub1_avant.textContent;
  document.getElementById('pub1').style.display='block';
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
  if (inscrit_entier==total_entier)
    inscrit.textContent = total_entier;

  inscrit.textContent = inscrit_entier;
}

/* Modification Avis */
function modifierAvis(avisPub) {
    /* Données issues de l'avis publié*/
    let avis = document.getElementById(avisPub);   
    
    /*Récupération des champs dans le formulaire de modification de recette*/
   let avisModif = document.getElementById('aviModi');
  
   /*Mise à jour des champs du formulaire de modification*/
   avisModif.value = avis.textContent;
   
   
    document.getElementById("publicationAvis").style.display = "block";
}

/* Supprimer Avis */

function supprimerAvis(){
    document.getElementById("suprimerAvis").style.display='block';
}
/* Publier Avis */
function publierAvis(){
    document.getElementById("publierAvis").style.display='block';
}

document.getElementById("btnCom").click();

/*Modifier statut Bouton J'aime*/
function likeFunction(x) {
  x.style.fontWeight = "bold";
  x.innerHTML = "✓ Liked";
}

/*Voir commentaire et commenter*/
 
 function voirComment(id, s) {
    var x = document.getElementById(id); //on récupères l'id du bloc caché
    var sep = document.getElementById(s); //Séparateurs (optionnel)

    if (x.className.indexOf("dh-show") == -1) { //Si les commentaires sont cachés
      x.className += " dh-show";

      sep.className = x.className.replace("dh-show", "dh-hide");
    } else {  //Si les commentaires sont visibles
      x.className = x.className.replace("dh-show", "");
      sep.className += " dh-show";
    }
    
  }
  
 /* Noter */
function noter(item)
{
    let maNote = document.getElementById('note');
    let count=item.id[0];
    sessionStorage.starRating = count; //On stocke localement l'état courant la note
    let subid= item.id.substring(1);//on recupère le premier caractère de l'id 
    for(let i=0;i<5;i++){
        if(i<count){
            document.getElementById((i+1)+subid).style.color="orange";
            maNote.textContent = count;
        }
        else{
            document.getElementById((i+1)+subid).style.color="#000";
        }
    }

}