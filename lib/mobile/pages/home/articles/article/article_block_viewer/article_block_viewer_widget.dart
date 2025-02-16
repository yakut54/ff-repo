import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/mobile/pages/home/articles/article/article_block/article_block_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'article_block_viewer_model.dart';
export 'article_block_viewer_model.dart';

class ArticleBlockViewerWidget extends StatefulWidget {
  const ArticleBlockViewerWidget({
    super.key,
    this.articleBlockList,
  });

  final List<ArticleBlockStruct>? articleBlockList;

  @override
  State<ArticleBlockViewerWidget> createState() =>
      _ArticleBlockViewerWidgetState();
}

class _ArticleBlockViewerWidgetState extends State<ArticleBlockViewerWidget> {
  late ArticleBlockViewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticleBlockViewerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Builder(
          builder: (context) {
            final columnList = widget.articleBlockList?.toList() ?? [];

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(columnList.length, (columnListIndex) {
                  final columnListItem = columnList[columnListIndex];
                  return Builder(
                    builder: (context) {
                      if (columnListItem.type == ArticleBlockType.youtube) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 7.5, 12.0, 7.5),
                          child: FlutterFlowYoutubePlayer(
                            url: functions
                                .stringToVideoPath(columnListItem.link)!,
                            autoPlay: false,
                            looping: true,
                            mute: false,
                            showControls: true,
                            showFullScreen: true,
                            strictRelatedVideos: false,
                          ),
                        );
                      } else {
                        return ArticleBlockWidget(
                          key: Key(
                              'Keyfus_${columnListIndex}_of_${columnList.length}'),
                          articleBlock: columnListItem,
                          onChange: (articleBlock) async {},
                        );
                      }
                    },
                  );
                })
                    .addToStart(SizedBox(height: 20.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            );
          },
        ),
      ),
    );
  }
}
