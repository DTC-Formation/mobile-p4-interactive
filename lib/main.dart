import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String text = 'Hello, World!';
  TextEditingController txtCtrl = TextEditingController();
  bool isChecked = false;
  double start = 10.0;
  double end = 80.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double minValue = 0.0;
    double maxValue = 100.0;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              height: height / 3,
              width: width,
              color: Colors.white,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      text = 'Tapped!';
                    });
                    print(text);
                  },
                  onDoubleTap: () {
                    setState(() {
                      text = 'Double Tapped!';
                    });
                    print(text);
                  },
                  child: Text(text)),
            ),
            TextField(
              controller: txtCtrl,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Texte a afficher',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  text = txtCtrl.text;
                });
                // ignore: avoid_print
                print(text);
              },
              child: const Text('Click me!'),
            ),
            Checkbox(
              value: isChecked, 
              onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
              print(isChecked);
            }),
            Text(isChecked.toString()),
            RangeSlider(
              min: 0.0,
              max: 100.0,
              values: RangeValues(minValue, maxValue), onChanged: (RangeValues values) {
                print(values);
              setState(() {
                minValue = values.start;
                maxValue = values.end;
              });
              print(values);
            }),

            Slider.adaptive(
              min: 0.0,
              max: 100.0,
              value: start, 
              secondaryTrackValue: end,
              secondaryActiveColor: Colors.red,
              onChanged: (double value) {
                setState(() {
                  start = value;
                });
                print(start);
              },
              onChangeEnd: (double value) {
                setState(() {
                  end = value;
                });
                print(end);
              },
              onChangeStart: (double value) {
                setState(() {
                  start = value;
                });
                print(start);
              },
            ),
            Text(start.floor().toString()),
            Visibility(child: Text('Visible'), visible: isChecked),
            InkWell(
                onTap: () {
                  setState(() {
                    text = 'Tapped!';
                  });
                  print(text);
                },
                child: Text(text)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            text = 'Hello, Flutter!';
          });
          print(text);
        },
        child: const Text('Click me!'),
      ),
    );
  }
}
