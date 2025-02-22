import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:ready_me/button_control/GameController.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Key widgetKey = UniqueKey();
  final O3DController controller = O3DController(),
      controller2 = O3DController();
  FocusNode focusNode = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    focusNode.requestFocus();
  }

  void reloadModels() {
    setState(() {
      widgetKey = UniqueKey(); // Change the widget key to force a rebuild
    });
  }

  void handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey.keyLabel) {
        case 'W':
          controller.animationName = 'Running';
          break;
        case 'S':
          controller.animationName = 'Punch';
          break;
        case 'A':
          controller.animationName = 'Yes';
          break;
        case 'D':
          controller.animationName = 'No';
          break;
        case 'Arrow Up':
          controller2.animationName = 'Jump';
          break;
        case 'Arrow Down':
          controller2.animationName = 'Dance';
          break;
        case 'Arrow Left':
          controller2.animationName = 'Idle';
          break;
        case 'Arrow Right':
          controller2.animationName = 'Death';
          break;
        default:
          break;
      }
      setState(() {}); 
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = kIsWeb ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: KeyboardListener(
        focusNode: focusNode,
        onKeyEvent: handleKeyEvent,
        autofocus: true,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/background.jpeg', 
                      fit: BoxFit.cover, 
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: O3D(
                          key: widgetKey,
                          controller: controller,
                          src: 'assets/RobotExpressive.glb',
                          autoPlay: true,
                          animationName: 'Idle',
                          cameraControls: false,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: O3D(
                          key: widgetKey,
                          controller: controller2,
                          src: 'assets/RobotExpressive.glb',
                          autoPlay: true,
                          animationName: 'Idle',
                          cameraControls: false,
                        ),
                      ),
                    ],
                  ),
                  if (isDesktop)
                    ...[
                      const Positioned(
                        bottom: 20,
                        left: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Controller 1 Keys:'),
                            Text('W: Run'),
                            Text('S: Punch'),
                            Text('A: Yes'),
                            Text('D: No'),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: 20,
                        right: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Controller 2 Keys:'),
                            Text('Arrow Up: Jump'),
                            Text('Arrow Down: Dance'),
                            Text('Arrow Left: Idle'),
                            Text('Arrow Right: Death'),
                          ],
                        ),
                      ),
                    ]
                  else
                    ...[
                      Positioned(
                        bottom: 20,
                        left: 30,
                        child: GameController(
                          onUpPressed: () {
                            controller.animationName = 'Running';
                          },
                          onDownPressed: () {
                            controller.animationName = 'Punch';
                          },
                          onLeftPressed: () {
                            controller.animationName = 'Yes';
                          },
                          onRightPressed: () {
                            controller.animationName = 'No';
                          },
                          upText: 'Run',
                          downText: 'Punch',
                          leftText: 'Yes',
                          rightText: 'No',
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 30,
                        child: GameController(
                          onUpPressed: () {
                            controller2.animationName = 'Jump';
                          },
                          onDownPressed: () {
                            controller2.animationName = 'Dance';
                          },
                          onLeftPressed: () {
                            controller2.animationName = 'Idle';
                          },
                          onRightPressed: () {
                            controller2.animationName = 'Death';
                          },
                          upText: 'Jump',
                          downText: 'Dance',
                          leftText: 'Idle',
                          rightText: 'Death',
                        ),
                      ),
                    ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
