import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../core/data/sharedpref/getItInstance.dart';
import '../../core/domain/model/category_item.dart';
import '../../core/widgets/app_text.dart';
import '../../core/widgets/highLevel/category_item_card_widget.dart';
import '../../core/widgets/highLevel/search_bar_widget.dart';
import '../explore/category_items_screen.dart';
import '../post/store/post_store.dart';

List<Color> gridColors = [
  Color(0xff53B175),
  Color(0xffF8A44C),
  Color(0xffF7A593),
  Color(0xffD3B0E0),
  Color(0xffFDE598),
  Color(0xffB7DFF5),
  Color(0xff836AF6),
  Color(0xffD73B77),
];

class ResourceScreen extends StatelessWidget {
  @override
  _ResourceScreen createState() => _ResourceScreen();
}

class _ResourceScreen extends State<ResourceScreen> {
  final PostStore _postStore = getIt<PostStore>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // check to see if already called api
    if (!_postStore.loading) {
      _postStore.getVideo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          getHeader(),
          Expanded(
            child: getStaggeredGridView(context),
          ),
        ],
      ),
    ));
  }

  Widget getHeader() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: AppText(
            text: "Find Products",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SearchBarWidget(),
        ),
      ],
    );
  }

  Widget getStaggeredGridView(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
          int index = e.key;
          CategoryItem categoryItem = e.value;
          return GestureDetector(
            onTap: () {
              onCategoryItemClicked(context, categoryItem);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: CategoryItemCardWidget(
                item: categoryItem,
                color: gridColors[index % gridColors.length],
              ),
            ),
          );
        }).toList(),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 4.0, // add some space
      ),
    );
  }
}

void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
  Navigator.of(context).push(new MaterialPageRoute(
    builder: (BuildContext context) {
      return CategoryItemsScreen();
    },
  ));
}
