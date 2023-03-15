import 'package:bench_core/channels.dart';
import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

typedef StateUpdateFn = void Function(void Function());

mixin HasValues {
  List<Value> values = [];

  void connect(List<MeasurementControlConnector> connectors,
      StateUpdateFn stateUpdateFn) {
    void connectingFn(MeasurementControlConnector connector) {
      var index = values.length;
      values.add("N/A");
      connector.setOnValue((v) {
        stateUpdateFn(() {
          values[index] = v;
        });
      });
    }

    for (var connector in connectors) {
      connectingFn(connector);
    }
  }

  void disconnect(List<MeasurementControlConnector> connectors) {
    for (var connector in connectors) {
      connector.dispose();
    }
  }
}

class StatusOverwiew extends StatefulWidget {
  final List<MeasurementControlConnector> connectors;
  const StatusOverwiew({super.key, required this.connectors});

  @override
  State<StatusOverwiew> createState() => _StatusOverwiewState();
}

class _StatusOverwiewState extends State<StatusOverwiew> with HasValues {
  @override
  void initState() {
    super.initState();
    connect(widget.connectors, setState);
  }

  @override
  void dispose() {
    disconnect(widget.connectors);
    super.dispose();
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
    var connector = widget.connectors[index];
    String valueText =
        connector.formatter?.formatObject(value) ?? value.toString();
    String description = connector.label ?? "Value";
    String unitStr = (connector.unit != null) ? "[${connector.unit}]" : "";
    String label = "$description $unitStr";

    List<Widget> children = [Text(label), Text(valueText)].map((child) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Center(child: child),
      );
    }).toList();

    return TableRow(children: children);
  }
}
