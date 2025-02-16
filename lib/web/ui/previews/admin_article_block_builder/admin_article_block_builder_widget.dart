import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web/ui/pop_ups/article_block_add/article_block_add_widget.dart';
import '/web/ui/previews/admin_article_block/admin_article_block_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'admin_article_block_builder_model.dart';
export 'admin_article_block_builder_model.dart';

class AdminArticleBlockBuilderWidget extends StatefulWidget {
  const AdminArticleBlockBuilderWidget({
    super.key,
    this.articleBlockList,
    this.onChange,
  });

  final List<ArticleBlockStruct>? articleBlockList;
  final Future Function(List<ArticleBlockStruct>? artickeBlockList)? onChange;

  @override
  State<AdminArticleBlockBuilderWidget> createState() =>
      _AdminArticleBlockBuilderWidgetState();
}

class _AdminArticleBlockBuilderWidgetState
    extends State<AdminArticleBlockBuilderWidget> {
  late AdminArticleBlockBuilderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminArticleBlockBuilderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.articleBlockList != null &&
          (widget.articleBlockList)!.isNotEmpty) {
        _model.list =
            widget.articleBlockList!.toList().cast<ArticleBlockStruct>();
        safeSetState(() {});
      }
    });

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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Builder(
                builder: (context) {
                  final columnList = _model.list.toList();

                  return ReorderableListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: columnList.length,
                    itemBuilder: (context, columnListIndex) {
                      final columnListItem = columnList[columnListIndex];
                      return Container(
                        key: ValueKey("ListView_5ezwudk7" +
                            '_' +
                            columnListIndex.toString()),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                () {
                                  if (columnListItem.type ==
                                      ArticleBlockType.text) {
                                    return 'Текст';
                                  } else if (columnListItem.type ==
                                      ArticleBlockType.headerHigh) {
                                    return 'Заголовок большой';
                                  } else if (columnListItem.type ==
                                      ArticleBlockType.headerLow) {
                                    return 'Заголовок маленький';
                                  } else if (columnListItem.type ==
                                      ArticleBlockType.image) {
                                    return 'Изображение';
                                  } else if (columnListItem.type ==
                                      ArticleBlockType.quote) {
                                    return 'Цитата';
                                  } else if (columnListItem.type ==
                                      ArticleBlockType.list) {
                                    return 'Элемент списка';
                                  } else if (columnListItem.type ==
                                      ArticleBlockType.separator) {
                                    return 'Разделитель';
                                  } else if (columnListItem.type ==
                                      ArticleBlockType.button) {
                                    return 'Кнопка';
                                  } else {
                                    return ' ';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Akrobat',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: columnListIndex.isOdd
                                    ? FlutterFlowTheme.of(context).alternate
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: wrapWithModel(
                                      model: _model.adminArticleBlockModels
                                          .getModel(
                                        getCurrentTimestamp
                                            .millisecondsSinceEpoch
                                            .toString(),
                                        columnListIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: AdminArticleBlockWidget(
                                        key: Key(
                                          'Keyfkb_${getCurrentTimestamp.millisecondsSinceEpoch.toString()}',
                                        ),
                                        articleBlock: columnListItem,
                                        onChange: (articleBlock) async {
                                          _model.updateListAtIndex(
                                            columnListIndex,
                                            (_) => articleBlock,
                                          );
                                          await widget.onChange?.call(
                                            _model.list,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 40.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.delete_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          _model.removeFromList(columnListItem);
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Hello World',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Akrobat',
                                      color: Color(0x0014181B),
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    onReorder: (int reorderableOldIndex,
                        int reorderableNewIndex) async {
                      _model.reorderedList =
                          await actions.reorderArticleBlockItems(
                        _model.list.toList(),
                        reorderableOldIndex,
                        reorderableNewIndex,
                      );
                      _model.list = _model.reorderedList!
                          .toList()
                          .cast<ArticleBlockStruct>();

                      safeSetState(() {});
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: FFButtonWidget(
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
                          child: ArticleBlockAddWidget(),
                        ),
                      );
                    },
                  ).then((value) =>
                      safeSetState(() => _model.articleBlock = value));

                  _model.addToList(_model.articleBlock!);
                  safeSetState(() {});
                  await widget.onChange?.call(
                    widget.articleBlockList,
                  );

                  safeSetState(() {});
                },
                text: 'Добавить блок',
                icon: Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0x00B47C73),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
