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
  String? id;
  final String? title;
  final String? price;
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
    name: title ?? '',
    quantity: quantity ?? 0,
    price: price ?? '',
    id: id ?? '',
  );
}
