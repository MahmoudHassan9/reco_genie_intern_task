import 'package:reco_genie_intern_task/core/utils/app_constants.dart';

class PopularDishModel {
  final String image;
  final String name;
  final String price;

  PopularDishModel({
    required this.image,
    required this.name,
    required this.price,
  });

  static List<PopularDishModel> popularDishes = [
    PopularDishModel(
      image: AppConstants.foodImage,
      name: 'Burger',
      price: '10.00',
    ),
    PopularDishModel(
      image: AppConstants.foodImage,
      name: 'Pizza',
      price: '20.00',
    ),
    PopularDishModel(
      image: AppConstants.foodImage,
      name: 'Pasta',
      price: '15.00',
    ),
    PopularDishModel(
      image: AppConstants.foodImage,
      name: 'Burger',
      price: '10.00',
    ),
    PopularDishModel(
      image: AppConstants.foodImage,
      name: 'Pizza',
      price: '20.00',
    ),
    PopularDishModel(
      image: AppConstants.foodImage,
      name: 'Pasta',
      price: '15.00',
    ),
  ];
}
