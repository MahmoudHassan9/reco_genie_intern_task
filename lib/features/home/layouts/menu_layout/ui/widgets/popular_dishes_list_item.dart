import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../data/models/popular_dish_model.dart';

class PopularDishesListItem extends StatelessWidget {
  const PopularDishesListItem({super.key, required this.popularDishModel});

  final PopularDishModel popularDishModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primary.withOpacity(0.3),
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
                Text('${popularDishModel.price}\$', style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Add to cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
