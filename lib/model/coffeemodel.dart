class Coffee {
  final String type;
  final String image;
  final double price;
  final String topping;

  Coffee({
    required this.type,
    required this.image,
    required this.price,
    required this.topping,
  });
}

List<Coffee> coffee = [
  Coffee(
      type: 'Cappucino',
      image: 'assets/cup1.png',
      price: 4.53,
      topping: 'with Chocolate'),
  Coffee(
      type: 'Espresso',
      image: 'assets/cup2.png',
      price: 4.00,
      topping: 'with Oat Milk'),
  Coffee(
      type: 'Americano',
      image: 'assets/cup3.png',
      price: 3.78,
      topping: 'with Chocolate'),
  Coffee(
      type: 'Latte',
      image: 'assets/cup4.png',
      price: 4.20,
      topping: 'with Chocolate'),
];
