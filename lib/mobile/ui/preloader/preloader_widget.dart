import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'preloader_model.dart';
export 'preloader_model.dart';

class PreloaderWidget extends StatefulWidget {
  const PreloaderWidget({
    super.key,
    required this.namePreloader,
    required this.size,
  });

  final String? namePreloader;
  final double? size;

  @override
  State<PreloaderWidget> createState() => _PreloaderWidgetState();
}

class _PreloaderWidgetState extends State<PreloaderWidget> {
  late PreloaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreloaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return custom_widgets.PreloaderCustomWidget(
      width: 180.0,
      height: 90.0,
      size: widget.size!,
      namePreloader: widget.namePreloader!,
    );
  }
}
