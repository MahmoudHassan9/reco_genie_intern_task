import '../../data/models/cart_model.dart';

class CartModelEntity {
  final List<CartItemEntity> items;

  CartModelEntity({required this.items});

  CartModel toCartModel() =>
      CartModel(items: items.map((e) => e.toCartItem()).toList());
}

class CartItemEntity {
  final String name;
  final int quantity;
  final String price;
  final String? id;

  CartItemEntity({
    required this.name,
    required this.quantity,
    required this.price,
    this.id,
  });

  CartItem toCartItem() =>
      CartItem(title: name, quantity: quantity, price: price, id: id);
}
