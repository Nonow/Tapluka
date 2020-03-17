$( document ).ready(function() {
  //valeur quantite selecteur initial
  $("#adult-quantity").val(1);
  $("#child-quantity").val(0);

  //valeur quantite initial pour un adulte
  var tabQuantity=[];
  $(".quantity").each(function(){
    tabQuantity.push(parseFloat($(this).text()));
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
        majQuantity(tabQuantity);
        console.log("click on remove");
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
    $(this).text(newQuantity);
  });
}
