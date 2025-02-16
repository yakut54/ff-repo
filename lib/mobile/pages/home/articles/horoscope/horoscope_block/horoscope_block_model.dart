import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/articles/horoscope/zodiac_icon/zodiac_icon_widget.dart';
import '/mobile/pages/home/articles/horoscope/zodiac_image_container/zodiac_image_container_widget.dart';
import 'horoscope_block_widget.dart' show HoroscopeBlockWidget;
import 'package:flutter/material.dart';

class HoroscopeBlockModel extends FlutterFlowModel<HoroscopeBlockWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ZodiacImageContainer component.
  late ZodiacImageContainerModel zodiacImageContainerModel;
  // Model for ZodiacIcon component.
  late ZodiacIconModel zodiacIconModel1;
  // Model for ZodiacIcon component.
  late ZodiacIconModel zodiacIconModel2;
  // Model for ZodiacIcon component.
  late ZodiacIconModel zodiacIconModel3;

  @override
  void initState(BuildContext context) {
    zodiacImageContainerModel =
        createModel(context, () => ZodiacImageContainerModel());
    zodiacIconModel1 = createModel(context, () => ZodiacIconModel());
    zodiacIconModel2 = createModel(context, () => ZodiacIconModel());
    zodiacIconModel3 = createModel(context, () => ZodiacIconModel());
  }

  @override
  void dispose() {
    zodiacImageContainerModel.dispose();
    zodiacIconModel1.dispose();
    zodiacIconModel2.dispose();
    zodiacIconModel3.dispose();
  }
}
