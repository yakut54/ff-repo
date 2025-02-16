import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/empty_list_component/empty_list_component_widget.dart';
import '/mobile/pages/home/articles/article/commnets/comment_block/comment_block_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'comments_bottom_sheet_model.dart';
export 'comments_bottom_sheet_model.dart';

class CommentsBottomSheetWidget extends StatefulWidget {
  const CommentsBottomSheetWidget({
    super.key,
    required this.articleDoc,
  });

  final ArticlesRecord? articleDoc;

  @override
  State<CommentsBottomSheetWidget> createState() =>
      _CommentsBottomSheetWidgetState();
}

class _CommentsBottomSheetWidgetState extends State<CommentsBottomSheetWidget> {
  late CommentsBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsBottomSheetModel());

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
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Комментарии',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: Color(0x281D2F33),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: StreamBuilder<ArticlesRecord>(
                  stream: ArticlesRecord.getDocument(
                      widget.articleDoc!.reference)
                    ..listen((listViewArticlesRecord) async {
                      if (_model.listViewPreviousSnapshot != null &&
                          !ArticlesRecordDocumentEquality().equals(
                              listViewArticlesRecord,
                              _model.listViewPreviousSnapshot)) {
                        if (listViewArticlesRecord
                                .comments.lastOrNull?.usersRef ==
                            currentUserReference) {
                          await _model.listViewController?.animateTo(
                            _model.listViewController!.position.maxScrollExtent,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.ease,
                          );

                          safeSetState(() {});
                          return;
                        } else {
                          safeSetState(() {});
                          return;
                        }

                        safeSetState(() {});
                      }
                      _model.listViewPreviousSnapshot = listViewArticlesRecord;
                    }),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 17.0, 0.0, 18.0),
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    final listViewArticlesRecord = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final comment =
                            listViewArticlesRecord.comments.toList();
                        if (comment.isEmpty) {
                          return Center(
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              child: EmptyListComponentWidget(
                                text: 'Комментариев пока нет',
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: comment.length,
                          itemBuilder: (context, commentIndex) {
                            final commentItem = comment[commentIndex];
                            return CommentBlockWidget(
                              key: Key(
                                  'Keyjmi_${commentIndex}_of_${comment.length}'),
                              comment: commentItem,
                              articleDoc: widget.articleDoc!,
                            );
                          },
                          controller: _model.listViewController,
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 32.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.textController',
                          Duration(milliseconds: 10),
                          () => safeSetState(() {}),
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Комментарий',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Akrobat',
                                    color: Color(0xFF969298),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDEDCDF),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF2D2830),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                        maxLines: 4,
                        minLines: 1,
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 24.0,
                      borderWidth: 1.0,
                      buttonSize: 58.0,
                      icon: Icon(
                        FFIcons.ksendComment,
                        color: Color(0xFF312D34),
                        size: 24.0,
                      ),
                      onPressed: (_model.textController.text == '')
                          ? null
                          : () async {
                              if (_model.textController.text != '') {
                                await widget.articleDoc!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'comments': FieldValue.arrayUnion([
                                        getCommentFirestoreData(
                                          createCommentStruct(
                                            createdTime: getCurrentTimestamp,
                                            text: _model.textController.text,
                                            usersRef: currentUserReference,
                                            name: currentUserDocument?.role !=
                                                    Role.guest
                                                ? 'Гость'
                                                : currentUserDisplayName,
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                safeSetState(() {
                                  _model.textController?.clear();
                                });
                                return;
                              } else {
                                return;
                              }
                            },
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
