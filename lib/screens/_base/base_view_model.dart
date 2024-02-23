import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class UIActionMessage {
  final String guid = const Uuid().v1();
  final String message;

  UIActionMessage(this.message);
}

class UIActionResponse {
  final String messageGuid;

  UIActionResponse(this.messageGuid);
}

class NoResponse extends UIActionResponse {
  NoResponse() : super("");
}

bool printViewModelInitTimingsToConsole = true;

abstract class BaseViewModel with ChangeNotifier {
  bool _isBusy = true;
  bool _isDisposed = false;

  final StreamController<UIActionMessage> _uiActionController = StreamController();

  Stream<UIActionMessage> get onUIAction$ => _uiActionController.stream;

  final StreamController<UIActionResponse> _uiResponseController = StreamController.broadcast();

  Stream<UIActionResponse> get _onUIResponse$ => _uiResponseController.stream;

  FutureOr<void> _initState;

  FutureOr<void> get isInitializedAsync => _initState;

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  BaseViewModel({bool runInitAutomatically = true, Key key}) {
    if (runInitAutomatically) {
      load();
    }
  }

  FutureOr<void> init();

  void load() async {
    Stopwatch s = Stopwatch();
    s.start();
    _initState = init();
    await _initState;
    _isInitialized = true;
    s.stop();
    if (printViewModelInitTimingsToConsole && s.elapsedMilliseconds > 16) {
      debugPrint("${toString()} init time : ${s.elapsedMilliseconds} ms");
    }
    isBusy = false;
  }

  bool get isBusy => _isBusy;

  set isBusy(bool value) {
    _isBusy = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }

  refreshState() {
    if (!isBusy) notifyListeners();
  }

  void runWithProgressOvelay(Future Function() action) async {
    try {
      isBusy = true;
      await action();
    } catch (e) {
      rethrow;
    } finally {
      isBusy = false;
    }
  }

  @protected
  void triggerUIAction(UIActionMessage message) {
    _uiActionController.add(message);
  }

  @protected
  Future<T> triggerUIActionAsync<T extends UIActionResponse>(UIActionMessage message) async {
    _uiActionController.add(message);
    var response = await _onUIResponse$.firstWhere((r) => r.messageGuid == message.guid);
    return response as T;
  }

  void setResponse(UIActionResponse response) {
    _uiResponseController.add(response);
  }

  @override
  void dispose() {
    _uiResponseController.close();
    _uiActionController.close();
    _isDisposed = true;
    super.dispose();
  }
}
