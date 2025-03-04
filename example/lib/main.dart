import 'package:flutter/material.dart';
import 'package:flutter_view_modifiers/flutter_view_modifiers.dart';

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
      home: const ViewModifierExampleWidget(),
    );
  }
}

class ViewModifierExampleWidget extends StatefulWidget {
  const ViewModifierExampleWidget({super.key});

  @override
  State<ViewModifierExampleWidget> createState() => _TestViewModifier();
}

class _TestViewModifier extends State<ViewModifierExampleWidget> {
  double widgetOpacity = 1.0;
  @override
  void initState() {
    super.initState();
  }

  durationAndNumExtensionsDemo() async {
    print('---------------------------------------');
    print('---------------------------------------');
    print('-------------Duration & Num-------------');
    print('---------------------------------------');
    print('---------------------------------------');
    print('+ wait for 2 seconds');
    await 2.delay();
    print('- 2 seconds completed');

    print('+ callback in 1.2sec');
    1.2.delay(() => print('- 1.2sec callback called'));

    // Duration shortcuts
    print(1.seconds + 200.milliseconds);
    print(1.hours + 30.minutes);
    print(1.5.hours);

    // Number comparisons
    print(5.isLowerThan(4)); // false
    print(5.isGreaterThan(4)); // true
    print(5.isEqual(4)); // false

    // Simple readable duration
    print(90.minutes.readable); // "1h 30m"

    // Chunked duration
    print(7.seconds.chunked(2.seconds)); // [2s, 2s, 2s]

    // Comparisons
    print(5.seconds.isShorterThan(10.seconds)); // true
    print(5.seconds.isLongerThan(2.seconds)); // true

    // Sleep inline
    await 2.seconds.sleep();

    // Throttle a callback
    2.seconds.throttle(() => print('Throttled!'));

    // Debounce a callback
    1.seconds.debounce(() => print('Debounced!'));
  }

  dateTimeExtensionsDemo() {
    print('---------------------------------------');
    print('---------------------------------------');
    print('-------------Date & Time-------------');
    print('---------------------------------------');
    print('---------------------------------------');
    final now = DateTime.now();

    // Check day types
    print(now.isWeekend); // true/false
    print(now.isWeekday); // true/false
    print(now.isToday); // true
    print(now.isYesterday); // false

    // Date shifting
    print(now.addDays(5)); // 5 days later
    print(now.subtractHours(3)); // 3 hours ago

    // Formatting
    print(now.format('dd/MM/yyyy')); // e.g., 02/03/2025

    // Relative time
    print(now.subtractHours(2).relativeTime); // "2 hours ago"

    // Start and end of periods
    print(now.startOfDay); // Today at 00:00
    print(now.endOfMonth); // Last second of the month

    // Difference
    print(now
        .differenceInDays(DateTime.now().subtract(Duration(days: 10)))); // 10

    // ISO with milliseconds
    print(now.toIso8601WithMilliseconds);
  }

  stringExtensionsDemo() {
    final email = "test@example.com";
    print(email.isValidEmail); // true

    final name = "john doe";
    print(name.capitalize); // John doe
    print(name.titleCase); // John Doe

    final number = "123abc";
    print(number.digitsOnly); // 123

    final json = '{"key": "value"}';
    print(json.toBase64); // eyJrZXkiOiAidmFsdWUifQ==

    print("base64".toBase64); // YmFzZTY0
    print("YmFzZTY0".fromBase64); // base64

    print("This is too long text".ellipsize(10)); // This is...

    print("hello-world".toCamelCase); // HelloWorld

    print("flutter".reversed); // rettulf

    print("123".toInt()); // 123
    print("abc".toInt(fallback: 10)); // 10

    print("www.example.com".withPrefix("https://")); // https://www.example.com

    print("flutter".surround(left: "<", right: ">")); // <flutter>
  }

