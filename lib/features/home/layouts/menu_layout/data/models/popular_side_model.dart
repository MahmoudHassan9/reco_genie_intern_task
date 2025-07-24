import 'package:reco_genie_intern_task/core/utils/app_constants.dart';

class PopularSideModel {
  final String name;
  final String image;
  final String price;
  String? id;

  PopularSideModel({
    required this.name,
    required this.image,
    required this.price,
    this.id,
  });

  static List<PopularSideModel> popularSides = [
    PopularSideModel(
      id: '1',
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7',
    ),
    PopularSideModel(
      id: '2',
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7',
    ),
    PopularSideModel(
      id: '3',
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7',
    ),
    PopularSideModel(
      id: '4',
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7',
    ),
    PopularSideModel(
      id: '5',
      name: 'Burger',
      image: AppConstants.foodImage,
      price: '7',
    ),
  ];
}
