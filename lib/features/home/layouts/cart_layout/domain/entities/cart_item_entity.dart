import 'package:equatable/equatable.dart';

import '../../data/models/cart_model.dart';

class CartModelEntity extends Equatable {
  final List<CartItemEntity> items;

  const CartModelEntity({required this.items});

  CartModel toCartModel() =>
      CartModel(items: items.map((e) => e.toCartItem()).toList());

  @override
  List<Object?> get props => [items];
}

class CartItemEntity extends Equatable {
  final String name;
  final int quantity;
  final String price;
  final String? id;

  const CartItemEntity({
    required this.name,
    required this.quantity,
    required this.price,
    this.id,
  });

  CartItem toCartItem() =>
      CartItem(title: name, quantity: quantity, price: price, id: id);

  @override
  List<Object?> get props => [name, quantity, price];
}
