import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/data/models/cart_model.dart';

import '../../../../../../core/utils/app_constants.dart';
import 'cart_service.dart';

@Injectable(as: CartService)
class CartServiceImpl implements CartService {
  final FirebaseFirestore _fireStore;
  final FirebaseAuth _firebaseAuth;

  CartServiceImpl(this._fireStore, this._firebaseAuth);

  CollectionReference<CartItem> _getCartCollection() {
    return _fireStore
        .collection(AppConstants.firebaseUserCollection)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(AppConstants.firebaseCartCollection)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return CartItem.fromJson(snapshot.data()!);
          },
          toFirestore: (cartDto, options) {
            return cartDto.toJson();
          },
        );
  }

  @override
  Future<void> addToCart(CartModel cartModel) async {
    for (var element in cartModel.items!) {
      await _getCartCollection().doc(element.id).set(element);
    }
  }

  @override
  Future<void> clearCart() {
    return _getCartCollection().get().then(
      (value) => value.docs.forEach((element) => element.reference.delete()),
    );
  }

  @override
  Future<List<CartItem>> getCartItems() {
   return _getCartCollection().get().then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> removeFromCart(CartItem cartItem) {
    return _getCartCollection().doc(cartItem.id).delete();
  }

  @override
  Future<void> updateCart(CartItem cartItem) {
    return _getCartCollection().doc(cartItem.id).update(cartItem.toJson());
  }
}
