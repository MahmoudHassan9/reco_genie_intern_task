import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/data/models/popular_side_model.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../cart_layout/domain/entities/cart_item_entity.dart';
import '../../../cart_layout/ui/view_model/cart_cubit.dart';

class PopularSidesListItem extends StatelessWidget {
  const PopularSidesListItem({super.key, required this.popularSideModel});

  final PopularSideModel popularSideModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primary.withOpacity(0.3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(popularSideModel.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 6),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  popularSideModel.name,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(color: AppColors.black),
                ),
                SizedBox(height: 6),
                Text(
                  '${popularSideModel.price}\$',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Expanded(
            flex: 2,
            child: OutlinedButton(
              onPressed: () {
                context.read<CartCubit>().doIntent(
                  AddToCart(
                    CartModelEntity(
                      items: [
                        CartItemEntity(
                          quantity: 1,
                          name: popularSideModel.name,
                          price: popularSideModel.price,
                          id: popularSideModel.id,
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text('Add to cart'),
            ),
          ),
        ],
      ),
    );
  }
}
