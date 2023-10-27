import 'package:english_app/core/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum AppRedactorEnum {
  redactor,
  add,
}

enum AppWhatFromEnum {
  day,
  favorite,
  all,
  basket,
}

var appWhatFromEnum = AppWhatFromEnum.day;

final ValueNotifier<ScrollDirection> scrollDirectionNotifier =
    ValueNotifier<ScrollDirection>(ScrollDirection.forward);

bool isContains() =>
    AppTextConstants.toDayShow.value.contains('Сегодня') ? true : false;
