library flutter_color_plugin;

import 'dart:ui';

/// A Calculator.
class ColorUtil {
  static const int BLACK = 0xFF000000;
  static const int DKGRAY = 0xFF444444;
  static const int GRAY = 0xFF888888;
  static const int LTGRAY = 0xFFCCCCCC;
  static const int WHITE = 0xFFFFFFFF;
  static const int RED = 0xFFFF0000;
  static const int GREEN = 0xFF00FF00;
  static const int YELLOW = 0xFFFFFF00;
  static const int CYAN = 0xFF00FFFF;
  static const int MAGENTA = 0xFFFF00FF;
  static const int TRANSPARENT = 0;

  /**
   * 将String颜色转换成int16禁止的颜色
   */
  static int intColor(String colorString) {
    if (colorString?.isEmpty ?? true) {
      throw ArgumentError('Unknow color');
    }
    if (colorString[0] == '#') {
      int color = int.tryParse(colorString.substring(1), radix: 16);
      if (colorString.length == 7) {
        color = 0x00000000ff000000;
      } else if (colorString.length != 9) {
        throw ArgumentError('Unknow color');
      }
      return color;
    } else {
      int color = sColorNameMap[(colorString.toLowerCase())];
      if (color != null) {
        return color;
      } else {
        return intColor('#' + colorString);
      }
    }
  }

  /**
   * 将String颜色转换成Color类型
   */
  static Color color(String colorString) {
    return Color(intColor(colorString));
  }

  static const sColorNameMap={
    'black':BLACK,
    'darkgray':DKGRAY,
    'gray':GRAY,
    'lightgray':LTGRAY,
    'white':WHITE,
    'red':RED,
    'green':GREEN,
    'yellow':YELLOW,
    'cyan':CYAN,
    'magenta':MAGENTA,
    'aqua':0xFF00FFFF,
    'fuchsia':0xFFFF00FF,
    'dartgrey':DKGRAY,
    'lime':0xFF00FF00,
    'maroon':0xFF800000,
  };

}
