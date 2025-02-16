import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_otp')) {
        try {
          final serializedData = prefs.getString('ff_otp') ?? '{}';
          _otp = OtpStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _anonymousId = prefs.getString('ff_anonymousId') ?? _anonymousId;
    });
    _safeInit(() {
      _sub = prefs.getBool('ff_sub') ?? _sub;
    });
    _safeInit(() {
      _lastAppStartedEventSent = prefs.containsKey('ff_lastAppStartedEventSent')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastAppStartedEventSent')!)
          : _lastAppStartedEventSent;
    });
    _safeInit(() {
      _isFirstInstall = prefs.getBool('ff_isFirstInstall') ?? _isFirstInstall;
    });
    _safeInit(() {
      _isNewSplashShow1A =
          prefs.getBool('ff_isNewSplashShow1A') ?? _isNewSplashShow1A;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  OtpStruct _otp = OtpStruct();
  OtpStruct get otp => _otp;
  set otp(OtpStruct value) {
    _otp = value;
    prefs.setString('ff_otp', value.serialize());
  }

  void updateOtpStruct(Function(OtpStruct) updateFn) {
    updateFn(_otp);
    prefs.setString('ff_otp', _otp.serialize());
  }

  bool _hasVPN = false;
  bool get hasVPN => _hasVPN;
  set hasVPN(bool value) {
    _hasVPN = value;
  }

  bool _hasInternet = false;
  bool get hasInternet => _hasInternet;
  set hasInternet(bool value) {
    _hasInternet = value;
  }

  String _anonymousId = '';
  String get anonymousId => _anonymousId;
  set anonymousId(String value) {
    _anonymousId = value;
    prefs.setString('ff_anonymousId', value);
  }

  String _shareId = '';
  String get shareId => _shareId;
  set shareId(String value) {
    _shareId = value;
  }

  AppInfoStruct _appInfo = AppInfoStruct();
  AppInfoStruct get appInfo => _appInfo;
  set appInfo(AppInfoStruct value) {
    _appInfo = value;
  }

  void updateAppInfoStruct(Function(AppInfoStruct) updateFn) {
    updateFn(_appInfo);
  }

  String _countryCode = '';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
  }

  bool _sub = false;
  bool get sub => _sub;
  set sub(bool value) {
    _sub = value;
    prefs.setBool('ff_sub', value);
  }

  bool _enableInternetChecker = false;
  bool get enableInternetChecker => _enableInternetChecker;
  set enableInternetChecker(bool value) {
    _enableInternetChecker = value;
  }

  bool _enableVpnChecker = false;
  bool get enableVpnChecker => _enableVpnChecker;
  set enableVpnChecker(bool value) {
    _enableVpnChecker = value;
  }

  DateTime? _lastAppStartedEventSent =
      DateTime.fromMillisecondsSinceEpoch(946729080000);
  DateTime? get lastAppStartedEventSent => _lastAppStartedEventSent;
  set lastAppStartedEventSent(DateTime? value) {
    _lastAppStartedEventSent = value;
    value != null
        ? prefs.setInt(
            'ff_lastAppStartedEventSent', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastAppStartedEventSent');
  }

  bool _isFirstInstall = true;
  bool get isFirstInstall => _isFirstInstall;
  set isFirstInstall(bool value) {
    _isFirstInstall = value;
    prefs.setBool('ff_isFirstInstall', value);
  }

  NewSplashStruct _NewSplash = NewSplashStruct.fromSerializableMap(jsonDecode(
      '{\"image\":\"https://firebasestorage.googleapis.com/v0/b/test-5-81007.appspot.com/o/5000rub.png?alt=media&token=b6d8db6f-25a3-4a73-a74c-4a5a9d0d993f\",\"text\":\"state text\",\"title\":\"state title\",\"btn_text\":\"state btn text\",\"link\":\"state link\",\"is_visible\":\"true\",\"create_date\":\"1736142300000\"}'));
  NewSplashStruct get NewSplash => _NewSplash;
  set NewSplash(NewSplashStruct value) {
    _NewSplash = value;
  }

  void updateNewSplashStruct(Function(NewSplashStruct) updateFn) {
    updateFn(_NewSplash);
  }

  bool _isNewSplashShow1A = false;
  bool get isNewSplashShow1A => _isNewSplashShow1A;
  set isNewSplashShow1A(bool value) {
    _isNewSplashShow1A = value;
    prefs.setBool('ff_isNewSplashShow1A', value);
  }

  bool _isNewVersionArticleBlock = false;
  bool get isNewVersionArticleBlock => _isNewVersionArticleBlock;
  set isNewVersionArticleBlock(bool value) {
    _isNewVersionArticleBlock = value;
  }

  List<SuggestionStateStruct> _SuggestionState = [];
  List<SuggestionStateStruct> get SuggestionState => _SuggestionState;
  set SuggestionState(List<SuggestionStateStruct> value) {
    _SuggestionState = value;
  }

  void addToSuggestionState(SuggestionStateStruct value) {
    SuggestionState.add(value);
  }

  void removeFromSuggestionState(SuggestionStateStruct value) {
    SuggestionState.remove(value);
  }

  void removeAtIndexFromSuggestionState(int index) {
    SuggestionState.removeAt(index);
  }

  void updateSuggestionStateAtIndex(
    int index,
    SuggestionStateStruct Function(SuggestionStateStruct) updateFn,
  ) {
    SuggestionState[index] = updateFn(_SuggestionState[index]);
  }

  void insertAtIndexInSuggestionState(int index, SuggestionStateStruct value) {
    SuggestionState.insert(index, value);
  }

  List<ArticlesStateTypeStruct> _ArticlesState = [];
  List<ArticlesStateTypeStruct> get ArticlesState => _ArticlesState;
  set ArticlesState(List<ArticlesStateTypeStruct> value) {
    _ArticlesState = value;
  }

  void addToArticlesState(ArticlesStateTypeStruct value) {
    ArticlesState.add(value);
  }

  void removeFromArticlesState(ArticlesStateTypeStruct value) {
    ArticlesState.remove(value);
  }

  void removeAtIndexFromArticlesState(int index) {
    ArticlesState.removeAt(index);
  }

  void updateArticlesStateAtIndex(
    int index,
    ArticlesStateTypeStruct Function(ArticlesStateTypeStruct) updateFn,
  ) {
    ArticlesState[index] = updateFn(_ArticlesState[index]);
  }

  void insertAtIndexInArticlesState(int index, ArticlesStateTypeStruct value) {
    ArticlesState.insert(index, value);
  }

  List<RubricsStateTypeStruct> _RubricsState = [];
  List<RubricsStateTypeStruct> get RubricsState => _RubricsState;
  set RubricsState(List<RubricsStateTypeStruct> value) {
    _RubricsState = value;
  }

  void addToRubricsState(RubricsStateTypeStruct value) {
    RubricsState.add(value);
  }

  void removeFromRubricsState(RubricsStateTypeStruct value) {
    RubricsState.remove(value);
  }

  void removeAtIndexFromRubricsState(int index) {
    RubricsState.removeAt(index);
  }

  void updateRubricsStateAtIndex(
    int index,
    RubricsStateTypeStruct Function(RubricsStateTypeStruct) updateFn,
  ) {
    RubricsState[index] = updateFn(_RubricsState[index]);
  }

  void insertAtIndexInRubricsState(int index, RubricsStateTypeStruct value) {
    RubricsState.insert(index, value);
  }

  List<CommentStateTypeStruct> _CommentState = [];
  List<CommentStateTypeStruct> get CommentState => _CommentState;
  set CommentState(List<CommentStateTypeStruct> value) {
    _CommentState = value;
  }

  void addToCommentState(CommentStateTypeStruct value) {
    CommentState.add(value);
  }

  void removeFromCommentState(CommentStateTypeStruct value) {
    CommentState.remove(value);
  }

  void removeAtIndexFromCommentState(int index) {
    CommentState.removeAt(index);
  }

  void updateCommentStateAtIndex(
    int index,
    CommentStateTypeStruct Function(CommentStateTypeStruct) updateFn,
  ) {
    CommentState[index] = updateFn(_CommentState[index]);
  }

  void insertAtIndexInCommentState(int index, CommentStateTypeStruct value) {
    CommentState.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
