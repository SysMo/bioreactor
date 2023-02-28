import 'dart:async';

import 'log.dart';

class ControlAction {}

class ControlChannel<T, U extends ControlAction> with Logging {
  Stream<T> values;
  late StreamController<U> actionController;
  bool actionsPaused = false;
  bool actionsHasSubscription = false;

  ControlChannel(this.values) {
    actionController = StreamController<U>(
      onListen: () {
        actionsHasSubscription = true;
      },
      onPause: () {
        actionsPaused = true;
      },
      onResume: () {
        actionsPaused = false;
      },
      onCancel: () {
        actionsHasSubscription = false;
      },
    );
  }

  Stream<U> controlStream() {
    return actionController.stream;
  }

  bool dispatch(U event) {
    if (actionsHasSubscription && !actionsPaused) {
      actionController.add(event);
      return true;
    } else {
      return false;
    }
  }
}

class OnOffAction extends ControlAction {}

class OnOffControlChannel extends ControlChannel<bool, OnOffAction> {
  OnOffControlChannel(super.values);
}
