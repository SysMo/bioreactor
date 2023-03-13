import 'package:bench_core/src/named_tree.dart';

import 'codec.dart';
import 'channel_bus.dart';

abstract class StreamChannel<V> {
  String id;
  Stream<V>? _valueStream;
  Stream<V> get valueStream =>
      _valueStream?.asBroadcastStream() ?? (throw NotConnectedError(id));

  StreamChannel({required this.id, Stream<V>? valueStream})
      : _valueStream = valueStream;

  void connect(Stream<V> valueStream) {
    if (_valueStream == null) {
      _valueStream = valueStream;
    } else {
      throw AlreadyConnectedError(id);
    }
  }

  TreeNode<CommunicationInterface> sendingNode() {
    var codec = StringCodecRegistry.getCodec<V>();
    var valueStream = this.valueStream;
    return TreeLeaf(
      id: id,
      props: SendingEnd(valueStream.map((v) => codec.encode(v))),
    );
  }

  TreeNode<CommunicationInterface> receivingNode() {
    var codec = StringCodecRegistry.getCodec<V>();
    return TreeLeaf(
        id: id,
        props: ReceivingEnd((encodedStream) {
          _valueStream = encodedStream.map((data) {
            return codec.decode(data);
          });
        }));
  }
}

class ForwardStreamChannel<V> extends StreamChannel<V> implements ChannelBus {
  ForwardStreamChannel({required super.id, super.valueStream});

  @override
  ChannelTree deviceSideTree() {
    return sendingNode();
  }

  @override
  ChannelTree controlSideTree() {
    return receivingNode();
  }

  @override
  // Not to be used, only for channel groups
  String get busId => throw UnimplementedError();

  @override
  // Not to be used, only for channel groups
  List<ChannelBus> get children => throw UnimplementedError();
}

class ReverseStreamChannel<V> extends StreamChannel<V> implements ChannelBus {
  ReverseStreamChannel({required super.id, super.valueStream});
  @override
  ChannelTree deviceSideTree() {
    return receivingNode();
  }

  @override
  ChannelTree controlSideTree() {
    return sendingNode();
  }

  @override
  // Not to be used, only for channel groups
  String get busId => throw UnimplementedError();

  @override
  // Not to be used, only for channel groups
  List<ChannelBus> get children => throw UnimplementedError();
}
