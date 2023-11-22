import 'package:flutter/material.dart';

import '../../../domain/entity/videoDTO.dart';
import '../app_text.dart';

class VideoItemWidget extends StatefulWidget {
  VideoItemWidget({Key? key, required this.item}) : super(key: key);
  final VideoAPIDTO item;

  @override
  _ChartItemWidgetState createState() => _ChartItemWidgetState();
}

class _ChartItemWidgetState extends State<VideoItemWidget> {
  final double height = 110;

  final Color borderColor = Color(0xffE2E2E2);

  final double borderRadius = 18;

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://img.youtube.com/vi/${widget.item.videoId ?? ""}/0.jpg',
                  width: 200,
                  height: 80,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 5,
                ),
                AppText(
                    text: widget.item.title ?? "",
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ],
            )
          ],
        ),
      ),
    );
  }
}
