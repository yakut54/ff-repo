import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/ui/new_feed_card/new_feed_card_widget.dart';
import '/mobile/ui/preloader/preloader_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'news_feed_page_model.dart';
export 'news_feed_page_model.dart';

class NewsFeedPageWidget extends StatefulWidget {
  const NewsFeedPageWidget({super.key});

  @override
  State<NewsFeedPageWidget> createState() => _NewsFeedPageWidgetState();
}

class _NewsFeedPageWidgetState extends State<NewsFeedPageWidget> {
  late NewsFeedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsFeedPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isCanLoad = await action_blocks.canLoad(context);
      if (_model.isCanLoad!) {
        _model.pageState = PageState.loaded;
        safeSetState(() {});
        _model.pageState = PageState.loading;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 2000));
      } else {
        _model.pageState = PageState.failure;
        safeSetState(() {});
        return;
      }

      await action_blocks.updateOnlineStatus(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (FFAppState().SuggestionState.isNotEmpty) {
                          return Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 3.0),
                                child: Builder(
                                  builder: (context) {
                                    final suggestionItem =
                                        FFAppState().SuggestionState.toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                                suggestionItem.length,
                                                (suggestionItemIndex) {
                                          final suggestionItemItem =
                                              suggestionItem[
                                                  suggestionItemIndex];
                                          return Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFBA1515),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                suggestionItemItem.name,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Akrobat',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          );
                                        })
                                            .divide(SizedBox(width: 10.0))
                                            .addToStart(SizedBox(width: 20.0))
                                            .addToEnd(SizedBox(width: 20.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.preloaderModel,
                            updateCallback: () => safeSetState(() {}),
                            child: PreloaderWidget(
                              namePreloader: 'horizontalRotatingDots',
                              size: 90.0,
                            ),
                          );
                        }
                      },
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final articleItem =
                                FFAppState().ArticlesState.toList();
                            if (articleItem.isEmpty) {
                              return Center(
                                child: PreloaderWidget(
                                  namePreloader: 'staggeredDotsWave',
                                  size: 100.0,
                                ),
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                14.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: articleItem.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 4.0),
                              itemBuilder: (context, articleItemIndex) {
                                final articleItemItem =
                                    articleItem[articleItemIndex];
                                return wrapWithModel(
                                  model: _model.newFeedCardModels.getModel(
                                    articleItemIndex.toString(),
                                    articleItemIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: NewFeedCardWidget(
                                    key: Key(
                                      'Key694_${articleItemIndex.toString()}',
                                    ),
                                    articleItem: articleItemItem,
                                    onCommentsPressed: () async {},
                                    onTap: () async {},
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
