import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class DefDateWidget extends StatelessWidget {
  final void Function(DateTime) onDateChange;
  const DefDateWidget({super.key, required this.onDateChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EasyDateTimeLine(
          locale: "ar",
          initialDate: DateTime.now(),
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            monthStyle: TextStyle(color: Colors.black),
            selectedDateFormat: SelectedDateFormat.fullDateMonthAsStrDY,
          ),
          onDateChange: onDateChange,
          activeColor: AppColors.customappColors,
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNum,
            inactiveBorderRadius: 48.0,
            activeBorderRadius: 48,
            height: 56.0,
            width: 56.0,
            todayHighlightStyle: TodayHighlightStyle.withBorder,
            activeDayNumStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            inactiveDayNumStyle: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
            ),
          ),
        )
      ],
    );
  }
}
