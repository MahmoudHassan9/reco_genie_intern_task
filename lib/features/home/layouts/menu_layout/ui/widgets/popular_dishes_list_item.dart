import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/domain/entities/cart_item_entity.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../cart_layout/ui/view_model/cart_cubit.dart';
import '../../data/models/popular_dish_model.dart';

class PopularDishesListItem extends StatelessWidget {
  const PopularDishesListItem({super.key, required this.popularDishModel});

  final PopularDishModel popularDishModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primary.withAlpha((0.3 * 255).round()),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(popularDishModel.image),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  popularDishModel.name,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(color: AppColors.black),
                ),
                SizedBox(height: 6),
                Text(
                  '${popularDishModel.price}\$',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: OutlinedButton(
                onPressed: () {
                  int quantity = context.read<CartCubit>().doIntent(
                    GetQuantity(popularDishModel.id!),
                  );
                  context.read<CartCubit>().doIntent(
                    AddToCart(
                      CartModelEntity(
                        items: [
                          CartItemEntity(
                            quantity: quantity >= 1 ? quantity + 1 : 1,
                            name: popularDishModel.name,
                            price: popularDishModel.price,
                            id: popularDishModel.id,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Text('Add to cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
