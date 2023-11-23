import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipe_x/domain/entity/resourceDTO.dart';

import '../../core/data/sharedpref/getItInstance.dart';
import '../../core/domain/model/category_item.dart';
import '../../core/widgets/app_text.dart';
import '../../core/widgets/highLevel/resource_item_widget.dart';
import '../../core/widgets/progress_indicator_widget.dart';
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

class ResourceScreen extends StatefulWidget {
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
      _postStore.getResource();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _postStore.loading
            ? CustomProgressIndicatorWidget()
            : Scaffold(
                body: SafeArea(
                child: Column(children: [
                  getHeader(),
                  Expanded(
                    child: getStaggeredGridView(context),
                  ),
                ]),
              ));
      },
    );
  }

  Widget getHeader() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: AppText(
            text: "Tìm theo nguyên liệu",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget getStaggeredGridView(BuildContext context) {
    var lData = _postStore.lResource!.lData;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        children: lData!.asMap().entries.map<Widget>((e) {
          int index = e.key;
          ResourceDTO item = e.value;
          return GestureDetector(
            onTap: () {
              // onCategoryItemClicked(context, categoryItem);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: ResourceItemWidget(
                item: item,
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

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_postStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_postStore.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: 'home_tv_error',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}

void onCategoryItemClicked(BuildContext context, CategoryItem categoryItem) {
  Navigator.of(context).push(new MaterialPageRoute(
    builder: (BuildContext context) {
      return CategoryItemsScreen();
    },
  ));
}
