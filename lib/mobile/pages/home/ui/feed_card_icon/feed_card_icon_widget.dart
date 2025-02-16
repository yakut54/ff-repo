import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'feed_card_icon_model.dart';
export 'feed_card_icon_model.dart';

class FeedCardIconWidget extends StatefulWidget {
  const FeedCardIconWidget({
    super.key,
    required this.feedCardIcon,
    required this.color,
    required this.size,
  });

  final FeedCardIcon? feedCardIcon;
  final Color? color;
  final double? size;

  @override
  State<FeedCardIconWidget> createState() => _FeedCardIconWidgetState();
}

class _FeedCardIconWidgetState extends State<FeedCardIconWidget> {
  late FeedCardIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedCardIconModel());

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
        if (widget.feedCardIcon == FeedCardIcon.cards) {
          return Icon(
            FFIcons.kcards,
            color: widget.color,
            size: widget.size,
          );
        } else if (widget.feedCardIcon == FeedCardIcon.wing) {
          return Icon(
            FFIcons.kwing,
            color: widget.color,
            size: widget.size,
          );
        } else if (widget.feedCardIcon == FeedCardIcon.calendar) {
          return Icon(
            FFIcons.kcalendar,
            color: widget.color,
            size: widget.size,
          );
        } else if (widget.feedCardIcon == FeedCardIcon.moon) {
          return Icon(
            FFIcons.kmoon,
            color: widget.color,
            size: widget.size,
          );
        } else if (widget.feedCardIcon == FeedCardIcon.whisper) {
          return Icon(
            FFIcons.kwhisper,
            color: widget.color,
            size: widget.size,
          );
        } else if (widget.feedCardIcon == FeedCardIcon.gift) {
          return Icon(
            FFIcons.kgift,
            color: widget.color,
            size: widget.size,
          );
        } else {
          return Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(),
          );
        }
      },
    );
  }
}
