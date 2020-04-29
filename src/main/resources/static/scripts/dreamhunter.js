 // Accordion
 function myFunction(id) {
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
  
  // Used to toggle the menu on smaller screens when clicking on the menu button
  function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("dh-show") == -1) {
      x.className += " dh-show";
    } else { 
      x.className = x.className.replace(" dh-show", "");
    }
  }

  // Tabbed Menu
function openMenu(evt, menuName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("menu");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  /*tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    //tablinks[i].className = tablinks[i].className.replace(" dh-dark-grey", "");
  }*/
  document.getElementById(menuName).style.display = "block";
  //evt.currentTarget.firstElementChild.className += " dh-dark-grey";
}
document.getElementById("myLink").click();


  // controle icone notification #####MichDavh###Droit d'auteur
function notif(evt, notifNameId, notifNameClass) {
  var i, x;
  x = document.getElementsByClassName(notifNameClass);
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById(notifNameId).style.display = "inline";
}
document.getElementById("notif1_off").click();
document.getElementById("notif2_off").click();
document.getElementById("notif3_off").click();
document.getElementById("notif4_off").click();
document.getElementById("notif5_off").click();
document.getElementById("notif6_off").click();
document.getElementById("notif7_off").click();
document.getElementById("notif8_off").click();
document.getElementById("notif9_off").click();
document.getElementById("notif10_off").click();

/* Fonctions de modification avant Propos */
function modifAvPropos() {
  //data-target="#modPropos"
 //let editText = document.createElement('input');
 let texte = document.getElementById('contentPropos');
 /*texte.contentEditable = true;
 texte.style.backgroundColor = "#fff";
 texte.className = 'dh-border';*/
 let editText = document.getElementById("aprop");
 editText.contentEditable = true;
 editText.textContent= texte.textContent;
 //texte.style.backgroundColor = '#ffbd69';
 document.getElementById("prop").style.display='block';
 //document.getElementById('recette').style.display='block'
}


// Accordion 
/*function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("dh-show") == -1) {
    x.className += " dh-show";
  } else {
    x.className = x.className.replace(" dh-show", "");
  }
}

document.getElementById("myBtn").click();*/