  @override
  Widget build(BuildContext context) {
    // durationAndNumExtensionsDemo();
    // dateTimeExtensionsDemo();
    stringExtensionsDemo();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Using method chaining on Text widget with more modifiers
            const Text("Hello, Flutter!")
                .textStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.0,
                  decoration: TextDecoration.underline,
                )
                .padding(all: 10)
                .decorate(
              color: Colors.blue,
              borderRadius: 20,
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ],
            ).center(),

            50.0.heightBox(), // SizedBox of height 50

            // Using method chaining on Container widget
            const Text("This is a container")
                .padding(all: 20)
                .decorate(
                  color: Colors.green.withOpacity(0.7),
                  borderRadius: 12,
                  borderColor: Colors.black,
                  borderWidth: 2,
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(2, 2)),
                  ],
                )
                .offset(x: -15, y: 0)
                .margin(all: 20)
                .scale(1.2)
                .decorate(
                  color: Colors.orange,
                  borderRadius: 12,
                )
                .center()
                .animatedOpacity(opacity: widgetOpacity),

            // Using method chaining on ElevatedButton widget
            Row(
              children: [
                20.0.widthBox(),
                const Text("Press Me")
                    .textStyle(color: Colors.white, fontWeight: FontWeight.bold)
                    .padding(vertical: 10, horizontal: 20)
                    .decorate(color: Colors.red)
                    .opacity(0.8)
                    .decorate(
                      borderRadius: 10,
                      color: Colors.yellow,
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black,
                            blurRadius: 8,
                            offset: Offset(0, 5)),
                      ],
                    )
                    .onTap(() {
                      setState(() {
                        if (widgetOpacity == 0.0) {
                          widgetOpacity = 1.0;
                        } else {
                          widgetOpacity = 0.0;
                        }
                      });
                    })
                    .paddingOnly(left: 50)
                    .rotate(0.2),
              ],
            ).padding(vertical: 40).decorate(color: Colors.amber),

            Text("Gradient Test").gradientButton(),
            const Text("Gradient Test TWO").gradientButton().overlay(
                  overlayWidget: const Icon(Icons.person)
                      .positioned(right: 0, left: 0, top: 0),
                ),

            const Text("Gradient Test").background(
                backgroundWidget: 50.0.sizeBox().decorate(color: Colors.pink)),

            const Text("Press Me With Bounce")
                .textStyle(color: Colors.white, fontWeight: FontWeight.bold)
                .padding(vertical: 10, horizontal: 20)
                .decorate(
                  borderRadius: 10,
                  color: Colors.blueAccent,
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.black,
                        blurRadius: 8,
                        offset: Offset(0, 5)),
                  ],
                )
                .center()
                .onTapBounce(onTap: () {
                  setState(() {
                    // if (widgetOpacity == 0.0) {
                    //   widgetOpacity = 1.0;
                    // } else {
                    //   widgetOpacity = 0.0;
                    // }
                  });
                }),

            Column(
              children: [
                Text("Foo"),
                Text("Bar"),
                Text("Bam"),
              ].separator(
                Row(
                  children: [
                    Divider().expanded(),
                    Text("Divider"),
                    Divider().expanded(),
                  ],
                ),
              ),
            ).rotate(25).decorate(color: Colors.deepPurpleAccent),

            Row(
              children: [
                Text("Foo"),
                Text("Bar"),
                Text("Bam"),
              ].separator(Divider().expanded()),
            ).withSize(width: MediaQuery.of(context).size.width),
          ].separator(20.0.heightBox()),
        ),
      ),
    );
  }
}

extension GradientButton on Widget {
  Widget gradientButton() {
    return textStyle(color: Colors.white, fontWeight: FontWeight.w400)
        .padding(all: 20)
        .decorate(
          gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
          borderRadius: 12,
          borderColor: Colors.black,
          borderWidth: 2,
          boxShadow: [
            const BoxShadow(
                color: Colors.grey, blurRadius: 10, offset: Offset(2, 2)),
          ],
        )
        .paddingOnly(top: 10)
        .center();
  }
}
