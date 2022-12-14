import 'dart:math';
import 'package:flutter/material.dart';

class MathHelper {
  static double dist(Offset v, Offset w) {
    return sqrt(dist2(v, w));
  }

  static double dist2(Offset v, Offset w) {
    return sqr(v.dx - w.dx) + sqr(v.dy - w.dy);
  }

  static double sqr(double x) {
    return x * x;
  }

  static double randomDouble(double minValue, double maxValue, int precision) {
    final random = Random();
    final doubleRandom = minValue + (maxValue - minValue) * random.nextDouble();
    return double.parse(doubleRandom.toStringAsFixed(precision));
  }
}
