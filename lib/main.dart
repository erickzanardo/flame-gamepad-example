import 'package:flame/flame.dart';
import 'package:flame/position.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'game.dart';

MyGame game = new MyGame();

main() async {
  Flame.audio.disableLog();
  Flame.util.fullScreen();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

  Flame.gamepad.addListener((String evtType, String key) {
    if (evtType == GAMEPAD_BUTTON_UP) {
      game.setPressedKey(null);
    } else {
      game.setPressedKey(key);
    }
  });

  runApp(new MaterialApp(
    routes: {
      '/': (BuildContext ctx) => new Scaffold(body: new WillPopScope(
        onWillPop: () async {
          game.pause();
          return false;
        },
        child: game.widget,
      )),
    },
  ));
}

