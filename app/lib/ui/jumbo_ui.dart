import 'dart:ui';

import 'package:flutter/material.dart';

Map<int, Color> _jumboYellow = {
  50: Color.fromRGBO(253, 197, 19, .1),
  100: Color.fromRGBO(253, 197, 19, .2),
  200: Color.fromRGBO(253, 197, 19, .3),
  300: Color.fromRGBO(253, 197, 19, .4),
  400: Color.fromRGBO(253, 197, 19, .5),
  500: Color.fromRGBO(253, 197, 19, .6),
  600: Color.fromRGBO(253, 197, 19, .7),
  700: Color.fromRGBO(253, 197, 19, .8),
  800: Color.fromRGBO(253, 197, 19, .9),
  900: Color.fromRGBO(253, 197, 19, 1),
};

Map<int, Color> _greyYellow = {
  50: Color.fromRGBO(171, 171, 171, .1),
  100: Color.fromRGBO(171, 171, 171, .2),
  200: Color.fromRGBO(171, 171, 171, .3),
  300: Color.fromRGBO(171, 171, 171, .4),
  400: Color.fromRGBO(171, 171, 171, .5),
  500: Color.fromRGBO(171, 171, 171, .6),
  600: Color.fromRGBO(171, 171, 171, .7),
  700: Color.fromRGBO(171, 171, 171, .8),
  800: Color.fromRGBO(171, 171, 171, .9),
  900: Color.fromRGBO(171, 171, 171, 1),
};

class JumboUI {
  static MaterialColor yellowColor = MaterialColor(0xFFFCD513, _jumboYellow);
  static MaterialColor greyColor = MaterialColor(0xFFABABAB, _greyYellow);


}
