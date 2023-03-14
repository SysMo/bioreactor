import 'package:bench_core/mqtt.dart';
import 'package:bench_core/src/named_tree.dart';

enum ChannelDirection { forward, reverse }

abstract class CommunicationInterface {}

class SendingEnd extends CommunicationInterface {
  Stream<String> encodedStream;
  SendingEnd(this.encodedStream);
}

class ReceivingEnd extends CommunicationInterface {
  Function(Stream<String> encodedStream) streamSetter;
  ReceivingEnd(this.streamSetter);
}

class InterfaceGroup extends CommunicationInterface {}

typedef ChannelTree = TreeNode<CommunicationInterface>;

abstract class ChannelBus {
  static TreeBranch<CommunicationInterface> empty(String id) {
    return TreeBranch<CommunicationInterface>.empty(
        id: id, props: InterfaceGroup());
  }

  List<ChannelBus> get children;
  String get busId;

  ChannelTree deviceSideTree() {
    var tree = ChannelBus.empty(busId);
    for (var child in children) {
      tree = tree.add(child.deviceSideTree());
    }
    return tree;
  }

  ChannelTree controlSideTree() {
    var tree = ChannelBus.empty(busId);
    for (var child in children) {
      tree = tree.add(child.controlSideTree());
    }
    return tree;
  }
}

class NotConnectedError implements Exception {
  String channelId;
  NotConnectedError(this.channelId);
}

class AlreadyConnectedError implements Exception {
  String channelId;
  AlreadyConnectedError(this.channelId);
}
