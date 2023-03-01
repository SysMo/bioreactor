import 'dart:async';

import 'package:bench_core/channels.dart';
import 'package:bench_core/messages.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

mixin HasSubscriptions {
  List<StreamSubscription<Value>> subscriptions = [];
  List<Value> values = [];

  void Function(void Function())? onSubscriptionValue;

  void subscribe(
    Stream<Value> stream,
  ) {
    int i = subscriptions.length;
    values.add(const Value.none());
    subscriptions.add(stream.listen((value) {
      if (onSubscriptionValue != null) {
        onSubscriptionValue!(() {
          values[i] = value;
        });
      }
    }));
  }

  void cancelAllSubscriptions() {
    for (var sub in subscriptions) {
      sub.cancel();
    }
  }
}

class StatusOverwiew extends StatefulWidget {
  final List<MeasurementChannel> channels;
  const StatusOverwiew({super.key, required this.channels});

  @override
  State<StatusOverwiew> createState() => _StatusOverwiewState();
}

class _StatusOverwiewState extends State<StatusOverwiew> with HasSubscriptions {
  @override
  void initState() {
    super.initState();
    for (var channel in widget.channels) {
      subscribe(channel.values);
    }
    onSubscriptionValue = setState;
  }

  @override
  void dispose() {
    super.dispose();
    cancelAllSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const {
        0: FractionColumnWidth(0.7),
        1: FractionColumnWidth(0.3),
      },
      children: values
          .mapIndexed(
            (index, value) => buildRow(index, value),
          )
          .toList(),
    );
  }

  TableRow buildRow(int index, Value value) {
    String valueText =
        widget.channels[index].formatter?.format(value) ?? value.toString();
    String description = widget.channels[index].label ?? "Value";
    String unit = (widget.channels[index].unit ?? "");
    String label = "$description [$unit]";

    List<Widget> children = [Text(label), Text(valueText)].map((child) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Center(child: child),
      );
    }).toList();

    return TableRow(children: children);
  }
}
