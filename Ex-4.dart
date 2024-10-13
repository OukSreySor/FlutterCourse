void main(){
  const pizzaPrices = { 
  'margherita': 5.5, 
  'pepperoni': 7.5, 
  'vegetarian': 6.5, 
  }; 
  //find totalPrice of these order pizza
  const order = ['margherita', 'pepperoni']; 
  double totalPrice = 0;
  pizzaPrices.forEach((key, value){
    if(order.contains(key)){
      totalPrice += value;
    }  
  });
  print(totalPrice);
}
