import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile/pages/home/articles/horoscope/admin_zodiac_block/admin_zodiac_block_widget.dart';
import '/web/ui/pop_ups/admin_app_pop_up/admin_app_pop_up_widget.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'horoscope_pop_up_model.dart';
export 'horoscope_pop_up_model.dart';

class HoroscopePopUpWidget extends StatefulWidget {
  const HoroscopePopUpWidget({
    super.key,
    this.doc,
    required this.rubricDoc,
  });

  final ArticlesRecord? doc;
  final RubricsRecord? rubricDoc;

  @override
  State<HoroscopePopUpWidget> createState() => _HoroscopePopUpWidgetState();
}

class _HoroscopePopUpWidgetState extends State<HoroscopePopUpWidget> {
  late HoroscopePopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoroscopePopUpModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.doc != null) {
        _model.list =
            widget.doc!.horoscopeBlocks.toList().cast<HoroscopeBlockStruct>();
        safeSetState(() {});
      } else {
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.aries,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.taurus,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.gemini,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.cancer,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.leo,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.virgo,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.libra,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.scorpio,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.sagittarius,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.capricorn,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.aquarius,
        ));
        _model.addToList(HoroscopeBlockStruct(
          zodiac: Zodiac.pisces,
        ));
        safeSetState(() {});
      }
    });

    _model.textController1 ??= TextEditingController(text: widget.doc?.title);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.doc?.description);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: widget.doc?.advice);
    _model.textFieldFocusNode3 ??= FocusNode();

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
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Редактор астропрогноза',
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
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            if (functions.adminCanCloseHoroscopePopUp(
                                widget.doc,
                                _model.textController1.text,
                                _model.textController2.text,
                                _model.textController3.text,
                                _model.list.toList())) {
                              Navigator.pop(context, widget.rubricDoc);
                            } else {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
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
                                          Navigator.pop(
                                              context, widget.rubricDoc);
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
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Заголовок *',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    alignLabelWithHint: true,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  maxLines: 2,
                                  minLines: 1,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                                TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Описание',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    alignLabelWithHint: true,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  maxLines: 10,
                                  minLines: 1,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                                TextFormField(
                                  controller: _model.textController3,
                                  focusNode: _model.textFieldFocusNode3,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Совет недели',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    alignLabelWithHint: true,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  maxLines: 10,
                                  minLines: 1,
                                  validator: _model.textController3Validator
                                      .asValidator(context),
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final generatedList = _model.list.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(generatedList.length,
                                    (generatedListIndex) {
                                  final generatedListItem =
                                      generatedList[generatedListIndex];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: AdminZodiacBlockWidget(
                                      key: Key(
                                          'Keywp7_${generatedListIndex}_of_${generatedList.length}'),
                                      block: generatedListItem,
                                      onChange: (block) async {
                                        _model.updateListAtIndex(
                                          generatedListIndex,
                                          (_) => block!,
                                        );
                                        await actions.updateUserOnlineStatus();
                                      },
                                    ),
                                  );
                                }).divide(SizedBox(height: 30.0)),
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
                if (_model.errorList.isNotEmpty)
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: wrapWithModel(
                        model: _model.errorStackModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ErrorStackWidget(
                          stack: _model.errorList,
                          onClose: () async {
                            _model.errorList = [];
                            safeSetState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (false)
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 56.0,
                        icon: Icon(
                          Icons.visibility_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          _model.errorList = functions
                              .adminHoroscopePopUpValidator(
                                  _model.textController1.text,
                                  _model.list.toList())
                              .toList()
                              .cast<String>();
                          safeSetState(() {});
                          if (!(_model.errorList.isNotEmpty)) {
                            if (widget.doc != null) {
                              await widget.doc!.reference.update({
                                ...createArticlesRecordData(
                                  title: _model.textController1.text,
                                  description: _model.textController2.text,
                                  modifiedTime: getCurrentTimestamp,
                                  advice: _model.textController3.text,
                                ),
                                ...mapToFirestore(
                                  {
                                    'horoscope_blocks':
                                        getHoroscopeBlockListFirestoreData(
                                      _model.list,
                                    ),
                                  },
                                ),
                              });
                            } else {
                              var articlesRecordReference =
                                  ArticlesRecord.collection.doc();
                              await articlesRecordReference.set({
                                ...createArticlesRecordData(
                                  title: _model.textController1.text,
                                  description: _model.textController2.text,
                                  rubricsRef: widget.rubricDoc?.reference,
                                  createdTime: getCurrentTimestamp,
                                  isDeleted: false,
                                  advice: _model.textController3.text,
                                  isVisible: true,
                                  isPublished: true,
                                  publishedTime: getCurrentTimestamp,
                                  name: '',
                                  type: Editor.horoscope,
                                ),
                                ...mapToFirestore(
                                  {
                                    'horoscope_blocks':
                                        getHoroscopeBlockListFirestoreData(
                                      _model.list,
                                    ),
                                  },
                                ),
                              });
                              _model.newArticleDoc =
                                  ArticlesRecord.getDocumentFromData({
                                ...createArticlesRecordData(
                                  title: _model.textController1.text,
                                  description: _model.textController2.text,
                                  rubricsRef: widget.rubricDoc?.reference,
                                  createdTime: getCurrentTimestamp,
                                  isDeleted: false,
                                  advice: _model.textController3.text,
                                  isVisible: true,
                                  isPublished: true,
                                  publishedTime: getCurrentTimestamp,
                                  name: '',
                                  type: Editor.horoscope,
                                ),
                                ...mapToFirestore(
                                  {
                                    'horoscope_blocks':
                                        getHoroscopeBlockListFirestoreData(
                                      _model.list,
                                    ),
                                  },
                                ),
                              }, articlesRecordReference);
                              _shouldSetState = true;

                              await widget.rubricDoc!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'articles_refs': FieldValue.arrayUnion(
                                        [_model.newArticleDoc?.reference]),
                                  },
                                ),
                              });
                            }

                            _model.returnRubricDoc =
                                await RubricsRecord.getDocumentOnce(
                                    widget.rubricDoc!.reference);
                            _shouldSetState = true;
                            Navigator.pop(context, _model.returnRubricDoc);
                          } else {
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: 'Сохранить',
                        options: FFButtonOptions(
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Akrobat',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
