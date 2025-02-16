import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/splash/splash_control_card/splash_control_card_widget.dart';
import '/splash/splash_edit_pop_up/splash_edit_pop_up_widget.dart';
import '/test_folder/stories_viewer/stories_viewer_widget.dart';
import '/web/story_item/story_item_widget.dart';
import '/web/ui/admin_article_card/admin_article_card_widget.dart';
import '/web/ui/admin_button/admin_button_widget.dart';
import '/web/ui/cards/admin_category_card/admin_category_card_widget.dart';
import '/web/ui/cards/admin_rubric_card/admin_rubric_card_widget.dart';
import '/web/ui/cards/admin_story_add_card/admin_story_add_card_widget.dart';
import '/web/ui/cards/story_card/story_card_widget.dart';
import '/web/ui/cards/suggestion_card/suggestion_card_widget.dart';
import '/web/ui/horoscope_pop_up/horoscope_pop_up_widget.dart';
import '/web/ui/pop_ups/admin_app_pop_up/admin_app_pop_up_widget.dart';
import '/web/ui/pop_ups/article_pop_up/article_pop_up_widget.dart';
import '/web/ui/pop_ups/category_pop_up/category_pop_up_widget.dart';
import '/web/ui/pop_ups/link_pop_up/link_pop_up_widget.dart';
import '/web/ui/pop_ups/rubric_pop_up/rubric_pop_up_widget.dart';
import '/web/ui/pop_ups/story_pop_up/story_pop_up_widget.dart';
import '/web/ui/pop_ups/suggestions_pop_up/suggestions_pop_up_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'content_tab_view_model.dart';
export 'content_tab_view_model.dart';

class ContentTabViewWidget extends StatefulWidget {
  const ContentTabViewWidget({super.key});

  @override
  State<ContentTabViewWidget> createState() => _ContentTabViewWidgetState();
}

