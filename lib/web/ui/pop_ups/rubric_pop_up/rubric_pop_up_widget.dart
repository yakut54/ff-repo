import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/web/ui/pop_ups/admin_app_pop_up/admin_app_pop_up_widget.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'rubric_pop_up_model.dart';
export 'rubric_pop_up_model.dart';

class RubricPopUpWidget extends StatefulWidget {
  const RubricPopUpWidget({
    super.key,
    this.doc,
  });

  final RubricsRecord? doc;

  @override
  State<RubricPopUpWidget> createState() => _RubricPopUpWidgetState();
}

class _RubricPopUpWidgetState extends State<RubricPopUpWidget> {
  late RubricPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RubricPopUpModel());

    _model.textController ??= TextEditingController(text: widget.doc?.name);
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
    return Visibility(
      visible: isWeb,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: 590.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        widget.doc != null
                            ? 'Редактирование рубрики'
                            : 'Добавление рубрики',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              fontSize: 26.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
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
                          if (functions.adminCanCloseRubricPopUp(
                              widget.doc,
                              _model.textController.text,
                              _model.uploadedFileUrl1 != ''
                                  ? _model.uploadedFileUrl1
                                  : widget.doc?.banner)) {
                            Navigator.pop(context);
                            return;
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
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                            );

                            return;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Название рубрики',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Akrobat',
                                    color: Color(0xFFAAA7AC),
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Название',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  color: Color(0xFFBFBCC1),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFAAA7AC),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF2D2830),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Akrobat',
                                    color: Color(0xFF2D2830),
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          maxLength: 24,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Иконка рубрики',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              color: Color(0xFFAAA7AC),
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.clearIcon == null
                            ? (widget.doc != null
                                ? functions.imageIsSetAndIsNotEmpty(
                                    widget.doc?.iconImage)
                                : false)
                            : !_model.clearIcon!)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl:
                                          _model.uploadedFileUrl1 != ''
                                              ? _model.uploadedFileUrl1
                                              : widget.doc!.iconImage,
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: _model.uploadedFileUrl1 != ''
                                        ? _model.uploadedFileUrl1
                                        : widget.doc!.iconImage,
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: _model.uploadedFileUrl1 != ''
                                  ? _model.uploadedFileUrl1
                                  : widget.doc!.iconImage,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: _model.uploadedFileUrl1 != ''
                                      ? _model.uploadedFileUrl1
                                      : widget.doc!.iconImage,
                                  width: 56.0,
                                  height: 56.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        if (_model.clearIcon == null
                            ? (widget.doc != null
                                ? functions.imageIsSetAndIsNotEmpty(
                                    widget.doc?.iconImage)
                                : false)
                            : !_model.clearIcon!)
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 56.0,
                            icon: Icon(
                              Icons.delete_outline,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              safeSetState(() {
                                _model.isDataUploading1 = false;
                                _model.uploadedLocalFile1 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl1 = '';
                              });

                              _model.clearIcon = true;
                              safeSetState(() {});
                            },
                          ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(
                                    () => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl1 =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              _model.clearIcon =
                                  _model.uploadedFileUrl1 == '';
                              safeSetState(() {});
                            },
                            text: 'Загрузить изображение',
                            icon: Icon(
                              Icons.add_rounded,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Баннер рубрики',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              color: Color(0xFFAAA7AC),
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.clearImage == null
                            ? (widget.doc != null
                                ? functions.imageIsSetAndIsNotEmpty(
                                    widget.doc?.banner)
                                : false)
                            : !_model.clearImage!)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl:
                                          _model.uploadedFileUrl2 != ''
                                              ? _model.uploadedFileUrl2
                                              : widget.doc!.banner,
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: _model.uploadedFileUrl2 != ''
                                        ? _model.uploadedFileUrl2
                                        : widget.doc!.banner,
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: _model.uploadedFileUrl2 != ''
                                  ? _model.uploadedFileUrl2
                                  : widget.doc!.banner,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: _model.uploadedFileUrl2 != ''
                                      ? _model.uploadedFileUrl2
                                      : widget.doc!.banner,
                                  width: 56.0,
                                  height: 56.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        if (_model.clearImage == null
                            ? (widget.doc != null
                                ? functions.imageIsSetAndIsNotEmpty(
                                    widget.doc?.banner)
                                : false)
                            : !_model.clearImage!)
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 56.0,
                            icon: Icon(
                              Icons.delete_outline,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              safeSetState(() {
                                _model.isDataUploading2 = false;
                                _model.uploadedLocalFile2 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                                _model.uploadedFileUrl2 = '';
                              });

                              _model.clearImage = true;
                              safeSetState(() {});
                            },
                          ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(
                                    () => _model.isDataUploading2 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading2 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile2 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl2 =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              _model.clearImage =
                                  _model.uploadedFileUrl2 == '';
                              safeSetState(() {});
                            },
                            text: 'Загрузить изображение',
                            icon: Icon(
                              Icons.add_rounded,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Редактор',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              color: Color(0xFFAAA7AC),
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(
                        _model.dropDownValue ??= widget.doc != null
                            ? () {
                                if (widget.doc?.editor == Editor.article) {
                                  return 'article';
                                } else if (widget.doc?.editor ==
                                    Editor.horoscope) {
                                  return 'horoscope';
                                } else if (widget.doc?.editor == Editor.link) {
                                  return 'link';
                                } else {
                                  return ' ';
                                }
                              }()
                            : 'article',
                      ),
                      options:
                          List<String>.from(['article', 'horoscope', 'link']),
                      optionLabels: ['Блоки', 'Астропрогноз', 'Внешний ресурс'],
                      onChanged: (val) =>
                          safeSetState(() => _model.dropDownValue = val),
                      width: double.infinity,
                      height: 56.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Akrobat',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      disabled: widget.doc != null,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
                if (_model.errorList.isNotEmpty)
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
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
                FFButtonWidget(
                  onPressed: () async {
                    var _shouldSetState = false;
                    final firestoreBatch = FirebaseFirestore.instance.batch();
                    try {
                      if (functions
                          .adminRubricPopUpValidator(_model.textController.text)
                          .isNotEmpty) {
                        _model.errorList = functions
                            .adminRubricPopUpValidator(
                                _model.textController.text)
                            .toList()
                            .cast<String>();
                        safeSetState(() {});
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      } else {
                        _model.errorList = [];
                        safeSetState(() {});
                        if (widget.doc != null) {
                          firestoreBatch.update(
                              widget.doc!.reference,
                              createRubricsRecordData(
                                name: _model.textController.text,
                                modifiedTime: getCurrentTimestamp,
                              ));
                          if ((_model.clearImage != null) &&
                              _model.clearImage!) {
                            firestoreBatch.update(widget.doc!.reference, {
                              ...mapToFirestore(
                                {
                                  'banner': FieldValue.delete(),
                                },
                              ),
                            });
                          } else {
                            firestoreBatch.update(
                                widget.doc!.reference,
                                createRubricsRecordData(
                                  banner: _model.uploadedFileUrl2 != ''
                                      ? _model.uploadedFileUrl2
                                      : widget.doc?.banner,
                                ));
                          }

                          if ((_model.clearIcon != null) && _model.clearIcon!) {
                            firestoreBatch.update(widget.doc!.reference, {
                              ...mapToFirestore(
                                {
                                  'icon_image': FieldValue.delete(),
                                },
                              ),
                            });
                          } else {
                            firestoreBatch.update(
                                widget.doc!.reference,
                                createRubricsRecordData(
                                  iconImage: _model.uploadedFileUrl1 != ''
                                      ? _model.uploadedFileUrl1
                                      : widget.doc?.iconImage,
                                ));
                          }

                          if ((widget.doc?.name !=
                                  _model.textController.text) ||
                              (widget.doc?.iconImage !=
                                  _model.uploadedFileUrl1)) {
                            await actions.changeRibricDataInArticles(
                              _model.textController.text,
                              _model.uploadedFileUrl1,
                              widget.doc?.articlesRefs.toList(),
                            );
                          }
                        } else {
                          var rubricsRecordReference =
                              RubricsRecord.collection.doc();
                          firestoreBatch.set(
                              rubricsRecordReference,
                              createRubricsRecordData(
                                name: _model.textController.text,
                                isVisible: true,
                                isDeleted: false,
                                createdTime: getCurrentTimestamp,
                                editor: () {
                                  if (_model.dropDownValue == 'article') {
                                    return Editor.article;
                                  } else if (_model.dropDownValue ==
                                      'horoscope') {
                                    return Editor.horoscope;
                                  } else if (_model.dropDownValue == 'link') {
                                    return Editor.link;
                                  } else {
                                    return null;
                                  }
                                }(),
                                banner: _model.uploadedFileUrl2 != ''
                                    ? _model.uploadedFileUrl2
                                    : null,
                                iconImage: _model.uploadedFileUrl1 != ''
                                    ? _model.uploadedFileUrl1
                                    : null,
                              ));
                          _model.newDoc = RubricsRecord.getDocumentFromData(
                              createRubricsRecordData(
                                name: _model.textController.text,
                                isVisible: true,
                                isDeleted: false,
                                createdTime: getCurrentTimestamp,
                                editor: () {
                                  if (_model.dropDownValue == 'article') {
                                    return Editor.article;
                                  } else if (_model.dropDownValue ==
                                      'horoscope') {
                                    return Editor.horoscope;
                                  } else if (_model.dropDownValue == 'link') {
                                    return Editor.link;
                                  } else {
                                    return null;
                                  }
                                }(),
                                banner: _model.uploadedFileUrl2 != ''
                                    ? _model.uploadedFileUrl2
                                    : null,
                                iconImage: _model.uploadedFileUrl1 != ''
                                    ? _model.uploadedFileUrl1
                                    : null,
                              ),
                              rubricsRecordReference);
                          _shouldSetState = true;
                        }

                        Navigator.pop(context);
                      }
                    } finally {
                      await firestoreBatch.commit();
                    }

                    if (_shouldSetState) safeSetState(() {});
                  },
                  text: 'Сохранить',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Akrobat',
                          color: Colors.white,
                          fontSize: 19.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
