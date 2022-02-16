import 'package:flutter/material.dart';
import 'package:hermes_app/states/windows_state.dart';
import 'package:provider/provider.dart';

import 'package:hermes_app/Windows/ui/widgets/card_window.dart';
import 'package:hermes_app/widgets/floating_action_button.dart';
import 'package:hermes_app/Windows/ui/screens/windows_header.dart';

class WindowList extends StatefulWidget {
  const WindowList({Key? key}) : super(key: key);

  @override
  State createState() {
    return _WindowList();
  }
}

class _WindowList extends State<WindowList> {
  ScrollController controller = ScrollController();
  double topContainer = 0;
  bool closeTopContainer = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 250;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  void onPressAction() {}

  @override
  Widget build(BuildContext context) {
    var arrayWidget = context.watch<WindowProvider>().windows;
    print(arrayWidget.length);
    return Stack(children: <Widget>[
      Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.builder(
                controller: controller,
                itemCount: arrayWidget.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  double scale = 1;
                  if (topContainer > 0.2) {
                    scale = index + 0.2 - topContainer;
                    if (scale <= 0.2) {
                      scale = 0;
                    } else if (scale > 1) {
                      scale = 1;
                    }
                  }
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: scale,
                    child: Transform(
                      transform: Matrix4.identity()..scale(scale, scale),
                      alignment: Alignment.bottomCenter,
                      child: Align(
                          heightFactor: 1.1,
                          alignment: Alignment.topCenter,
                          child: CardWindow(
                            windows: arrayWidget[index],
                          )),
                    ),
                  );
                }),
          ),
        ],
      ),
      const WindowsHeader(),
    ]);

    /*
    return Stack(
      //alignment: const Alignment(0.9,0.95),
      children: <Widget>[
        ListView(
          //controller: ,
          padding: EdgeInsets.only(top: 250.0),
          children: const <Widget>[
            CardWindow(),
            CardWindow(),
            CardWindow(),
            CardWindow(),
            CardWindow(),
          ],
        ),
        const WindowsHeader(),
        Positioned(
          right: 20.0,
          bottom: 20.0,
          child: FloatingActionButtonCustom(
              color: const Color(0xFF7C01FF),
              iconData: Icons.add,
              onPressed: onPressAction),
        ),
      ],
    );*/
  }
}

/*
Expanded(
child: ListView.builder(
controller: controller,
itemCount: itemsData.length,
physics: BouncingScrollPhysics(),
itemBuilder: (context, index) {
double scale = 1.0;
if (topContainer > 0.5) {
scale = index + 0.5 - topContainer;
if (scale < 0) {
scale = 0;
} else if (scale > 1) {
scale = 1;
}
}
return Opacity(
opacity: scale,
child: Transform(
transform:  Matrix4.identity()..scale(scale,scale),
alignment: Alignment.bottomCenter,
child: Align(
heightFactor: 0.7,
alignment: Alignment.topCenter,
child: itemsData[index]),
),
);
}));*/
