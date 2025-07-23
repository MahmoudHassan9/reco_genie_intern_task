import 'package:reco_genie_intern_task/core/utils/app_constants.dart';

class PopularSideModel {
  final String name;
  final String image;
  final String price;

  PopularSideModel({
    required this.name,
    required this.image,
    required this.price,
  });

  static List<PopularSideModel> popularSides = [
    PopularSideModel(
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7.5',
    ),
    PopularSideModel(
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7.5',
    ),
    PopularSideModel(
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7.5',
    ),
    PopularSideModel(
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7.5',
    ),
    PopularSideModel(
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7.5',
    ),
    PopularSideModel(
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7.5',
    ),
  ];
}
