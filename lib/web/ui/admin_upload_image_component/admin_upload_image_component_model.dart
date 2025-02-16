import '/flutter_flow/flutter_flow_util.dart';
import 'admin_upload_image_component_widget.dart'
    show AdminUploadImageComponentWidget;
import 'package:flutter/material.dart';

class AdminUploadImageComponentModel
    extends FlutterFlowModel<AdminUploadImageComponentWidget> {
  ///  Local state fields for this component.

  bool isUploading = false;

  String? image;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
