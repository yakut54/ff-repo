import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/articles/horoscope/horoscope_block/horoscope_block_widget.dart';
import 'package:flutter/material.dart';
import 'horoscope_blocks_viewer_model.dart';
export 'horoscope_blocks_viewer_model.dart';

class HoroscopeBlocksViewerWidget extends StatefulWidget {
  const HoroscopeBlocksViewerWidget({
    super.key,
    required this.blockList,
  });

  final List<HoroscopeBlockStruct>? blockList;

  @override
  State<HoroscopeBlocksViewerWidget> createState() =>
      _HoroscopeBlocksViewerWidgetState();
}

class _HoroscopeBlocksViewerWidgetState
    extends State<HoroscopeBlocksViewerWidget> {
  late HoroscopeBlocksViewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoroscopeBlocksViewerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final horoscope = widget.blockList!.toList();

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(horoscope.length, (horoscopeIndex) {
            final horoscopeItem = horoscope[horoscopeIndex];
            return HoroscopeBlockWidget(
              key: Key('Keyj1t_${horoscopeIndex}_of_${horoscope.length}'),
              block: horoscopeItem,
            );
          }).divide(SizedBox(height: 24.0)),
        );
      },
    );
  }
}
