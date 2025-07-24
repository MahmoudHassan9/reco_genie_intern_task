import 'package:reco_genie_intern_task/core/utils/app_constants.dart';

class PopularDishModel {
  final String image;
  final String name;
  final String price;
  String? id;

  PopularDishModel({
    required this.image,
    required this.name,
    required this.price,
    this.id,
  });

  static List<PopularDishModel> popularDishes = [
    PopularDishModel(
      id: '10',
      image: AppConstants.foodImage,
      name: 'Burger',
      price: '10',
    ),
    PopularDishModel(
      id: '11',
      image: AppConstants.foodImage,
      name: 'Burger',
      price: '10',
    ),
    PopularDishModel(
      id: '12',
      image: AppConstants.foodImage,
      name: 'pizza',
      price: '30',
    ),
    PopularDishModel(
      id: '13',
      image: AppConstants.foodImage,
      name: 'pasta',
      price: '20',
    ),
    PopularDishModel(
      id: '14',
      image: AppConstants.foodImage,
      name: 'kbda',
      price: '20',
    ),
    PopularDishModel(
      id: '15',
      image: AppConstants.foodImage,
      name: 'chicken',
      price: '43',
    ),
  ];
}
