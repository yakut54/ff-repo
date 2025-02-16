import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web/ui/pop_ups/admin_app_pop_up/admin_app_pop_up_widget.dart';
import '/web/ui/pop_ups/article_block_add/article_block_add_widget.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import '/web/ui/previews/admin_article_block/admin_article_block_widget.dart';
import '/web/ui/previews/admin_article_preview/admin_article_preview_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'article_pop_up_model.dart';
export 'article_pop_up_model.dart';

class ArticlePopUpWidget extends StatefulWidget {
  const ArticlePopUpWidget({
    super.key,
    this.doc,
    required this.rubricsDoc,
    this.callback,
    required this.isDublicate,
  });

  final ArticlesRecord? doc;
  final RubricsRecord? rubricsDoc;
  final Future Function(RubricsRecord rubricsDoc)? callback;
  final bool? isDublicate;

  @override
  State<ArticlePopUpWidget> createState() => _ArticlePopUpWidgetState();
}

class _ArticlePopUpWidgetState extends State<ArticlePopUpWidget> {
  late ArticlePopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticlePopUpModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.list = widget.doc != null
          ? widget.doc!.articleBlocks
          : functions
              .emptyArticleBlockList()
              .toList()
              .cast<ArticleBlockStruct>();
      _model.startDT = (widget.doc != null) &&
              (widget.doc?.startTime != null && widget.doc?.startTime != '')
          ? functions.convertDateStringToDateTime(widget.doc?.startTime)
          : null;
      _model.endDT = (widget.doc != null) &&
              (widget.doc?.endTime != null && widget.doc?.endTime != '')
          ? functions.convertDateStringToDateTime(widget.doc?.endTime)
          : null;
      _model.startDate = (String? date) {
        return date?.split(' ').first ?? '[ Выберите дату ]';
      }(widget.doc?.startTime);
      _model.startTime = (String? time) {
        return time?.split(' ').last ?? '0:00';
      }(widget.doc?.startTime);
      _model.endDate = (String? date) {
        return date?.split(' ').first ?? '[ Выберите дату ]';
      }(widget.doc?.endTime);
      _model.endTime = (String? time) {
        return time?.split(' ').last ?? '0:00';
      }(widget.doc?.endTime);
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController(text: widget.doc?.title);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.doc?.description);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.switchValue1 = false;
    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.switchValue2 = widget.doc != null
        ? (widget.doc?.startTime != null && widget.doc?.startTime != '')
        : false;
    _model.switchValue3 = widget.doc != null
        ? (widget.doc?.endTime != null && widget.doc?.endTime != '')
        : false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isWeb,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.all(100.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Редактор статей',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        if (functions.adminCanCloseArticlePopUp(
                                            widget.doc,
                                            _model.textController1.text,
                                            _model.textController2.text,
                                            _model.list.toList(),
                                            _model.switchValue2!,
                                            _model.switchValue3!,
                                            _model.startDate,
                                            _model.startTime,
                                            _model.endDate,
                                            _model.endTime)) {
                                          Navigator.pop(
                                              context, widget.rubricsDoc);
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: WebViewAware(
                                                  child: AdminAppPopUpWidget(
                                                    text:
                                                        'Вы действительно хотите закрыть окно? Все не сохраненные данные будут потеряны!',
                                                    leftBtnText: 'Отмена',
                                                    rightBtnText: 'Закрыть',
                                                    onLBtnPressed: () async {
                                                      Navigator.pop(context);
                                                    },
                                                    onRBtnPressed: () async {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context,
                                                          widget.rubricsDoc);
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextFormField(
                                                    controller:
                                                        _model.textController1,
                                                    focusNode: _model
                                                        .textFieldFocusNode1,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController1',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Заголовок *',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Akrobat',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      alignLabelWithHint: true,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Akrobat',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Akrobat',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    maxLines: 2,
                                                    minLines: 1,
                                                    validator: _model
                                                        .textController1Validator
                                                        .asValidator(context),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        _model.textController2,
                                                    focusNode: _model
                                                        .textFieldFocusNode2,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController2',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Описание',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Akrobat',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      alignLabelWithHint: true,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Akrobat',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Akrobat',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    maxLines: 10,
                                                    minLines: 1,
                                                    validator: _model
                                                        .textController2Validator
                                                        .asValidator(context),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final columnList =
                                                              _model.list
                                                                  .toList();

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                columnList
                                                                    .length,
                                                            itemBuilder: (context,
                                                                columnListIndex) {
                                                              final columnListItem =
                                                                  columnList[
                                                                      columnListIndex];
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      () {
                                                                        if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .text) {
                                                                          return 'Текст';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .headerHigh) {
                                                                          return 'Заголовок большой';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .headerLow) {
                                                                          return 'Заголовок маленький';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image) {
                                                                          return 'Image width 100%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .quote) {
                                                                          return 'Цитата';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .list) {
                                                                          return 'Элемент списка';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .separator) {
                                                                          return 'Разделитель';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .button) {
                                                                          return 'Кнопка';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .timer) {
                                                                          return 'Таймер';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image90) {
                                                                          return 'Image width 90%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image80) {
                                                                          return 'Image width 80%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image70) {
                                                                          return 'Image width 70%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image60) {
                                                                          return 'Image width 60%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image50) {
                                                                          return 'Image width 50%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image40) {
                                                                          return 'Image width 40%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image30) {
                                                                          return 'Image width 30%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType
                                                                                .image20) {
                                                                          return 'Image width 20%';
                                                                        } else if (columnListItem.type ==
                                                                            ArticleBlockType.image10) {
                                                                          return 'Image width 10%';
                                                                        } else {
                                                                          return ' ';
                                                                        }
                                                                      }(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Akrobat',
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: columnListIndex
                                                                              .isOdd
                                                                          ? Color(
                                                                              0xFFDFE4E7)
                                                                          : Color(
                                                                              0xFFF0F4F7),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children:
                                                                          [
                                                                        Flexible(
                                                                          child:
                                                                              AdminArticleBlockWidget(
                                                                            key:
                                                                                Key('Keyvdz_${columnListIndex}_of_${columnList.length}'),
                                                                            articleBlock:
                                                                                columnListItem,
                                                                            onChange:
                                                                                (articleBlock) async {
                                                                              _model.updateListAtIndex(
                                                                                columnListIndex,
                                                                                (_) => articleBlock,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                40.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.delete_outlined,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                _model.removeAtIndexFromList(columnListIndex);
                                                                                safeSetState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Hello World',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Akrobat',
                                                                            color:
                                                                                Color(0x0014181B),
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                            controller: _model
                                                                .listViewController,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: SingleChildScrollView(
                                                  controller:
                                                      _model.columnController,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Switch
                                                                      .adaptive(
                                                                    value: _model
                                                                        .switchValue1!,
                                                                    onChanged: (widget.doc !=
                                                                                null
                                                                            ? (widget.doc!.isPublished &&
                                                                                !widget.isDublicate!)
                                                                            : false)
                                                                        ? null
                                                                        : (newValue) async {
                                                                            safeSetState(() =>
                                                                                _model.switchValue1 = newValue);
                                                                            if (newValue) {
                                                                              safeSetState(() {
                                                                                _model.switchValue2 = widget.doc != null ? (widget.doc?.startTime != null && widget.doc?.startTime != '') : false;
                                                                              });
                                                                            }
                                                                          },
                                                                    activeColor: (widget.doc !=
                                                                                null
                                                                            ? (widget.doc!.isPublished &&
                                                                                !widget
                                                                                    .isDublicate!)
                                                                            : false)
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryBackground
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor: (widget.doc !=
                                                                                null
                                                                            ? (widget.doc!.isPublished &&
                                                                                !widget
                                                                                    .isDublicate!)
                                                                            : false)
                                                                        ? Color(
                                                                            0xFFF6BAAB)
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    inactiveThumbColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'С отправкой push-уведомления',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Akrobat',
                                                                            color: widget.doc != null
                                                                                ? (widget.doc!.isPublished && !widget.isDublicate! ? Color(0xFF9DA8AF) : FlutterFlowTheme.of(context).primaryText)
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                19.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        15.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model
                                                                  .switchValue1 ??
                                                              true)
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                TextFormField(
                                                                  controller: _model
                                                                      .textController3,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode3,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Заголовок уведомления',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Akrobat',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    alignLabelWithHint:
                                                                        false,
                                                                    hintText: _model
                                                                        .textController1
                                                                        .text,
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Akrobat',
                                                                          color:
                                                                              Color(0xFF969298),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Akrobat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  maxLines: 2,
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .textController3Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                                TextFormField(
                                                                  controller: _model
                                                                      .textController4,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode4,
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Текст уведомления',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Akrobat',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    alignLabelWithHint:
                                                                        false,
                                                                    hintText: _model.textController2.text !=
                                                                                ''
                                                                        ? _model
                                                                            .textController2
                                                                            .text
                                                                        : 'Нажмите чтобы перейти к статье',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Akrobat',
                                                                          color:
                                                                              Color(0xFF969298),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Akrobat',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  maxLines: 2,
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .textController4Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Switch.adaptive(
                                                                value: _model
                                                                    .switchValue2!,
                                                                onChanged: (widget.doc !=
                                                                            null
                                                                        ? (widget.doc!.isPublished &&
                                                                            !widget.isDublicate!)
                                                                        : false)
                                                                    ? null
                                                                    : (newValue) async {
                                                                        safeSetState(() =>
                                                                            _model.switchValue2 =
                                                                                newValue);
                                                                        if (newValue) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.switchValue1 =
                                                                                false;
                                                                          });
                                                                        }
                                                                      },
                                                                activeColor: (widget.doc !=
                                                                            null
                                                                        ? (widget.doc!.isPublished &&
                                                                            !widget
                                                                                .isDublicate!)
                                                                        : false)
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                activeTrackColor: (widget.doc !=
                                                                            null
                                                                        ? (widget.doc!.isPublished &&
                                                                            !widget
                                                                                .isDublicate!)
                                                                        : false)
                                                                    ? Color(
                                                                        0xFFF6BAAB)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                inactiveTrackColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                inactiveThumbColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Отложенная публикация',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Akrobat',
                                                                        color: widget.doc !=
                                                                                null
                                                                            ? (widget.doc!.isPublished && !widget.isDublicate!
                                                                                ? Color(0xFF9DA8AF)
                                                                                : FlutterFlowTheme.of(context).primaryText)
                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 15.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      if (_model.switchValue2 ??
                                                          true)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Дата публикации',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Akrobat',
                                                                            color:
                                                                                Color(0xFF969298),
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (!(widget.doc !=
                                                                              null
                                                                          ? (widget.doc!.isPublished &&
                                                                              !widget.isDublicate!)
                                                                          : false)) {
                                                                        final _datePicked1Date =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              (_model.startDT ?? DateTime.now()),
                                                                          firstDate:
                                                                              (getCurrentTimestamp ?? DateTime(1900)),
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                          builder:
                                                                              (context, child) {
                                                                            return wrapInMaterialDatePickerTheme(
                                                                              context,
                                                                              child!,
                                                                              headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                              headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                    fontFamily: 'Akrobat',
                                                                                    fontSize: 32.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                              pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                              selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                              actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                              iconSize: 24.0,
                                                                            );
                                                                          },
                                                                        );

                                                                        if (_datePicked1Date !=
                                                                            null) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.datePicked1 =
                                                                                DateTime(
                                                                              _datePicked1Date.year,
                                                                              _datePicked1Date.month,
                                                                              _datePicked1Date.day,
                                                                            );
                                                                          });
                                                                        } else if (_model.datePicked1 !=
                                                                            null) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.datePicked1 =
                                                                                _model.startDT;
                                                                          });
                                                                        }
                                                                        if (_model.datePicked1 !=
                                                                            null) {
                                                                          _model.startDT =
                                                                              _model.datePicked1;
                                                                          _model.startDate = (String
                                                                              date) {
                                                                            return date.split(' ').first;
                                                                          }(functions
                                                                              .convertDateTimeToString(_model.datePicked1)!);
                                                                          safeSetState(
                                                                              () {});
                                                                        }
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          56.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              0.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              dateTimeFormat(
                                                                                "d.MM.y",
                                                                                _model.startDT,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              '[ Выберите дату ]',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Akrobat',
                                                                                  color: widget.doc != null ? (widget.doc!.isPublished && !widget.isDublicate! ? Color(0xFF9DA8AF) : FlutterFlowTheme.of(context).primaryText) : FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 17.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Время публикации (МСК время)',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Akrobat',
                                                                            color:
                                                                                Color(0xFF969298),
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .dropDownValueController1 ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.dropDownValue1 ??= (String?
                                                                          time) {
                                                                        return time?.split(' ').last ??
                                                                            '0:00';
                                                                      }(widget
                                                                          .doc
                                                                          ?.startTime),
                                                                    ),
                                                                    options: List<
                                                                        String>.from([
                                                                      '0:00',
                                                                      '1:00',
                                                                      '2:00',
                                                                      '3:00',
                                                                      '4:00',
                                                                      '5:00',
                                                                      '6:00',
                                                                      '7:00',
                                                                      '8:00',
                                                                      '9:00',
                                                                      '10:00',
                                                                      '11:00',
                                                                      '12:00',
                                                                      '13:00',
                                                                      '14:00',
                                                                      '15:00',
                                                                      '16:00',
                                                                      '17:00',
                                                                      '18:00',
                                                                      '19:00',
                                                                      '20:00',
                                                                      '21:00',
                                                                      '22:00',
                                                                      '23:00'
                                                                    ]),
                                                                    optionLabels: [
                                                                      '0:00',
                                                                      '1:00',
                                                                      '2:00',
                                                                      '3:00',
                                                                      '4:00',
                                                                      '5:00',
                                                                      '6:00',
                                                                      '7:00',
                                                                      '8:00',
                                                                      '9:00',
                                                                      '10:00',
                                                                      '11:00',
                                                                      '12:00',
                                                                      '13:00',
                                                                      '14:00',
                                                                      '15:00',
                                                                      '16:00',
                                                                      '17:00',
                                                                      '18:00',
                                                                      '19:00',
                                                                      '20:00',
                                                                      '21:00',
                                                                      '22:00',
                                                                      '23:00'
                                                                    ],
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.dropDownValue1 =
                                                                              val);
                                                                      _model.startTime =
                                                                          _model
                                                                              .dropDownValue1;
                                                                    },
                                                                    height:
                                                                        56.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Akrobat',
                                                                          color: widget.doc != null
                                                                              ? (widget.doc!.isPublished && !widget.isDublicate! ? Color(0xFF9DA8AF) : FlutterFlowTheme.of(context).primaryText)
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              17.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    hintText:
                                                                        '[ Выберите время ]',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        1.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        true,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Switch
                                                                      .adaptive(
                                                                    value: _model
                                                                        .switchValue3!,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.switchValue3 =
                                                                              newValue);
                                                                    },
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    activeTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    inactiveTrackColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    inactiveThumbColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Автоматическое скрытие публикации',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Akrobat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                19.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        15.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          if (_model
                                                                  .switchValue3 ??
                                                              true)
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Дата скрытия публикации',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Akrobat',
                                                                                color: Color(0xFF969298),
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          final _datePicked2Date =
                                                                              await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                (_model.startDT ?? DateTime.now()),
                                                                            firstDate:
                                                                                (getCurrentTimestamp ?? DateTime(1900)),
                                                                            lastDate:
                                                                                DateTime(2050),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialDatePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      fontFamily: 'Akrobat',
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );

                                                                          if (_datePicked2Date !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked2 = DateTime(
                                                                                _datePicked2Date.year,
                                                                                _datePicked2Date.month,
                                                                                _datePicked2Date.day,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked2 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked2 = _model.startDT;
                                                                            });
                                                                          }
                                                                          if (_model.datePicked2 !=
                                                                              null) {
                                                                            _model.endDT =
                                                                                _model.datePicked2;
                                                                            _model.endDate =
                                                                                (String date) {
                                                                              return date.split(' ').first;
                                                                            }(functions.convertDateTimeToString(_model.datePicked2)!);
                                                                            safeSetState(() {});
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              56.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  dateTimeFormat(
                                                                                    "d.MM.y",
                                                                                    _model.endDT,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  '[ Выберите дату ]',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Akrobat',
                                                                                      color: Color(0xFF312D34),
                                                                                      fontSize: 17.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Время скрытия публикации (МСК время)',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Akrobat',
                                                                                color: Color(0xFF969298),
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                        controller:
                                                                            _model.dropDownValueController2 ??=
                                                                                FormFieldController<String>(
                                                                          _model.dropDownValue2 ??= (String?
                                                                              time) {
                                                                            return time?.split(' ').last ??
                                                                                '0:00';
                                                                          }(widget
                                                                              .doc
                                                                              ?.endTime),
                                                                        ),
                                                                        options:
                                                                            List<String>.from([
                                                                          '0:00',
                                                                          '1:00',
                                                                          '2:00',
                                                                          '3:00',
                                                                          '4:00',
                                                                          '5:00',
                                                                          '6:00',
                                                                          '7:00',
                                                                          '8:00',
                                                                          '9:00',
                                                                          '10:00',
                                                                          '11:00',
                                                                          '12:00',
                                                                          '13:00',
                                                                          '14:00',
                                                                          '15:00',
                                                                          '16:00',
                                                                          '17:00',
                                                                          '18:00',
                                                                          '19:00',
                                                                          '20:00',
                                                                          '21:00',
                                                                          '22:00',
                                                                          '23:00'
                                                                        ]),
                                                                        optionLabels: [
                                                                          '0:00',
                                                                          '1:00',
                                                                          '2:00',
                                                                          '3:00',
                                                                          '4:00',
                                                                          '5:00',
                                                                          '6:00',
                                                                          '7:00',
                                                                          '8:00',
                                                                          '9:00',
                                                                          '10:00',
                                                                          '11:00',
                                                                          '12:00',
                                                                          '13:00',
                                                                          '14:00',
                                                                          '15:00',
                                                                          '16:00',
                                                                          '17:00',
                                                                          '18:00',
                                                                          '19:00',
                                                                          '20:00',
                                                                          '21:00',
                                                                          '22:00',
                                                                          '23:00'
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(() =>
                                                                              _model.dropDownValue2 = val);
                                                                          _model.endTime =
                                                                              _model.dropDownValue2;
                                                                        },
                                                                        height:
                                                                            56.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Akrobat',
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                        hintText:
                                                                            '[ Выберите время ]',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            2.0,
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        borderWidth:
                                                                            1.0,
                                                                        borderRadius:
                                                                            8.0,
                                                                        margin: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                        hidesUnderline:
                                                                            true,
                                                                        isOverButton:
                                                                            true,
                                                                        isSearchable:
                                                                            false,
                                                                        isMultiSelect:
                                                                            false,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (_model
                                                      .errorList.isNotEmpty)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .errorStackModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ErrorStackWidget(
                                                            stack: _model
                                                                .errorList,
                                                            onClose: () async {
                                                              _model.errorList =
                                                                  [];
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        ArticleBlockAddWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(() =>
                                                                    _model.articleBlock =
                                                                        value));

                                                            _model.addToList(_model
                                                                .articleBlock!);
                                                            safeSetState(() {});
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        300));
                                                            await _model
                                                                .listViewController
                                                                ?.animateTo(
                                                              _model
                                                                  .listViewController!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      250),
                                                              curve:
                                                                  Curves.ease,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Добавить блок',
                                                          icon: Icon(
                                                            Icons.add_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 56.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0x00B47C73),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Akrobat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) =>
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 56.0,
                                                          icon: Icon(
                                                            Icons
                                                                .visibility_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          800.0,
                                                                      width:
                                                                          400.0,
                                                                      child:
                                                                          AdminArticlePreviewWidget(
                                                                        list: _model
                                                                            .list,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.errorList = functions
                                                                .adminArticlePopUpValidator(
                                                                    _model
                                                                        .textController1
                                                                        .text,
                                                                    _model.list
                                                                        .toList(),
                                                                    _model
                                                                        .switchValue2!,
                                                                    _model
                                                                        .startDate,
                                                                    _model
                                                                        .startTime,
                                                                    _model
                                                                        .switchValue3!,
                                                                    _model
                                                                        .endDate,
                                                                    _model
                                                                        .endTime)
                                                                .toList()
                                                                .cast<String>();
                                                            safeSetState(() {});
                                                            if (!(_model
                                                                .errorList
                                                                .isNotEmpty)) {
                                                              if ((widget.doc !=
                                                                      null) &&
                                                                  !widget
                                                                      .isDublicate!) {
                                                                await widget
                                                                    .doc!
                                                                    .reference
                                                                    .update({
                                                                  ...createArticlesRecordData(
                                                                    title: _model
                                                                        .textController1
                                                                        .text,
                                                                    description:
                                                                        _model
                                                                            .textController2
                                                                            .text,
                                                                    modifiedTime:
                                                                        getCurrentTimestamp,
                                                                    additional:
                                                                        updateFeedAdditionalDataStruct(
                                                                      FeedAdditionalDataStruct(
                                                                        icon: widget
                                                                            .rubricsDoc
                                                                            ?.icon,
                                                                        title: widget
                                                                            .rubricsDoc
                                                                            ?.name,
                                                                      ),
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                    endTime: _model
                                                                            .switchValue3!
                                                                        ? ((String?
                                                                                endDate,
                                                                            String?
                                                                                endTime) {
                                                                            return '${endDate ?? ''} ${endTime ?? ''}';
                                                                          }(_model.endDate, _model.endTime))
                                                                        : (''),
                                                                    startTime: _model
                                                                            .switchValue2!
                                                                        ? ((String?
                                                                                startDate,
                                                                            String?
                                                                                startTime) {
                                                                            return '${startDate ?? ''} ${startTime ?? ''}';
                                                                          }(_model.startDate, _model.startTime))
                                                                        : (''),
                                                                    name: '',
                                                                    isPublished:
                                                                        !_model
                                                                            .switchValue2!,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'article_blocks':
                                                                          getArticleBlockListFirestoreData(
                                                                        _model
                                                                            .list,
                                                                      ),
                                                                    },
                                                                  ),
                                                                });
                                                              } else {
                                                                var articlesRecordReference =
                                                                    ArticlesRecord
                                                                        .collection
                                                                        .doc();
                                                                await articlesRecordReference
                                                                    .set({
                                                                  ...createArticlesRecordData(
                                                                    title: _model
                                                                        .textController1
                                                                        .text,
                                                                    description:
                                                                        _model
                                                                            .textController2
                                                                            .text,
                                                                    rubricsRef: widget
                                                                        .rubricsDoc
                                                                        ?.reference,
                                                                    createdTime:
                                                                        getCurrentTimestamp,
                                                                    isDeleted:
                                                                        false,
                                                                    additional:
                                                                        updateFeedAdditionalDataStruct(
                                                                      FeedAdditionalDataStruct(
                                                                        icon: widget
                                                                            .rubricsDoc
                                                                            ?.icon,
                                                                        title: widget
                                                                            .rubricsDoc
                                                                            ?.name,
                                                                      ),
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    name: '',
                                                                    type: Editor
                                                                        .article,
                                                                    isVisible:
                                                                        true,
                                                                    publishedTime: kDebugMode
                                                                        ? dateTimeFromSecondsSinceEpoch(random_data.randomInteger(
                                                                            0,
                                                                            10))
                                                                        : getCurrentTimestamp,
                                                                    isPublished:
                                                                        !_model
                                                                            .switchValue2!,
                                                                    startTime: _model
                                                                            .switchValue2!
                                                                        ? ((String?
                                                                                startDate,
                                                                            String?
                                                                                startTime) {
                                                                            return '${startDate ?? ''} ${startTime ?? ''}';
                                                                          }(_model.startDate, _model.startTime))
                                                                        : (''),
                                                                    endTime: _model
                                                                            .switchValue3!
                                                                        ? ((String?
                                                                                endDate,
                                                                            String?
                                                                                endTime) {
                                                                            return '${endDate ?? ''} ${endTime ?? ''}';
                                                                          }(_model.endDate, _model.endTime))
                                                                        : (''),
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'article_blocks':
                                                                          getArticleBlockListFirestoreData(
                                                                        _model
                                                                            .list,
                                                                      ),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.newArticleDoc =
                                                                    ArticlesRecord
                                                                        .getDocumentFromData({
                                                                  ...createArticlesRecordData(
                                                                    title: _model
                                                                        .textController1
                                                                        .text,
                                                                    description:
                                                                        _model
                                                                            .textController2
                                                                            .text,
                                                                    rubricsRef: widget
                                                                        .rubricsDoc
                                                                        ?.reference,
                                                                    createdTime:
                                                                        getCurrentTimestamp,
                                                                    isDeleted:
                                                                        false,
                                                                    additional:
                                                                        updateFeedAdditionalDataStruct(
                                                                      FeedAdditionalDataStruct(
                                                                        icon: widget
                                                                            .rubricsDoc
                                                                            ?.icon,
                                                                        title: widget
                                                                            .rubricsDoc
                                                                            ?.name,
                                                                      ),
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                    name: '',
                                                                    type: Editor
                                                                        .article,
                                                                    isVisible:
                                                                        true,
                                                                    publishedTime: kDebugMode
                                                                        ? dateTimeFromSecondsSinceEpoch(random_data.randomInteger(
                                                                            0,
                                                                            10))
                                                                        : getCurrentTimestamp,
                                                                    isPublished:
                                                                        !_model
                                                                            .switchValue2!,
                                                                    startTime: _model
                                                                            .switchValue2!
                                                                        ? ((String?
                                                                                startDate,
                                                                            String?
                                                                                startTime) {
                                                                            return '${startDate ?? ''} ${startTime ?? ''}';
                                                                          }(_model.startDate, _model.startTime))
                                                                        : (''),
                                                                    endTime: _model
                                                                            .switchValue3!
                                                                        ? ((String?
                                                                                endDate,
                                                                            String?
                                                                                endTime) {
                                                                            return '${endDate ?? ''} ${endTime ?? ''}';
                                                                          }(_model.endDate, _model.endTime))
                                                                        : (''),
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'article_blocks':
                                                                          getArticleBlockListFirestoreData(
                                                                        _model
                                                                            .list,
                                                                      ),
                                                                    },
                                                                  ),
                                                                }, articlesRecordReference);
                                                                _shouldSetState =
                                                                    true;

                                                                await widget
                                                                    .rubricsDoc!
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'articles_refs':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        _model
                                                                            .newArticleDoc
                                                                            ?.reference
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                if (_model
                                                                    .switchValue1!) {
                                                                  var ffPushNotificationsQueueRecordReference =
                                                                      FfPushNotificationsQueueRecord
                                                                          .collection
                                                                          .doc();
                                                                  await ffPushNotificationsQueueRecordReference
                                                                      .set(
                                                                          createFfPushNotificationsQueueRecordData(
                                                                    notificationTitle: _model.textController3.text !=
                                                                                ''
                                                                        ? _model
                                                                            .textController3
                                                                            .text
                                                                        : _model
                                                                            .textController1
                                                                            .text,
                                                                    notificationText: _model.textController4.text !=
                                                                                ''
                                                                        ? _model
                                                                            .textController4
                                                                            .text
                                                                        : 'Нажмите чтобы перейти к статье',
                                                                    createdTime:
                                                                        getCurrentTimestamp,
                                                                    status: NotificationStatus
                                                                        .inQueue,
                                                                    isDeleted:
                                                                        false,
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                    redirect:
                                                                        updateRedirectStruct(
                                                                      RedirectStruct(
                                                                        articlesRef: _model
                                                                            .newArticleDoc
                                                                            ?.reference,
                                                                        rubricsRef: widget
                                                                            .rubricsDoc
                                                                            ?.reference,
                                                                      ),
                                                                      clearUnsetFields:
                                                                          false,
                                                                      create:
                                                                          true,
                                                                    ),
                                                                  ));
                                                                  _model.notificationDoc =
                                                                      FfPushNotificationsQueueRecord.getDocumentFromData(
                                                                          createFfPushNotificationsQueueRecordData(
                                                                            notificationTitle: _model.textController3.text != ''
                                                                                ? _model.textController3.text
                                                                                : _model.textController1.text,
                                                                            notificationText: _model.textController4.text != ''
                                                                                ? _model.textController4.text
                                                                                : 'Нажмите чтобы перейти к статье',
                                                                            createdTime:
                                                                                getCurrentTimestamp,
                                                                            status:
                                                                                NotificationStatus.inQueue,
                                                                            isDeleted:
                                                                                false,
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            redirect:
                                                                                updateRedirectStruct(
                                                                              RedirectStruct(
                                                                                articlesRef: _model.newArticleDoc?.reference,
                                                                                rubricsRef: widget.rubricsDoc?.reference,
                                                                              ),
                                                                              clearUnsetFields: false,
                                                                              create: true,
                                                                            ),
                                                                          ),
                                                                          ffPushNotificationsQueueRecordReference);
                                                                  _shouldSetState =
                                                                      true;

                                                                  await _model
                                                                      .notificationDoc!
                                                                      .reference
                                                                      .update(
                                                                          createFfPushNotificationsQueueRecordData(
                                                                    status: NotificationStatus
                                                                        .sending,
                                                                  ));
                                                                }
                                                              }

                                                              _model.returnRubricDoc =
                                                                  await RubricsRecord
                                                                      .getDocumentOnce(widget
                                                                          .rubricsDoc!
                                                                          .reference);
                                                              _shouldSetState =
                                                                  true;
                                                              Navigator.pop(
                                                                  context,
                                                                  _model
                                                                      .returnRubricDoc);
                                                            } else {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          text: 'Сохранить',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 56.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Akrobat',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
