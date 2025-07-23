import '../../data/models/cart_model.dart';

class CartModelEntity {
  final List<CartItemEntity> items;

  CartModelEntity({required this.items});

  CartModel toCartModel() =>
      CartModel(items: items.map((e) => e.toCartItem()).toList());
}

class CartItemEntity {
  final String id;
  final String name;
  final int quantity;
  final num price;

  CartItemEntity({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  CartItem toCartItem() =>
      CartItem(id: id, title: name, quantity: quantity, price: price);
}
