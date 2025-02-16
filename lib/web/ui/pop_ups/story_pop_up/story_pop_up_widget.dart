import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/test_folder/stories_viewer/stories_viewer_widget.dart';
import '/web/ui/admin_upload_image_component/admin_upload_image_component_widget.dart';
import '/web/ui/pop_ups/admin_app_pop_up/admin_app_pop_up_widget.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import '/web/ui/previews/story_card_preview/story_card_preview_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'story_pop_up_model.dart';
export 'story_pop_up_model.dart';

class StoryPopUpWidget extends StatefulWidget {
  const StoryPopUpWidget({
    super.key,
    this.doc,
  });

  final StoriesRecord? doc;

  @override
  State<StoryPopUpWidget> createState() => _StoryPopUpWidgetState();
}

class _StoryPopUpWidgetState extends State<StoryPopUpWidget> {
  late StoryPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryPopUpModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.image = widget.doc?.image;
      _model.cover = widget.doc?.coverImage;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController(text: widget.doc?.name);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.doc?.buttonText);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: widget.doc?.link);
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
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.all(100.0),
          child: Container(
            width: 590.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    child: Text(
                                      widget.doc != null
                                          ? 'Редактирование истории'
                                          : 'Новая история',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        if (functions.adminCanCloseStoryPopUp(
                                            widget.doc,
                                            _model.textController2.text,
                                            _model.textController3.text,
                                            _model.image,
                                            _model.textController1.text,
                                            _model.cover)) {
                                          Navigator.pop(context);
                                          return;
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
                            ].divide(SizedBox(height: 20.0)),
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
                                    'Название истории',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
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
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2D2830),
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
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 0.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF2D2830),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    maxLength: 24,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    validator: _model.textController1Validator
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
                                  'Обложка истории',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        color: Color(0xFFAAA7AC),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Builder(
                                builder: (context) => wrapWithModel(
                                  model: _model.adminUploadImageComponentModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AdminUploadImageComponentWidget(
                                    imagePath: widget.doc?.coverImage,
                                    onUploaded: (imagePath) async {
                                      _model.cover = imagePath;
                                    },
                                    onPreviewPressed: () async {
                                      _model.storyDoc2 = await actions
                                          .adminCreatePreviewStoryList(
                                        _model.image,
                                        _model.textController2.text,
                                        _model.textController3.text,
                                        _model.textController1.text,
                                        _model.cover,
                                      );
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: Container(
                                                height: 800.0,
                                                width: 400.0,
                                                child: StoryCardPreviewWidget(
                                                  doc: _model
                                                      .storyDoc2!.firstOrNull!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      safeSetState(() {});
                                    },
                                    onUploading: (isUploading) async {
                                      _model.imageIsUploading = isUploading;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
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
                                    'Название кнопки',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
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
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode2,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2D2830),
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
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 0.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF2D2830),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    maxLength: 24,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
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
                                    'Ссылка',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
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
                                    controller: _model.textController3,
                                    focusNode: _model.textFieldFocusNode3,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'https://',
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF2D2830),
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
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 0.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF2D2830),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    validator: _model.textController3Validator
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
                                  'Картинка истории',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        color: Color(0xFFAAA7AC),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Builder(
                                builder: (context) => wrapWithModel(
                                  model: _model.adminUploadImageComponentModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AdminUploadImageComponentWidget(
                                    imagePath: widget.doc?.image,
                                    onUploaded: (imagePath) async {
                                      _model.image = imagePath;
                                    },
                                    onPreviewPressed: () async {
                                      _model.storyDoc1 = await actions
                                          .adminCreatePreviewStoryList(
                                        _model.image,
                                        _model.textController2.text,
                                        _model.textController3.text,
                                        _model.textController1.text,
                                        _model.cover,
                                      );
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: Container(
                                                height: 800.0,
                                                width: 400.0,
                                                child: StoriesViewerWidget(
                                                  docs: _model.storyDoc1!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      safeSetState(() {});
                                    },
                                    onUploading: (isUploading) async {
                                      _model.imageIsUploading = isUploading;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: _model.imageIsUploading
                                  ? null
                                  : () async {
                                      if (functions
                                          .adminStoryPopUpValidator(
                                              _model.textController2.text,
                                              _model.image,
                                              _model.textController3.text,
                                              _model.textController1.text,
                                              _model.cover)
                                          .isNotEmpty) {
                                        _model.errorList = functions
                                            .adminStoryPopUpValidator(
                                                _model.textController2.text,
                                                _model.image,
                                                _model.textController3.text,
                                                _model.textController1.text,
                                                _model.cover)
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        return;
                                      } else {
                                        _model.errorList = [];
                                        safeSetState(() {});
                                        if (widget.doc != null) {
                                          await widget.doc!.reference
                                              .update(createStoriesRecordData(
                                            image: _model.image != null &&
                                                    _model.image != ''
                                                ? _model.image
                                                : widget.doc?.image,
                                            buttonText:
                                                _model.textController2.text,
                                            link: _model.textController3.text,
                                            modifiedTime: getCurrentTimestamp,
                                            name: _model.textController1.text,
                                            coverImage: _model.cover != null &&
                                                    _model.cover != ''
                                                ? _model.cover
                                                : widget.doc?.coverImage,
                                          ));
                                        } else {
                                          await StoriesRecord.collection
                                              .doc()
                                              .set(createStoriesRecordData(
                                                isVisible: true,
                                                link:
                                                    _model.textController3.text,
                                                buttonText:
                                                    _model.textController2.text,
                                                image: _model.image,
                                                isDeleted: false,
                                                createdTime:
                                                    getCurrentTimestamp,
                                                name:
                                                    _model.textController1.text,
                                                coverImage: _model.cover,
                                              ));
                                        }

                                        Navigator.pop(context);
                                        return;
                                      }
                                    },
                              text: 'Опубликовать',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
