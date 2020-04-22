$( document ).ready(function() {
  //valeur quantite selecteur initial
  $("#adult-quantity").val(1);
  $("#child-quantity").val(0);

  //valeur quantite initial pour un adulte
  var tabQuantity=[];
  $(".quantity").each(function(){
    tabQuantity.push(parseFloat($(this).text()));
  });

  var tabPreparation=[];
  $(".preparation").each(function(){
    tabPreparation.push($(this).text());
  });

  //listener pour ajouter une personne
    $( ".btn-add" ).click(function() {
        var quantity=$(this).prev().val();
        console.log(quantity);
        if (quantity=="") {
          $(this).prev().val(1);
        }
        else {
            quantity++;
            $(this).prev().val(quantity);
            console.log("ajout d'une unité");
        }
        //on met a jour les quantites
        majQuantity(tabQuantity);
        console.log("click on ajout");
    });

    //listener pour supprimer une personne
    $( ".btn-remove" ).click(function() {
        //on stock la quantite initial du input
        var quantity=$(this).next().val();
        //id de l'input selectioné et du parenté
        var idHere=$(this).next().attr("id");
        var idThere;
        if(idHere=="adult-quantity"){
          idThere=$("#child-quantity");
        }
        else{
          idThere=$("#adult-quantity");
        }
        //condition pour gerer le zero
        if (quantity=="" || quantity<=1) {
          if (idThere.val()==0){
            $(this).next().val(1);
          }
          else{
            $(this).next().val(0);
          }
        }
        //ici on peut diminuer
        else {
            quantity--;
            $(this).next().val(quantity);
            console.log("suppresion d'une unité");
        }
        //on met a jour les quantites
        majQuantity(tabQuantity);
        console.log("click on remove");
    });

    //listener pour insertions clavier
    $(".input-quantity").keyup(function() {
        var quantity=$(this).val();
        if(quantity!=""){
          var idHere=$(this).attr("id");
          var idThere;
          if(idHere=="adult-quantity"){
            idThere=$("#child-quantity");
          }
          else{
            idThere=$("#adult-quantity");
          }
          //condition pour gerer le zero
          if (quantity==0) {
            if (idThere.val()==0){
              $(this).val(1);
            }
            else{
              $(this).val(0);
            }
          }
          //on met a jour les quantites
          majQuantity(tabQuantity);
        }
    });

    // modifier couleur étoile des favoris
    $(".favoris-btn").hover(function(){
        $(".favoris-star").css("color","white");
    }, function(){
        $(".favoris-star").css("color","yellow");
    });

    //Traitement checkbox Thermomix
    $("#thermomix").click(function(){
      if( $(this).is(':checked') ){
        $(".preparation").each(function(){
          if(stringMatch($(this).text(),"pétrir") || stringMatch($(this).text(),"malaxer")){
            $(this).text("Pétrir ou malaxer en utilisant la fonction épi du thermomix");
            $(this).css("color","green");
          }
          if(stringMatch($(this).text(),"fouetter") || stringMatch($(this).text(),"battre")){
            $(this).text("Fouetter ou battre en insérant le fouet avec des vitesses inférieur à 4");
            $(this).css("color","green");
          }
          if(stringMatch($(this).text(),"mélanger")){
            $(this).text("Pour mélanger tout-en-un : 30 à 45 sec/Vitesse3 - Pour ingrédients liquide 20 sec/Vitesse 5 puis ingrédient sec 20 sec/Vitesse3 - Pour de la pâte 50 sec/Vitesse 4");
            $(this).css("color","green");
          }
          if(stringMatch($(this).text(),"fondre") || stringMatch($(this).text(),"fusionner")){
            $(this).text("Pour chocolat noir/au lait 5min à 50°C vitesse 1 - Pour chocolat blanc 4 min à 45 °C vitesse 1 - Pour du beurre 3min/55°C/Vitesse 2");
            $(this).css("color","green");
          }
          if(stringMatch($(this).text(),"hacher") || stringMatch($(this).text(),"râper") || stringMatch($(this).text(),"broyer")){
            $(this).text("Hacher, râper ou broyer en mettant vitesses turbo,10 ou 9 quelques secondes jusqu'à obtenir le résultat souhaité");
            $(this).css("color","green");
          }
        });
      }
      else if($(this).is(':checked')==false){
        $(".preparation").css("color","black");
        $(".preparation").each(function(index){
          $(this).text(tabPreparation[index]);
        });
      }
    });

    console.log( "ready!" );



});

//fonction pour calculer et mettre à jour les quantités
function majQuantity(tabQ){
  var adultQuantity=$("#adult-quantity").val();
  var childQuantity=$("#child-quantity").val();
  $(".quantity").each(function(index){
    accurateQuantity=tabQ[index];
    newQuantity=(accurateQuantity*adultQuantity)+((accurateQuantity/2)*childQuantity);
    if(Number.isInteger(newQuantity)==false){
      newQuantity=newQuantity.toFixed(2);
    }
    $(this).text(newQuantity);
  });
}

//fonction pour tester si un mots est dans une string
function stringMatch(str1,str2){
  var str2bis=str2.charAt(0).toUpperCase() + str2.slice(1) //première lettre en maj
  if(str1.indexOf(str2)!=-1){
    return true;
  }
  else if(str1.indexOf(str2bis)!=-1){
    return true;
  }
  else{
    return false;
  }
}
