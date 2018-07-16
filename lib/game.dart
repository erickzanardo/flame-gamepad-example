import 'dart:ui';
import 'dart:async';

import 'package:ordered_set/ordered_set.dart';
import 'package:flame/components/component.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';

import 'package:flame/game.dart';
import 'dart:ui' as ui show Color, Paint;

ui.Color black = const ui.Color(0xFF000000);

ui.Color tone1 = const ui.Color(0xFF9BBC0F);
ui.Paint pTone1 = new ui.Paint()..color = tone1;

class MyGame extends BaseGame {
  String pressedKey = null;

  void setPressedKey(String key) {
    this.pressedKey = key;
  }

  @override
  void add(Component c) {
  }

  @override
  void update(double dt) {
  }

  @override
  void render(Canvas c) {
    c.drawRect(new Rect.fromLTWH(0.0, 0.0, size.width, size.height), pTone1);
    if (this.pressedKey != null) {
      final p = Flame.util.text(this.pressedKey, fontSize: 48.0, color: black);
      p.paint(c, Offset((size.width - p.width)/2, (size.height - p.height)/2));
    }
  }

  void pause() {
    print("Pause");
  }
}
