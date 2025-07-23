import 'package:flutter/cupertino.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/data/models/popular_dish_model.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/ui/widgets/popular_dishes_list_item.dart';

class PopularDishesList extends StatelessWidget {
  const PopularDishesList({super.key, required this.popularDishes});

  final List<PopularDishModel> popularDishes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) =>
              PopularDishesListItem(popularDishModel: popularDishes[index]),
      itemCount: popularDishes.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
    );
  }
}
