import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:recipe_x/domain/entity/videoDTO.dart';
import '../../core/data/sharedpref/getItInstance.dart';
import '../../core/widgets/highLevel/video_item_widget.dart';
import '../../core/widgets/progress_indicator_widget.dart';
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
            : Material(child: _buildListView());
      },
    );
  }

  Widget _buildListView() {
    return _postStore.lVideo != null
        ? ListView.separated(
            itemCount: _postStore.lVideo!.lData!.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return _buildListItem(position);
            },
          )
        : Center(
            child: Text(
              'home_tv_no_post_found',
            ),
          );
  }

  Widget _buildListItem(int position) {
    final VideoAPIDTO item =
        _postStore.lVideo?.lData?[position] ?? new VideoAPIDTO();
    return InkWell(
      onTap: () {
        onCategoryItemClicked(context, item.videoId ?? "", item.title ?? "");
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        width: double.maxFinite,
        child: VideoItemWidget(
          item: item,
        ),
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

void onCategoryItemClicked(BuildContext context, String videoId, String title) {
  Navigator.of(context).push(new MaterialPageRoute(
    builder: (BuildContext context) {
      return VideoDetail(
        videoId: videoId,
        title: title,
      );
    },
  ));
}
