import 'package:english_app/components/custom_alert_dialog.dart';
import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:english_app/core/text_constants.dart';
import 'package:english_app/server/service_locator.dart';
import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';

showCalendar(BuildContext context) async {
  ValueNotifier<EventList<Event>> markedDateMap =
      ValueNotifier<EventList<Event>>(EventList<Event>(
    events: {},
  ));

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return BlocProvider.value(
          value: sl<WordsCubit>()..getAllWords(),
          child: BlocListener<WordsCubit, WordsState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (model) {
                  EventList<Event> newEvents = EventList<Event>(events: {});
                  model.map((e) {
                    e.createDate.substring(6, 10);
                    int year = int.parse(e.createDate.substring(6, 10));
                    int month = int.parse(e.createDate.substring(3, 5));
                    int day = int.parse(e.createDate.substring(0, 2));

                    newEvents.add(
                      DateTime(year, month, day),
                      Event(date: DateTime(year, month, day)),
                    );
                  }).toList();
                  markedDateMap.value = newEvents;
                },
              );
            },
            child: CustomAlertDialog(
              color: AppColors.backgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ValueListenableBuilder(
                      valueListenable: markedDateMap,
                      builder: (context, EventList<Event> value, __) {
                        return CalendarCarousel(
                          markedDateMoreCustomTextStyle:
                              const TextStyle(color: Colors.white, fontSize: 8),
                          todayBorderColor: Colors.red,
                          onDayPressed: (DateTime date, List events) {
                            String choiseDay =
                                DateFormat('dd.MM.yyyy').format(date);
                            AppTextConstants.toDayShow.value =
                                date.day == DateTime.now().day &&
                                        date.month == DateTime.now().month &&
                                        date.year == DateTime.now().year
                                    ? 'Сегодня ($choiseDay)'
                                    : choiseDay;
                            Navigator.pop(context);
                          },
                          daysHaveCircularBorder: false,
                          markedDateMoreShowTotal: true,
                          markedDateShowIcon: true,
                          markedDatesMap: value,
                          markedDateIconMaxShown: 0,
                          locale: "ru",
                          weekendTextStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          thisMonthDayBorderColor: Colors.white,
                          weekFormat: false,
                          firstDayOfWeek: 1,
                          height: 420,
                          selectedDateTime: DateTime.now(),
                          customGridViewPhysics:
                              const NeverScrollableScrollPhysics(),
                          showHeader: true,
                          todayTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          todayButtonColor: Colors.yellow,
                          selectedDayTextStyle: const TextStyle(
                            color: Colors.yellow,
                          ),
                          prevDaysTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          daysTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          nextDaysTextStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        );
                      }),
                  CupertinoButton(
                      color: Colors.red,
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context))
                ],
              ),
            ),
          ),
        );
      });
    },
  ).then((value) => context.read<WordsCubit>().getWordsByDay());
}
