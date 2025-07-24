import 'package:flutter/cupertino.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/data/models/popular_side_model.dart';
import 'package:reco_genie_intern_task/features/home/layouts/menu_layout/ui/widgets/popular_sides_list_item.dart';

class PopularSidesList extends StatelessWidget {
  const PopularSidesList({super.key, required this.popularSides});

  final List<PopularSideModel> popularSides;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder:
          (context, index) =>
              PopularSidesListItem(popularSideModel: popularSides[index]),
      itemCount: popularSides.length,
      separatorBuilder: (context, index) => SizedBox(width: 12),
    );
  }
}
