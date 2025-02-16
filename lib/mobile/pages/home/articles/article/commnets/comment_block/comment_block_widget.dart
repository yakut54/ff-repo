import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'comment_block_model.dart';
export 'comment_block_model.dart';

class CommentBlockWidget extends StatefulWidget {
  const CommentBlockWidget({
    super.key,
    required this.comment,
    required this.articleDoc,
  });

  final CommentStruct? comment;
  final ArticlesRecord? articleDoc;

  @override
  State<CommentBlockWidget> createState() => _CommentBlockWidgetState();
}

class _CommentBlockWidgetState extends State<CommentBlockWidget> {
  late CommentBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentBlockModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<UsersRecord>(
            future: UsersRecord.getDocumentOnce(widget.comment!.usersRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 21.0,
                    height: 21.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0x00B47C73),
                      ),
                    ),
                  ),
                );
              }

              final textUsersRecord = snapshot.data!;

              return Text(
                textUsersRecord.role != Role.guest
                    ? textUsersRecord.displayName
                    : 'Гость',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Akrobat',
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
              );
            },
          ),
          Flexible(
            child: Text(
              widget.comment!.text,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Akrobat',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Flexible(
            child: Text(
              dateTimeFormat(
                "d.M.y H:mm",
                widget.comment!.createdTime!,
                locale: FFLocalizations.of(context).languageCode,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Akrobat',
                    color: Color(0xFF59555C),
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
