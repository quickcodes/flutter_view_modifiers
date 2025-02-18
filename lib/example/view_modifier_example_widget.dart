import 'package:flutter/material.dart';
import 'package:flutter_view_modifiers/flutter_view_modifiers.dart';

class ViewModifierExampleWidget extends StatefulWidget {
  const ViewModifierExampleWidget({super.key});

  @override
  State<ViewModifierExampleWidget>createState() => _TestViewModifier();
}

class _TestViewModifier extends State<ViewModifierExampleWidget> {
  double widgetOpacity = 1.0;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    color: Colors.grey, blurRadius: 5, offset: Offset(2, 2)),
              ],
            )
            .center(),

        50.0.height(),
        // height(20),

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
                    color: Colors.grey, blurRadius: 10, offset: Offset(2, 2)),
              ],
            )
            .offset(x: -15, y: 0)
            .margin(all: 20)
            .scale(1.2)
            .decorate(color:Colors.orange, borderRadius: 12,)
            .center()
            .animatedOpacity(opacity: widgetOpacity),

        // height(40),
        50.0.height(),

        // Using method chaining on ElevatedButton widget
        Row(
          children: [
            20.0.width(),
            const Text("Press Me")
                .textStyle(color: Colors.white, fontWeight: FontWeight.bold)
                .padding(vertical: 10, horizontal: 20)
                .decorate(color:Colors.red)
                .opacity(0.8)
                .decorate(
                    borderRadius: 10,
                    color: Colors.yellow.withOpacity(0.3),
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.black, blurRadius: 8, offset: Offset(0, 5)),
                    ],
                  )
                .onTap(
                // .onTapRipple( onTap:
                () {
                    setState(() {
                      if(widgetOpacity == 0.0) {
                        widgetOpacity = 1.0;
                      } else {
                        widgetOpacity = 0.0;
                      }
                    });
                  })
                .paddingOnly(left: 50)
                .rotate(0.2)
            ,
          ],
        )
        .padding(vertical: 40)
        .decorate(color: Colors.amber),
        
        
        const Text("Gradient Test")
            .gradientDecoratedPaddingCentered(),
        const Text("Gradient Test TWO")
            .gradientDecoratedPaddingCentered()
            .overlay(
                overlayWidget: const Icon(Icons.person).positioned(right: 0, left: 0, top: 0)
            ),

        const Text("Gradient Test")
            .background(
              backgroundWidget:
                50.0.size()
                  .decorate(color: Colors.pink)
        )

      ],
    );
  }
}



extension WidgetGradientDecorationPaddingCenter on Widget {
  Widget gradientDecoratedPaddingCentered() {
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