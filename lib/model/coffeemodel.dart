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
      type: 'Cappucino',
      image: 'assets/cup2.png',
      price: 4.53,
      topping: 'with Oat Milk'),
  Coffee(
      type: 'Cappucino',
      image: 'assets/cup3.png',
      price: 4.53,
      topping: 'with Chocolate'),
  Coffee(
      type: 'Cappucino',
      image: 'assets/cup4.png',
      price: 4.53,
      topping: 'with Chocolate'),
];
