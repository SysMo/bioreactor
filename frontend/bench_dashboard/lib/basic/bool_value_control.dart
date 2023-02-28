import 'package:flutter/material.dart';
import 'package:bench_communication/channels.dart';
import 'led_indicator.dart';

class OnOffValueControl extends StatefulWidget {
  final String title;
  final OnOffControlChannel channel;

  const OnOffValueControl({
    super.key,
    required this.title,
    required this.channel,
  });

  @override
  State<OnOffValueControl> createState() => _OnOffValueControlState();
}

class _OnOffValueControlState extends State<OnOffValueControl> {
  double? measuredValue;
  double? targetValue;

  @override
  void initState() {
    super.initState();

    // widget.controlStream.listen((event) {
    //   setState(() {
    //     targetValue = event;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Text(
            widget.title,
            textScaleFactor: 1.5,
          ),
          StreamBuilder(
            stream: widget.channel.values,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              bool isOn = snapshot.data ?? false;
              return LedBulbIndicator(
                initialState: isOn ? LedBulbColors.green : LedBulbColors.off,
                glow: true,
                size: 50,
              );
            },
          ),
        ]));
  }
}
