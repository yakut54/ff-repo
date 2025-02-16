import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'd_e_l_admin_story_covers_model.dart';
export 'd_e_l_admin_story_covers_model.dart';

class DELAdminStoryCoversWidget extends StatefulWidget {
  const DELAdminStoryCoversWidget({
    super.key,
    this.onImageTap,
    this.initialReference,
  });

  final Future Function(CategoriesRecord doc)? onImageTap;
  final DocumentReference? initialReference;

  @override
  State<DELAdminStoryCoversWidget> createState() =>
      _DELAdminStoryCoversWidgetState();
}

class _DELAdminStoryCoversWidgetState extends State<DELAdminStoryCoversWidget> {
  late DELAdminStoryCoversModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DELAdminStoryCoversModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.initialReference != null) {
        _model.currentDocReference = widget.initialReference;
        safeSetState(() {});
        return;
      } else {
        return;
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
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              'Выбрать обложку',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Akrobat',
                    color: Color(0xFF969298),
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Flexible(
            child: Container(
              height: 130.0,
              decoration: BoxDecoration(),
              child: StreamBuilder<List<CategoriesRecord>>(
                stream: queryCategoriesRecord(
                  queryBuilder: (categoriesRecord) =>
                      categoriesRecord.orderBy('created_time'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<CategoriesRecord> listViewCategoriesRecordList =
                      snapshot.data!;

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listViewCategoriesRecordList.length,
                    separatorBuilder: (_, __) => SizedBox(width: 10.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewCategoriesRecord =
                          listViewCategoriesRecordList[listViewIndex];
                      return Visibility(
                        visible: listViewCategoriesRecord.name !=
                            FFAppConstants.serviceAddItem,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.currentDocReference =
                                listViewCategoriesRecord.reference;
                            safeSetState(() {});
                            await widget.onImageTap?.call(
                              listViewCategoriesRecord,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Container(
                              width: 86.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: listViewCategoriesRecord
                                                      .reference ==
                                                  _model.currentDocReference
                                              ? Color(0xFFB47C73)
                                              : Colors.transparent,
                                          width: 1.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 86.0,
                                        height: 86.0,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                listViewCategoriesRecord.image,
                                                width: _model
                                                            .currentDocReference ==
                                                        listViewCategoriesRecord
                                                            .reference
                                                    ? 74.0
                                                    : 86.0,
                                                height: _model
                                                            .currentDocReference ==
                                                        listViewCategoriesRecord
                                                            .reference
                                                    ? 74.0
                                                    : 86.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            if (false)
                                              Container(
                                                width: _model
                                                            .currentDocReference ==
                                                        listViewCategoriesRecord
                                                            .reference
                                                    ? 74.0
                                                    : 86.0,
                                                height: _model
                                                            .currentDocReference ==
                                                        listViewCategoriesRecord
                                                            .reference
                                                    ? 74.0
                                                    : 86.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x7EB47C73),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 35.0,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Text(
                                        listViewCategoriesRecord.name,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
