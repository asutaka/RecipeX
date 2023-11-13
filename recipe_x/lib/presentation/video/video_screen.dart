import 'package:flutter/material.dart';
import '../../core/domain/model/category_item.dart';
import '../../core/domain/model/grocery_item.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/highLevel/chart_item_widget.dart';
import '../../core/widgets/highLevel/column_with_seprator.dart';
import '../cart/checkout_bottom_sheet.dart';
import '../explore/category_items_screen.dart';
import 'video_detail.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "My Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: getChildrenWithSeperator(
                  addToLastChild: false,
                  widgets: demoItems.map((e) {
                    return InkWell(
                      onTap: () {
                        print("Container was tapped");
                        onCategoryItemClicked(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        width: double.maxFinite,
                        child: ChartItemWidget(
                          item: e,
                        ),
                      ),
                    );
                  }).toList(),
                  seperator: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onCategoryItemClicked(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute(
    builder: (BuildContext context) {
      return VideoDetail();
    },
  ));
}
