import 'package:flutter/material.dart';
import 'package:recipe_x/domain/entity/video_api_dto.dart';
import '../../core/data/sharedpref/getItInstance.dart';
import '../../core/domain/model/grocery_item.dart';
import '../../core/widgets/highLevel/column_with_seprator.dart';
import '../../core/widgets/highLevel/video_item_widget.dart';
import '../post/store/post_store.dart';
import 'video_detail.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreen createState() => _VideoScreen();
}

class _VideoScreen extends State<VideoScreen> {
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
                        child: VideoItemWidget(
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
