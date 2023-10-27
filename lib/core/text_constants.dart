import 'package:english_app/core/date_time.dart';
import 'package:flutter/foundation.dart';

class AppTextConstants {
  static ValueNotifier<String> toDayShow = ValueNotifier('Сегодня ($today)');
  static ValueNotifier<int> indexOfDrowerMenu = ValueNotifier(0);
  static ValueNotifier<double> size = ValueNotifier(60);
  static int sortNumber = 0;
}
