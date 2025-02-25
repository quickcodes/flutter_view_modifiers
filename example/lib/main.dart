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

  @override
  Widget build(BuildContext context) {
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

            50.0.height(), // SizedBox of height 50

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
                20.0.width(),
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
                backgroundWidget: 50.0.size().decorate(color: Colors.pink)),

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
          ].separator(20.0.height()),
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
