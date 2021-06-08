var cart = [];

    var i = 0;
    function buttonClick(item_id) {
      if (confirm("Acheter la photo numéro " + item_id +" ?")) { 
      document.getElementById('inc').value = ++i;
      cart.push(item_id);
      console.log(cart);
      }
else{
   
}
   }