import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'admin_article_card_model.dart';
export 'admin_article_card_model.dart';

class AdminArticleCardWidget extends StatefulWidget {
  const AdminArticleCardWidget({
    super.key,
    required this.doc,
    this.onEditTap,
    this.onDeleteTap,
    this.onDelLongPressed,
    this.onVisabilityPressed,
    this.onDublicatePressed,
  });

  final ArticlesRecord? doc;
  final Future Function()? onEditTap;
  final Future Function()? onDeleteTap;
  final Future Function()? onDelLongPressed;
  final Future Function()? onVisabilityPressed;
  final Future Function()? onDublicatePressed;

  @override
  State<AdminArticleCardWidget> createState() => _AdminArticleCardWidgetState();
}

class _AdminArticleCardWidgetState extends State<AdminArticleCardWidget> {
  late AdminArticleCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminArticleCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.color = (widget.doc != null) == null
          ? FlutterFlowTheme.of(context).primaryText
          : Color(0xFF969298);
      safeSetState(() {});
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
    return Visibility(
      visible: isWeb,
      child: Container(
        width: 308.0,
        height: 308.0,
        decoration: BoxDecoration(
          color: widget.doc!.isVisible ? Color(0xFFF3F1F4) : Color(0x7FF3F1F4),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Создано: ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: dateTimeFormat(
                                    "d.MM.yy",
                                    widget.doc!.createdTime!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                TextSpan(
                                  text: ' • ',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                  ),
                                ),
                                TextSpan(
                                  text: dateTimeFormat(
                                    "Hm",
                                    widget.doc!.createdTime!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    color: _model.color,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 2.0)),
                      ),
                      if (widget.doc?.startTime != null &&
                          widget.doc?.startTime != '')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Публикация: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: (String time) {
                                      return time.replaceAll(' ', ' • ');
                                    }(widget.doc!.startTime),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Akrobat',
                                      color: _model.color,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 2.0)),
                        ),
                      if (widget.doc?.endTime != null &&
                          widget.doc?.endTime != '')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Скрытие: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: (String time) {
                                      return time.replaceAll(' ', ' • ');
                                    }(widget.doc!.endTime),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Akrobat',
                                      color: _model.color,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 2.0)),
                        ),
                    ],
                  ),
                  if (false)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.onEditTap?.call();
                          },
                          child: Icon(
                            Icons.edit_outlined,
                            color: true
                                ? FlutterFlowTheme.of(context).primary
                                : Color(0xFF969298),
                            size: 24.0,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.onDeleteTap?.call();
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  Text(
                    widget.doc!.title,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          color: widget.doc!.isVisible
                              ? Color(0xFF2D2830)
                              : Color(0x7D969298),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                  Text(
                    widget.doc!.description,
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          color: widget.doc!.isVisible
                              ? Color(0xFF2D2830)
                              : Color(0x7D969298),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onLongPress: () async {
                      await widget.onDelLongPressed?.call();
                    },
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.delete_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await widget.onDeleteTap?.call();
                      },
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.visibility_rounded,
                      color: widget.doc!.isVisible
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.onVisabilityPressed?.call();
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: widget.doc!.isVisible
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0x7D969298),
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    disabledIconColor: Color(0x7D969298),
                    icon: Icon(
                      Icons.edit_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: !widget.doc!.isVisible
                        ? null
                        : () async {
                            await widget.onEditTap?.call();
                          },
                  ),
                  if (widget.doc?.type == Editor.article)
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderRadius: 10.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.content_copy,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await widget.onDublicatePressed?.call();
                      },
                    ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
