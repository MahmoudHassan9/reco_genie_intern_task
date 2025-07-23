import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/entities/cart_item_entity.dart';

class CartModel {
  final List<CartItem>? items;

  CartModel({this.items});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: json['items'].map<CartItem>((e) => CartItem.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {'items': items};
}

class CartItem {
  final String? id;
  final String? title;
  final num? price;
  final int? quantity;

  CartItem({this.id, this.title, this.price, this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'quantity': quantity,
  };

  CartItemEntity toEntity() => CartItemEntity(
    id: id ?? '',
    name: title ?? '',
    quantity: quantity ?? 0,
    price: price ?? 0,
  );
}
