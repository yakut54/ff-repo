import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/empty_list_component/empty_list_component_widget.dart';
import '/mobile/pages/home/ui/feed_card/feed_card_widget.dart';
import '/mobile/ui/mobile_pop_up/mobile_pop_up_widget.dart';
import '/mobile/ui/no_internet/no_internet_widget.dart';
import '/web/ui/cards/story_card/story_card_widget.dart';
import '/web/ui/cards/suggestion_card/suggestion_card_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feed_page_model.dart';
export 'feed_page_model.dart';

class FeedPageWidget extends StatefulWidget {
  const FeedPageWidget({super.key});

  @override
  State<FeedPageWidget> createState() => _FeedPageWidgetState();
}

class _FeedPageWidgetState extends State<FeedPageWidget> {
  late FeedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.canLoad = await action_blocks.canLoad(context);
      if (_model.canLoad!) {
        _model.pageState = PageState.loading;
        safeSetState(() {});
        _model.pageState = PageState.loaded;
        safeSetState(() {});
      } else {
        _model.pageState = PageState.failure;
        safeSetState(() {});
        return;
      }

      await Future.delayed(const Duration(milliseconds: 2000));
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFF8F7),
        appBar: responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ) &&
                ((_model.pageState == PageState.loaded) && false)
            ? AppBar(
                backgroundColor: Color(0xFFFFF8F7),
                automaticallyImplyLeading: false,
                actions: [],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(100.0),
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: FutureBuilder<List<StoriesRecord>>(
                      future: queryStoriesRecordOnce(
                        queryBuilder: (storiesRecord) => storiesRecord
                            .where(
                              'is_visible',
                              isEqualTo: true,
                            )
                            .where(
                              'is_deleted',
                              isEqualTo: false,
                            )
                            .orderBy('created_time'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<StoriesRecord> containerStoriesRecordList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final stories =
                                  containerStoriesRecordList.toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(stories.length,
                                          (storiesIndex) {
                                    final storiesItem = stories[storiesIndex];
                                    return StoryCardWidget(
                                      key: Key(
                                          'Key7vf_${storiesIndex}_of_${stories.length}'),
                                      doc: storiesItem,
                                      type: StoryCardType.little,
                                      onHideTap: () async {},
                                      onEditTap: () async {},
                                      onDeleteTap: () async {},
                                      onTap: () async {
                                        context.pushNamed(
                                          'StoriesPage',
                                          queryParameters: {
                                            'stories': serializeParam(
                                              containerStoriesRecordList,
                                              ParamType.Document,
                                              isList: true,
                                            ),
                                            'initIndex': serializeParam(
                                              storiesIndex,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'stories':
                                                containerStoriesRecordList,
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                    );
                                  })
                                      .divide(SizedBox(width: 10.0))
                                      .addToStart(SizedBox(width: 20.0))
                                      .addToEnd(SizedBox(width: 20.0)),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                if (_model.pageState == PageState.loaded)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (false)
                        FutureBuilder<List<StoriesRecord>>(
                          future: queryStoriesRecordOnce(
                            queryBuilder: (storiesRecord) => storiesRecord
                                .where(
                                  'is_visible',
                                  isEqualTo: true,
                                )
                                .where(
                                  'is_deleted',
                                  isEqualTo: false,
                                )
                                .orderBy('created_time', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<StoriesRecord> containerStoriesRecordList =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final stories =
                                          containerStoriesRecordList.toList();

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List
                                                  .generate(stories.length,
                                                      (storiesIndex) {
                                            final storiesItem =
                                                stories[storiesIndex];
                                            return StoryCardWidget(
                                              key: Key(
                                                  'Key0py_${storiesIndex}_of_${stories.length}'),
                                              doc: storiesItem,
                                              type: StoryCardType.little,
                                              onHideTap: () async {},
                                              onEditTap: () async {},
                                              onDeleteTap: () async {},
                                              onTap: () async {
                                                context.pushNamed(
                                                  'StoriesPage',
                                                  queryParameters: {
                                                    'stories': serializeParam(
                                                      containerStoriesRecordList,
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                    'initIndex': serializeParam(
                                                      storiesIndex,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'stories':
                                                        containerStoriesRecordList,
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 200),
                                                    ),
                                                  },
                                                );
                                              },
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
                          },
                        ),
                      FutureBuilder<List<SuggestionsRecord>>(
                        future: querySuggestionsRecordOnce(
                          queryBuilder: (suggestionsRecord) => suggestionsRecord
                              .where(
                                'is_visible',
                                isEqualTo: true,
                              )
                              .where(
                                'is_deleted',
                                isEqualTo: false,
                              )
                              .orderBy('created_time', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<SuggestionsRecord>
                              containerSuggestionsRecordList = snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Builder(
                                  builder: (context) {
                                    final suggestions =
                                        containerSuggestionsRecordList.toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                                suggestions.length,
                                                (suggestionsIndex) {
                                          final suggestionsItem =
                                              suggestions[suggestionsIndex];
                                          return SuggestionCardWidget(
                                            key: Key(
                                                'Key0fn_${suggestionsIndex}_of_${suggestions.length}'),
                                            type: StoryCardType.little,
                                            doc: suggestionsItem,
                                            onHideTap: () async {},
                                            onEditTap: () async {},
                                            onDeleteTap: () async {},
                                            onTap: () async {
                                              await launchURL(
                                                  suggestionsItem.link);
                                            },
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
                        },
                      ),
                      Flexible(
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            ArticlesRecord>(
                          pagingController: _model.setListViewController(
                            ArticlesRecord.collection
                                .where(
                                  'is_deleted',
                                  isEqualTo: false,
                                )
                                .where(
                                  'is_visible',
                                  isEqualTo: true,
                                )
                                .where(
                                  'is_published',
                                  isEqualTo: true,
                                )
                                .orderBy('published_time', descending: true),
                          ),
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            14.0,
                          ),
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<ArticlesRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            ),
                            noItemsFoundIndicatorBuilder: (_) => Center(
                              child: EmptyListComponentWidget(
                                text: 'Здесь пока ничего нет',
                              ),
                            ),
                            itemBuilder: (context, _, listViewIndex) {
                              final listViewArticlesRecord = _model
                                  .listViewPagingController!
                                  .itemList![listViewIndex];
                              return Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0,
                                      valueOrDefault<double>(
                                        listViewIndex == 0 ? 16.0 : 0.0,
                                        0.0,
                                      ),
                                      20.0,
                                      0.0),
                                  child: FeedCardWidget(
                                    key: Key(
                                        'Keymla_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                    articleDoc: listViewArticlesRecord,
                                    onCommentsPressed: () async {
                                      if (functions.isArticleSupported(
                                          listViewArticlesRecord)) {
                                        _model.rDoc0 =
                                            await RubricsRecord.getDocumentOnce(
                                                listViewArticlesRecord
                                                    .rubricsRef!);

                                        context.pushNamed(
                                          'ArticlePage',
                                          queryParameters: {
                                            'articlesDoc': serializeParam(
                                              listViewArticlesRecord,
                                              ParamType.Document,
                                            ),
                                            'showCommentsOnInit':
                                                serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                            'rubricDoc': serializeParam(
                                              _model.rDoc0,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'articlesDoc':
                                                listViewArticlesRecord,
                                            'rubricDoc': _model.rDoc0,
                                          },
                                        );
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: MobilePopUpWidget(
                                                    text:
                                                        'Для открытия этой статьи необходимо обновить приложение',
                                                    leftBtnText: 'Позже',
                                                    rightBtnText: 'Обновить',
                                                    leftBtnAction: () async {
                                                      Navigator.pop(context);
                                                    },
                                                    rightBtnAction: () async {
                                                      if (isiOS) {
                                                        unawaited(
                                                          () async {
                                                            await launchURL(
                                                                'https://apps.apple.com/app/id6504793921');
                                                          }(),
                                                        );
                                                      } else {
                                                        if (isAndroid) {
                                                          unawaited(
                                                            () async {
                                                              await launchURL(
                                                                  'https://play.google.com/store/apps/details?id=ru.martangg.android');
                                                            }(),
                                                          );
                                                        }
                                                      }

                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    onTap: () async {
                                      if (functions.isArticleSupported(
                                          listViewArticlesRecord)) {
                                        if (listViewArticlesRecord.type ==
                                            Editor.link) {
                                          await launchURL(listViewArticlesRecord
                                              .articleBlocks.firstOrNull!.link);
                                        } else {
                                          _model.rDoc1 = await RubricsRecord
                                              .getDocumentOnce(
                                                  listViewArticlesRecord
                                                      .rubricsRef!);

                                          context.pushNamed(
                                            'ArticlePage',
                                            queryParameters: {
                                              'articlesDoc': serializeParam(
                                                listViewArticlesRecord,
                                                ParamType.Document,
                                              ),
                                              'showCommentsOnInit':
                                                  serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                              'rubricDoc': serializeParam(
                                                _model.rDoc1,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'articlesDoc':
                                                  listViewArticlesRecord,
                                              'rubricDoc': _model.rDoc1,
                                            },
                                          );
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: MobilePopUpWidget(
                                                    text:
                                                        'Для открытия этой статьи необходимо обновить приложение',
                                                    leftBtnText: 'Позже',
                                                    rightBtnText: 'Обновить',
                                                    leftBtnAction: () async {
                                                      Navigator.pop(context);
                                                    },
                                                    rightBtnAction: () async {
                                                      if (isiOS) {
                                                        unawaited(
                                                          () async {
                                                            await launchURL(
                                                                'https://apps.apple.com/app/id6504793921');
                                                          }(),
                                                        );
                                                      } else {
                                                        if (isAndroid) {
                                                          unawaited(
                                                            () async {
                                                              await launchURL(
                                                                  'https://play.google.com/store/apps/details?id=ru.martangg.android');
                                                            }(),
                                                          );
                                                        }
                                                      }

                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                if (_model.pageState != PageState.loaded)
                  Builder(
                    builder: (context) {
                      if (_model.pageState == PageState.failure) {
                        return wrapWithModel(
                          model: _model.noInternetModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NoInternetWidget(
                            onRefreshPressed: () async {
                              _model.pageState = PageState.loading;
                              safeSetState(() {});
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              _model.canLoadOnRefresh =
                                  await action_blocks.canLoad(context);
                              if (_model.canLoadOnRefresh!) {
                                _model.pageState = PageState.loaded;
                                safeSetState(() {});
                                unawaited(
                                  () async {
                                    await action_blocks
                                        .updateOnlineStatus(context);
                                  }(),
                                );
                              } else {
                                _model.pageState = PageState.failure;
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                          ),
                        );
                      } else {
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Загрузка...',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        );
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
