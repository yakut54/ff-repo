import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'stories_viewer_widget.dart' show StoriesViewerWidget;
import 'package:flutter/material.dart';

class StoriesViewerModel extends FlutterFlowModel<StoriesViewerWidget> {
  ///  Local state fields for this component.

  int? currentIndex;

  List<StoriesRecord> docs = [];
  void addToDocs(StoriesRecord item) => docs.add(item);
  void removeFromDocs(StoriesRecord item) => docs.remove(item);
  void removeAtIndexFromDocs(int index) => docs.removeAt(index);
  void insertAtIndexInDocs(int index, StoriesRecord item) =>
      docs.insert(index, item);
  void updateDocsAtIndex(int index, Function(StoriesRecord) updateFn) =>
      docs[index] = updateFn(docs[index]);

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 5000;
  int timerMilliseconds = 5000;
  String timerValue = StopWatchTimer.getDisplayTime(5000);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    timerController.dispose();
  }
}
