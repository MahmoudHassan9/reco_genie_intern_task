import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_intern_task/core/colors/app_colors.dart';
import 'package:reco_genie_intern_task/core/utils/app_dialogs.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/ui/view_model/cart_cubit.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/data/models/popular_dish_model.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/data/models/popular_side_model.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/ui/widgets/popular_dishes_list.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/ui/widgets/popular_sides_list.dart';

class MenuLayout extends StatelessWidget {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen:
          (previous, current) => previous.addToCart != current.addToCart,
      listener: (context, state) {
        switch (state.addToCart) {
          case Status.initial:
            break;
          case Status.loading:
            AppDialogs.displayDialog(
              title: Center(child: CircularProgressIndicator()),
              context: context,
            );
          case Status.success:
            AppDialogs.hideDialog(context);
            AppDialogs.showSnackBar(
              context,
              'Added to cart',
              backgroundColor: Colors.green,
            );

          case Status.error:
            AppDialogs.hideDialog(context);
            AppDialogs.showSnackBar(
              context,
              'Failed to add to cart',
              backgroundColor: Colors.red,
            );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Dishes',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 3,
              child: PopularDishesList(
                popularDishes: PopularDishModel.popularDishes,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Popular Sides',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: PopularSidesList(
                popularSides: PopularSideModel.popularSides,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
