import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static double _screenWidthDefault = 375;
  static double _screenHeightDefault = 667;
  static double _defaultBlockWidth = _screenWidthDefault / 100;
  static double _defaultBlockHeight = _screenHeightDefault / 100;
  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print('blockHeight: $_defaultBlockHeight and blockWidth: $_blockHeight');
    print(SCALE(20));
    print(20 / 6.67 * textMultiplier);
  }
}

double SCALE(double value) {
  return (value / SizeConfig._defaultBlockHeight * SizeConfig.textMultiplier);
}
