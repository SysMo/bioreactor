import 'dart:async';

import 'package:bench_core/src/log.dart';
import 'measurement_channel.dart';

class ControlAction {}

class ControlChannel<T, U extends ControlAction> with Logging {
  MeasurementChannel<T> measurementChannel;
  late StreamController<U> actionController;
  bool actionsPaused = false;
  bool actionsHasSubscription = false;

  ControlChannel(this.measurementChannel) {
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
