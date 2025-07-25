import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../view_model/cart_cubit.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  ValueNotifier<int> quantity = ValueNotifier<int>(1);

  @override
  void initState() {
    super.initState();
    quantity.value = widget.cartItemEntity.quantity;
  }

  @override
  void dispose() {
    super.dispose();
    getIt<CartCubit>().doIntent(
      UpdateCart(
        CartItemEntity(
          name: widget.cartItemEntity.name,
          price: widget.cartItemEntity.price,
          quantity: quantity.value,
          id: widget.cartItemEntity.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(AppConstants.foodImage, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cartItemEntity.name,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(color: AppColors.black),
                ),
                Text(
                  '${widget.cartItemEntity.price}\$',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 25,
                      constraints: BoxConstraints(maxHeight: 25, maxWidth: 25),
                      style: IconButton.styleFrom(
                        shape: CircleBorder(
                          side: BorderSide(color: AppColors.black[30]!),
                        ),
                      ),
                      icon: const Icon(Icons.remove, color: AppColors.primary),
                      onPressed: () {
                        if (quantity.value > 1) {
                          quantity.value--;
                          context.read<CartCubit>().doIntent(
                            CounterDecrement(
                              int.parse(widget.cartItemEntity.price),
                            ),
                          );
                        }
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: quantity,
                      builder: (context, value, child) {
                        return Text(
                          quantity.value.toString(),
                          style: Theme.of(context).textTheme.displaySmall,
                        );
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 25,
                      constraints: BoxConstraints(maxHeight: 25, maxWidth: 25),
                      style: IconButton.styleFrom(
                        shape: CircleBorder(
                          side: BorderSide(color: AppColors.black[30]!),
                        ),
                      ),
                      icon: const Icon(Icons.add, color: AppColors.primary),
                      onPressed: () {
                        quantity.value++;
                        context.read<CartCubit>().doIntent(
                          CounterIncrement(
                            int.parse(widget.cartItemEntity.price),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.red),
            onPressed: () {
              context.read<CartCubit>().doIntent(
                RemoveFromCart(widget.cartItemEntity),
              );
            },
          ),
        ],
      ),
    );
  }
}
