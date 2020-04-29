
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