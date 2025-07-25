import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_genie_intern_task/core/apis/api_error/api_error_handler.dart';
import 'package:reco_genie_intern_task/core/utils/app_dialogs.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/ui/view_model/cart_cubit.dart';
import 'package:reco_genie_intern_task/features/home/layouts/cart_layout/ui/widgets/cart_item.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/di/di.dart';

class CartLayout extends StatefulWidget {
  const CartLayout({super.key});

  @override
  State<CartLayout> createState() => _CartLayoutState();
}

class _CartLayoutState extends State<CartLayout> {
  @override
  void initState() {
    super.initState();
    getIt<CartCubit>().doIntent(GetCartItems());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen:
          (previous, current) =>
              previous.deleteFromCart != current.deleteFromCart,
      listener: (context, state) {
        switch (state.deleteFromCart) {
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
              'Deleted from cart',
              backgroundColor: Colors.red,
            );
          case Status.error:
            AppDialogs.hideDialog(context);
            AppDialogs.showSnackBar(
              context,
              'Failed to delete from cart',
              backgroundColor: Colors.red,
            );
        }
      },
      builder: (context, state) {
        switch (state.getCartItems) {
          case Status.initial:
          case Status.loading:
            return Center(child: CircularProgressIndicator());
          case Status.success:
            if (state.cartItems!.isEmpty) {
              return Center(child: Text('Cart is empty'));
            }
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder:
                          (context, index) =>
                              CartItem(cartItemEntity: state.cartItems![index]),
                      separatorBuilder:
                          (context, index) => SizedBox(height: 12),
                      itemCount: state.cartItems!.length,
                    ),
                  ),
                  SizedBox(height: 16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      context.read<CartCubit>().doIntent(ClearCart());
                    },
                    child: Text('Clear Cart'),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.black[30]!),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Total: ',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(fontSize: 22),
                        ),
                        Text(
                          '${state.totalPrice}\$',
                          style: Theme.of(
                            context,
                          ).textTheme.displaySmall?.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          case Status.error:
            return Center(
              child: Text(
                getIt<ApiErrorHandler>().getMessage(state.getCartItemsError),
              ),
            );
        }
      },
    );
  }
}

