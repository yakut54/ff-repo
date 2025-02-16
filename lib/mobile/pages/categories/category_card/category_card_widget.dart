import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'category_card_model.dart';
export 'category_card_model.dart';

class CategoryCardWidget extends StatefulWidget {
  const CategoryCardWidget({
    super.key,
    required this.doc,
    required this.type,
    this.onTap,
  });

  final CategoriesRecord? doc;
  final CategoryCardType? type;
  final Future Function()? onTap;

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  late CategoryCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call();
      },
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: () {
                  if (widget.type == CategoryCardType.short) {
                    return 155.0;
                  } else if (widget.type == CategoryCardType.long) {
                    return 320.0;
                  } else {
                    return 155.0;
                  }
                }(),
                decoration: BoxDecoration(),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  children: [
                    Container(
                      width: () {
                        if (widget.type == CategoryCardType.short) {
                          return 153.0;
                        } else if (widget.type == CategoryCardType.long) {
                          return 318.0;
                        } else {
                          return 153.0;
                        }
                      }(),
                      height: () {
                        if (widget.type == CategoryCardType.short) {
                          return 185.0;
                        } else if (widget.type == CategoryCardType.long) {
                          return 140.0;
                        } else {
                          return 185.0;
                        }
                      }(),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                    Container(
                      width: () {
                        if (widget.type == CategoryCardType.short) {
                          return 155.0;
                        } else if (widget.type == CategoryCardType.long) {
                          return 320.0;
                        } else {
                          return 155.0;
                        }
                      }(),
                      height: () {
                        if (widget.type == CategoryCardType.short) {
                          return 185.0;
                        } else if (widget.type == CategoryCardType.long) {
                          return 140.0;
                        } else {
                          return 185.0;
                        }
                      }(),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 300),
                              fadeOutDuration: Duration(milliseconds: 300),
                              imageUrl: widget.doc!.image,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (false)
                            Container(
                              width: () {
                                if (widget.type == CategoryCardType.short) {
                                  return 155.0;
                                } else if (widget.type ==
                                    CategoryCardType.long) {
                                  return 320.0;
                                } else {
                                  return 155.0;
                                }
                              }(),
                              height: () {
                                if (widget.type == CategoryCardType.short) {
                                  return 185.0;
                                } else if (widget.type ==
                                    CategoryCardType.long) {
                                  return 140.0;
                                } else {
                                  return 185.0;
                                }
                              }(),
                              decoration: BoxDecoration(
                                color: Color(0x7FB47C73),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Builder(
                        builder: (context) {
                          final tags = widget.doc?.tags.toList() ?? [];

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(tags.length, (tagsIndex) {
                              final tagsItem = tags[tagsIndex];
                              return Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x80FFFFFF),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 2.0),
                                    child: Text(
                                      tagsItem,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            color: Color(0xFF024F55),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }).divide(SizedBox(height: 5.0)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
                child: Container(
                  width: () {
                    if (widget.type == CategoryCardType.short) {
                      return 153.0;
                    } else if (widget.type == CategoryCardType.long) {
                      return 318.0;
                    } else {
                      return 153.0;
                    }
                  }(),
                  height: () {
                    if (widget.type == CategoryCardType.long) {
                      return 38.0;
                    } else if (widget.type == CategoryCardType.short) {
                      return 60.0;
                    } else {
                      return 30.0;
                    }
                  }(),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
                      child: Text(
                        widget.doc!.name,
                        maxLines: () {
                          if (widget.type == CategoryCardType.long) {
                            return 1;
                          } else if (widget.type == CategoryCardType.short) {
                            return 2;
                          } else {
                            return 1;
                          }
                        }(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
