import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/ui/bottom_test_component/bottom_test_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_feed_card_model.dart';
export 'new_feed_card_model.dart';

class NewFeedCardWidget extends StatefulWidget {
  const NewFeedCardWidget({
    super.key,
    required this.articleItem,
    this.onCommentsPressed,
    this.onTap,
  });

  final ArticlesStateTypeStruct? articleItem;
  final Future Function()? onCommentsPressed;
  final Future Function()? onTap;

  @override
  State<NewFeedCardWidget> createState() => _NewFeedCardWidgetState();
}

class _NewFeedCardWidgetState extends State<NewFeedCardWidget> {
  late NewFeedCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewFeedCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if ((functions
                              .getRubricById(widget.articleItem!.rubricDoc,
                                  FFAppState().RubricsState.toList())
                              ?.iconImage !=
                          null &&
                      functions
                              .getRubricById(widget.articleItem!.rubricDoc,
                                  FFAppState().RubricsState.toList())
                              ?.iconImage !=
                          '') &&
                  (functions
                          .getRubricById(widget.articleItem!.rubricDoc,
                              FFAppState().RubricsState.toList())
                          ?.name !=
                      ''))
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions
                                .getRubricById(widget.articleItem!.rubricDoc,
                                    FFAppState().RubricsState.toList())
                                ?.name,
                            'Без рубрики',
                          ),
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Akrobat',
                                    color: Color(0xFF024F55),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Visibility(
                        visible: functions
                                    .getRubricById(
                                        widget.articleItem!.rubricDoc,
                                        FFAppState().RubricsState.toList())
                                    ?.iconImage !=
                                null &&
                            functions
                                    .getRubricById(
                                        widget.articleItem!.rubricDoc,
                                        FFAppState().RubricsState.toList())
                                    ?.iconImage !=
                                '',
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 300),
                          fadeOutDuration: Duration(milliseconds: 300),
                          imageUrl: valueOrDefault<String>(
                            functions
                                .getRubricById(widget.articleItem!.rubricDoc,
                                    FFAppState().RubricsState.toList())
                                ?.iconImage,
                            'https://firebasestorage.googleapis.com/v0/b/marta-ng-womens-council.appspot.com/o/white.png?alt=media&token=1cca3b95-c593-4f81-857b-0185d83127ff',
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              Text(
                valueOrDefault<String>(
                  widget.articleItem?.title,
                  'title',
                ),
                maxLines: 2,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Akrobat',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
              if (widget.articleItem?.description != '')
                Text(
                  valueOrDefault<String>(
                    widget.articleItem?.description,
                    'description',
                  ),
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Akrobat',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                ),
              wrapWithModel(
                model: _model.bottomTestComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomTestComponentWidget(
                  articleItemBottom: widget.articleItem!,
                ),
              ),
            ].divide(SizedBox(height: 6.0)),
          ),
        ),
      ),
    );
  }
}
