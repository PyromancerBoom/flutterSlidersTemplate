import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Sliders';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int indexTop = 0;
  double valueBottom = 20;
  double value = 20;
  double value2 = 30;
  @override
  Widget build(BuildContext context) => SliderTheme(
    data: SliderThemeData(
      thumbColor: Colors.green,
      //overlayColor: Colors.green.shade200,
      valueIndicatorColor: Colors.green,

      /// track color
      activeTrackColor: Colors.green.shade200,
      inactiveTrackColor: Colors.black12,

      /// ticks in between
      activeTickMarkColor: Colors.blueGrey,
      inactiveTickMarkColor: Colors.blueGrey,

      trackHeight: 10,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(text: TextSpan(
          text: 'A slider with some ticks:',
          style: TextStyle(color: Colors.black, fontSize: 20),
        )),
        Slider(
          value: value,
          min: 0,
          max: 100,
          divisions: 5,
          label: value.round().toString(),
          onChanged: (value) => setState(() => this.value = value),
        ),
        const SizedBox(height: 30),
        RichText(text: TextSpan(
          text: 'Your typical slider:',
          style: TextStyle(color: Colors.black, fontSize: 20),
        )),
        Slider(
          value:value2,
          min: 0,
          max: 100,
          divisions: 100,
          activeColor: Colors.red,
          inactiveColor: Colors.red.shade100,
          label: value2.round().toString(),
          onChanged: (value2) => setState(() => this.value2 = value2),
        ),
        const SizedBox(height: 30),
        RichText(text: TextSpan(
          text: 'A disabled slider:',
          style: TextStyle(color: Colors.black, fontSize: 20),
        )),
        Slider(
          value: 45,
          min: 0,
          max: 100,
          divisions: 100,
          // label: value.round().toString(),
          onChanged: null,
        ),
        const SizedBox(height: 30),
        RichText(text: TextSpan(
          text: '...another with side labels:',
          style: TextStyle(color: Colors.black, fontSize: 20),
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSliderSideLabel(),
            const SizedBox(height: 16),
          ],
        ),
      ],
    ),
  );

  Widget buildSliderSideLabel() {
    final double min = 20;
    final double max = 90;
    final divisions = 20;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          buildSideLabel(min),
          Expanded(
            child: Slider(
              value: valueBottom,
              min: min,
              max: max,
              divisions: divisions,
              label: valueBottom.round().toString(),
              onChanged: (value) => setState(() => this.valueBottom = value),
            ),
          ),
          buildSideLabel(max),
        ],
      ),
    );
  }
  Widget buildSideLabel(double value) => Container(
    width: 25,
    child: Text(
      value.round().toString(),
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

}
