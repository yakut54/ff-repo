import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/articles/horoscope/horoscope_blocks_viewer/horoscope_blocks_viewer_widget.dart';
import 'horoscope_view_widget.dart' show HoroscopeViewWidget;
import 'package:flutter/material.dart';

class HoroscopeViewModel extends FlutterFlowModel<HoroscopeViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for HoroscopeBlocksViewer component.
  late HoroscopeBlocksViewerModel horoscopeBlocksViewerModel;

  @override
  void initState(BuildContext context) {
    horoscopeBlocksViewerModel =
        createModel(context, () => HoroscopeBlocksViewerModel());
  }

  @override
  void dispose() {
    horoscopeBlocksViewerModel.dispose();
  }
}