class _ContentTabViewWidgetState extends State<ContentTabViewWidget> {
  late ContentTabViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContentTabViewModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.adminButtonModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: AdminButtonWidget(
                        text: 'Лента',
                        type: _model.currentIndex == 0
                            ? AdminButtonType.active
                            : AdminButtonType.inactive,
                        onPressed: () async {
                          safeSetState(() {
                            _model.textController?.clear();
                          });
                          _model.currentIndex = 0;
                          _model.currentRubricDoc = null;
                          safeSetState(() {});
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.adminButtonModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: AdminButtonWidget(
                        text: 'Тебе понравится',
                        type: _model.currentIndex == 1
                            ? AdminButtonType.active
                            : AdminButtonType.inactive,
                        onPressed: () async {
                          _model.currentIndex = 1;
                          _model.currentRubricDoc = null;
                          safeSetState(() {});
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.adminButtonModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: AdminButtonWidget(
                        text: 'New Splash',
                        type: _model.currentIndex == 2
                            ? AdminButtonType.active
                            : AdminButtonType.inactive,
                        onPressed: () async {
                          _model.currentIndex = 2;
                          _model.currentRubricDoc = null;
                          safeSetState(() {});
                        },
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Stack(
                  children: [
                    if ((_model.currentIndex == 0) &&
                        (_model.currentRubricDoc == null))
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: RubricPopUpWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Добавить рубрику',
                        icon: Icon(
                          Icons.add_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 50.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Akrobat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    if ((_model.currentIndex == 1) &&
                        (_model.currentRubricDoc == null))
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CategoryPopUpWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Добавить категорию',
                        icon: Icon(
                          Icons.add_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 50.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Akrobat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    if (_model.currentRubricDoc != null)
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.currentRubricDoc?.editor ==
                              Editor.article) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ArticlePopUpWidget(
                                      rubricsDoc: _model.currentRubricDoc!,
                                      isDublicate: false,
                                      callback: (rubricsDoc) async {},
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(
                                () => _model.docIfArticle = value));

                            _model.currentRubricDoc = _model.docIfArticle;
                            safeSetState(() {});
                          } else if (_model.currentRubricDoc?.editor ==
                              Editor.horoscope) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: HoroscopePopUpWidget(
                                      rubricDoc: _model.currentRubricDoc!,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(
                                () => _model.docIfHoroscope = value));

                            _model.currentRubricDoc = _model.docIfHoroscope;
                            safeSetState(() {});
                          } else if (_model.currentRubricDoc?.editor ==
                              Editor.link) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: LinkPopUpWidget(
                                      rubricsDoc: _model.currentRubricDoc!,
                                      isDublicate: false,
                                      callback: (rubricsDoc) async {},
                                    ),
                                  ),
                                );
                              },
                            ).then((value) =>
                                safeSetState(() => _model.docIfLink = value));

                            _model.currentRubricDoc = _model.docIfLink;
                            safeSetState(() {});
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ArticlePopUpWidget(
                                      rubricsDoc: _model.currentRubricDoc!,
                                      isDublicate: false,
                                      callback: (rubricsDoc) async {},
                                    ),
                                  ),
                                );
                              },
                            ).then((value) =>
                                safeSetState(() => _model.docElse = value));

                            _model.currentRubricDoc = _model.docElse;
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                        text: () {
                          if (_model.currentRubricDoc?.editor ==
                              Editor.article) {
                            return 'Добавить статью';
                          } else if (_model.currentRubricDoc?.editor ==
                              Editor.horoscope) {
                            return 'Добавить астропрогноз';
                          } else if (_model.currentRubricDoc?.editor ==
                              Editor.link) {
                            return 'Добавить внешнюю статью';
                          } else {
                            return 'Добавить статью';
                          }
                        }(),
                        icon: Icon(
                          Icons.add_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 50.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Akrobat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    if (_model.currentIndex == 2)
                      FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SplashEditPopUpWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Добавить splash',
                        icon: Icon(
                          Icons.add_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 50.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Akrobat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              if ((_model.currentIndex == 0) &&
                  (_model.currentRubricDoc == null))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Истории',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Akrobat',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                    if (false)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.adminStoryAddCardModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: AdminStoryAddCardWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: StoryPopUpWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: StreamBuilder<List<StoriesRecord>>(
                                stream: queryStoriesRecord(
                                  queryBuilder: (storiesRecord) => storiesRecord
                                      .where(
                                        'is_deleted',
                                        isEqualTo: false,
                                      )
                                      .orderBy('created_time',
                                          descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<StoriesRecord>
                                      containerStoriesRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final stories =
                                            containerStoriesRecordList.toList();

                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                              stories.length, (storiesIndex) {
                                            final storiesItem =
                                                stories[storiesIndex];
                                            return Builder(
                                              builder: (context) =>
                                                  StoryCardWidget(
                                                key: Key(
                                                    'Keyowq_${storiesIndex}_of_${stories.length}'),
                                                doc: storiesItem,
                                                type: StoryCardType.big,
                                                onHideTap: () async {
                                                  await storiesItem.reference
                                                      .update(
                                                          createStoriesRecordData(
                                                    isVisible:
                                                        !storiesItem.isVisible,
                                                  ));
                                                },
                                                onEditTap: () async {
                                                  if (storiesItem.isVisible) {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                StoryPopUpWidget(
                                                              doc: storiesItem,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    return;
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                onDeleteTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              AdminAppPopUpWidget(
                                                            text:
                                                                'Вы действительно хотите удалить историю?',
                                                            leftBtnText:
                                                                'Отмена',
                                                            rightBtnText:
                                                                'Удалить',
                                                            onLBtnPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            onRBtnPressed:
                                                                () async {
                                                              await storiesItem
                                                                  .reference
                                                                  .update(
                                                                      createStoriesRecordData(
                                                                isDeleted: true,
                                                              ));
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child: Container(
                                                            height: 800.0,
                                                            width: 400.0,
                                                            child:
                                                                StoriesViewerWidget(
                                                              docs:
                                                                  containerStoriesRecordList,
                                                              initIndex:
                                                                  storiesIndex,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          }).divide(SizedBox(width: 12.0)),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    if (false)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: StreamBuilder<List<SuggestionsRecord>>(
                                stream: querySuggestionsRecord(
                                  queryBuilder: (suggestionsRecord) =>
                                      suggestionsRecord
                                          .where(
                                            'is_deleted',
                                            isEqualTo: false,
                                          )
                                          .orderBy('created_time',
                                              descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<SuggestionsRecord>
                                      containerSuggestionsRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final suggestions =
                                            containerSuggestionsRecordList
                                                .toList();

                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children:
                                              List.generate(suggestions.length,
                                                  (suggestionsIndex) {
                                            final suggestionsItem =
                                                suggestions[suggestionsIndex];
                                            return SuggestionCardWidget(
                                              key: Key(
                                                  'Keyfyg_${suggestionsIndex}_of_${suggestions.length}'),
                                              doc: suggestionsItem,
                                              type: StoryCardType.big,
                                              onHideTap: () async {
                                                await suggestionsItem.reference
                                                    .update(
                                                        createSuggestionsRecordData(
                                                  isVisible: !suggestionsItem
                                                      .isVisible,
                                                ));
                                              },
                                              onEditTap: () async {
                                                if (suggestionsItem.isVisible) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              SuggestionsPopUpWidget(
                                                            doc:
                                                                suggestionsItem,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  return;
                                                } else {
                                                  return;
                                                }
                                              },
                                              onDeleteTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            AdminAppPopUpWidget(
                                                          text:
                                                              'Вы действительно хотите удалить историю?',
                                                          leftBtnText: 'Отмена',
                                                          rightBtnText:
                                                              'Удалить',
                                                          onLBtnPressed:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          onRBtnPressed:
                                                              () async {
                                                            await suggestionsItem
                                                                .reference
                                                                .update(
                                                                    createSuggestionsRecordData(
                                                              isDeleted: true,
                                                            ));
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              onTap: () async {
                                                await launchURL(
                                                    suggestionsItem.link);
                                              },
                                            );
                                          }).divide(SizedBox(width: 12.0)),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: 150.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.adminStoryAddCardModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AdminStoryAddCardWidget(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SuggestionsPopUpWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(),
                              child: StreamBuilder<List<SuggestionsRecord>>(
                                stream: querySuggestionsRecord(
                                  queryBuilder: (suggestionsRecord) =>
                                      suggestionsRecord
                                          .where(
                                            'is_deleted',
                                            isEqualTo: false,
                                          )
                                          .orderBy('created_time',
                                              descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<SuggestionsRecord>
                                      rowHorizontalScrollSuggestionsRecordList =
                                      snapshot.data!;

                                  return Container(
                                    width: double.infinity,
                                    height: 216.0,
                                    child: custom_widgets.RowHorizontalScroll(
                                      width: double.infinity,
                                      height: 216.0,
                                      suggestions:
                                          rowHorizontalScrollSuggestionsRecordList,
                                      suggestionCard:
                                          (SuggestionsRecord suggestionItem) =>
                                              StoryItemWidget(
                                        suggestionItem: suggestionItem,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Рубрики',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Akrobat',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                    StreamBuilder<List<RubricsRecord>>(
                      stream: queryRubricsRecord(
                        queryBuilder: (rubricsRecord) => rubricsRecord
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
                        List<RubricsRecord> wrapRubricsRecordList =
                            snapshot.data!;

                        return Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: List.generate(wrapRubricsRecordList.length,
                              (wrapIndex) {
                            final wrapRubricsRecord =
                                wrapRubricsRecordList[wrapIndex];
                            return Padding(
                              padding: EdgeInsets.all(10.0),
                              child: AdminRubricCardWidget(
                                key: Key(
                                    'Key5d1_${wrapIndex}_of_${wrapRubricsRecordList.length}'),
                                doc: wrapRubricsRecord,
                                onEditPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: RubricPopUpWidget(
                                            doc: wrapRubricsRecord,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                onDeletePressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: AdminAppPopUpWidget(
                                            text:
                                                'Вы действительно хотите удалить рубрику?',
                                            leftBtnText: 'Отмена',
                                            rightBtnText: 'Удалить',
                                            onLBtnPressed: () async {
                                              Navigator.pop(context);
                                            },
                                            onRBtnPressed: () async {
                                              unawaited(
                                                () async {
                                                  await wrapRubricsRecord
                                                      .reference
                                                      .update(
                                                          createRubricsRecordData(
                                                    isDeleted: true,
                                                  ));
                                                }(),
                                              );
                                              await actions
                                                  .delArticlesAfterDelRubric(
                                                wrapRubricsRecord.articlesRefs
                                                    .toList(),
                                              );
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                onVisibilityPressed: () async {
                                  await wrapRubricsRecord.reference
                                      .update(createRubricsRecordData(
                                    isVisible: !wrapRubricsRecord.isVisible,
                                  ));
                                  await actions.updateArticlesVisability(
                                    wrapRubricsRecord,
                                    !wrapRubricsRecord.isVisible,
                                  );
                                },
                                onTap: () async {
                                  _model.currentRubricDoc = wrapRubricsRecord;
                                  safeSetState(() {});
                                },
                                onVisabilityLongPressed: () async {},
                                onDelLongPressed: () async {},
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              if ((_model.currentIndex == 0) &&
                  (_model.currentRubricDoc != null))
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 80.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 10.0,
                                    borderWidth: 1.0,
                                    buttonSize: 44.0,
                                    fillColor: Color(0xFFF3F1F4),
                                    icon: Icon(
                                      Icons.chevron_left_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      _model.currentRubricDoc = null;
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model.textController?.clear();
                                      });
                                    },
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.currentRubricDoc?.name,
                                      '[ Без рубрики ]',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 400.0,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 100),
                                      () async {
                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Поиск',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            fontSize: 19.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      hintText: 'Минимум 3 символа',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            fontSize: 19.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      suffixIcon: _model
                                              .textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                safeSetState(() {});
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          fontSize: 19.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final articlesList = functions
                              .invertArticles(_model
                                  .currentRubricDoc?.articlesRefs
                                  .toList())
                              .toList();

                          return Wrap(
                            spacing: 16.0,
                            runSpacing: 16.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: List.generate(articlesList.length,
                                (articlesListIndex) {
                              final articlesListItem =
                                  articlesList[articlesListIndex];
                              return StreamBuilder<ArticlesRecord>(
                                stream: ArticlesRecord.getDocument(
                                    articlesListItem),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final containerArticlesRecord =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: !containerArticlesRecord
                                              .isDeleted &&
                                          (!functions.isTextLessThen(
                                                  _model.textController.text, 3)
                                              ? functions.rubricNameContains(
                                                  containerArticlesRecord,
                                                  _model.textController.text)
                                              : true),
                                      child: AdminArticleCardWidget(
                                        key: Key(
                                            'Key09s_${articlesListIndex}_of_${articlesList.length}'),
                                        doc: containerArticlesRecord,
                                        onEditTap: () async {
                                          var _shouldSetState = false;
                                          if (containerArticlesRecord.type ==
                                              Editor.article) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: ArticlePopUpWidget(
                                                      rubricsDoc: _model
                                                          .currentRubricDoc!,
                                                      doc:
                                                          containerArticlesRecord,
                                                      isDublicate: false,
                                                      callback:
                                                          (rubricsDoc) async {},
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.rubricDoc0 = value));

                                            _shouldSetState = true;
                                            _model.currentRubricDoc =
                                                _model.rubricDoc0;
                                            safeSetState(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else if (containerArticlesRecord
                                                  .type ==
                                              Editor.horoscope) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: HoroscopePopUpWidget(
                                                      doc:
                                                          containerArticlesRecord,
                                                      rubricDoc: _model
                                                          .currentRubricDoc!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.rubricDoc1 = value));

                                            _shouldSetState = true;
                                            _model.currentRubricDoc =
                                                _model.rubricDoc1;
                                            safeSetState(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        onDeleteTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: AdminAppPopUpWidget(
                                                    text:
                                                        'Вы действительно хотите удалить статью?',
                                                    leftBtnText: 'Отмена',
                                                    rightBtnText: 'Удалить',
                                                    onLBtnPressed: () async {
                                                      Navigator.pop(context);
                                                    },
                                                    onRBtnPressed: () async {
                                                      await articlesListItem.update(
                                                          createArticlesRecordData(
                                                        isDeleted: true,
                                                      ));
                                                      unawaited(
                                                        () async {
                                                          await _model
                                                              .currentRubricDoc!
                                                              .reference
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'articles_refs':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  articlesListItem
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        }(),
                                                      );
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        onDelLongPressed: () async {},
                                        onVisabilityPressed: () async {
                                          await articlesListItem
                                              .update(createArticlesRecordData(
                                            isVisible: !containerArticlesRecord
                                                .isVisible,
                                          ));
                                        },
                                        onDublicatePressed: () async {
                                          var _shouldSetState = false;
                                          if (containerArticlesRecord.type ==
                                              Editor.article) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: ArticlePopUpWidget(
                                                      rubricsDoc: _model
                                                          .currentRubricDoc!,
                                                      doc:
                                                          containerArticlesRecord,
                                                      isDublicate: true,
                                                      callback:
                                                          (rubricsDoc) async {},
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.rubricDoc3 = value));

                                            _shouldSetState = true;
                                            _model.currentRubricDoc =
                                                _model.rubricDoc3;
                                            safeSetState(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else if (containerArticlesRecord
                                                  .type ==
                                              Editor.horoscope) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: HoroscopePopUpWidget(
                                                      doc:
                                                          containerArticlesRecord,
                                                      rubricDoc: _model
                                                          .currentRubricDoc!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.rubricDoc2 = value));

                                            _shouldSetState = true;
                                            _model.currentRubricDoc =
                                                _model.rubricDoc2;
                                            safeSetState(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          );
                        },
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              if (_model.currentIndex == 1)
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: StreamBuilder<List<CategoriesRecord>>(
                          stream: queryCategoriesRecord(
                            queryBuilder: (categoriesRecord) => categoriesRecord
                                .where(
                                  'is_deleted',
                                  isEqualTo: false,
                                  isNull: (false) == null,
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
                            List<CategoriesRecord> wrapCategoriesRecordList =
                                snapshot.data!;

                            return Wrap(
                              spacing: 6.0,
                              runSpacing: 6.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(
                                  wrapCategoriesRecordList.length, (wrapIndex) {
                                final wrapCategoriesRecord =
                                    wrapCategoriesRecordList[wrapIndex];
                                return Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: AdminCategoryCardWidget(
                                    key: Key(
                                        'Key311_${wrapIndex}_of_${wrapCategoriesRecordList.length}'),
                                    doc: wrapCategoriesRecord,
                                    onEditPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CategoryPopUpWidget(
                                                doc: wrapCategoriesRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    onDeletePressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: AdminAppPopUpWidget(
                                                text:
                                                    'Вы действительно хотите удалить категорию?',
                                                leftBtnText: 'Отмена',
                                                rightBtnText: 'Удалить',
                                                onLBtnPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                onRBtnPressed: () async {
                                                  await wrapCategoriesRecord
                                                      .reference
                                                      .update(
                                                          createCategoriesRecordData(
                                                    isDeleted: true,
                                                  ));
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    onVisabilityPressed: () async {
                                      await wrapCategoriesRecord.reference
                                          .update(createCategoriesRecordData(
                                        isVisible:
                                            !wrapCategoriesRecord.isVisible,
                                      ));
                                    },
                                    onVisabilityLongPressed: () async {
                                      if (kDebugMode) {
                                        await wrapCategoriesRecord.reference
                                            .update(createCategoriesRecordData(
                                          isUndeletable: !wrapCategoriesRecord
                                              .isUndeletable,
                                        ));
                                      }
                                    },
                                    onDelLongPressed: () async {
                                      unawaited(
                                        () async {}(),
                                      );
                                    },
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              if (_model.currentIndex == 2)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NEW SPLASH',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Akrobat',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                    StreamBuilder<List<NewSplashsRecord>>(
                      stream: queryNewSplashsRecord(
                        queryBuilder: (newSplashsRecord) =>
                            newSplashsRecord.where(
                          'is_deleted',
                          isEqualTo: false,
                        ),
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
                        List<NewSplashsRecord> containerNewSplashsRecordList =
                            snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              if (containerNewSplashsRecordList.isNotEmpty) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final splashItem =
                                          containerNewSplashsRecordList
                                              .toList();

                                      return Wrap(
                                        spacing: 10.0,
                                        runSpacing: 10.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children:
                                            List.generate(splashItem.length,
                                                (splashItemIndex) {
                                          final splashItemItem =
                                              splashItem[splashItemIndex];
                                          return SplashControlCardWidget(
                                            key: Key(
                                                'Keys7y_${splashItemIndex}_of_${splashItem.length}'),
                                            parameter1: splashItemItem,
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Text(
                                  'Splash list is empty',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ].divide(SizedBox(height: 20.0)),
      ),
    );
  }
}
