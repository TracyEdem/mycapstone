import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


void main() => runApp(const MyCalendar());

class MyCalendar extends StatefulWidget {
  // const MyCalendar({Key? key}) : super(key: key);
  const MyCalendar({super.key});

  @override
  _MyCalendar createState() => _MyCalendar();
}
 

class _MyCalendar extends State<MyCalendar> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              IconButton(
                icon: Icon(
                  FeatherIcons.arrowLeft,
                  size: 25.0.r,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
               const Text(
              'Calendar',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            ],
          ),
        ),
        body: SizedBox(
          // height: 300,
        child: SfCalendar(
          view: CalendarView.month,
          todayHighlightColor: const Color.fromARGB(255, 190, 54, 239),
          firstDayOfWeek: 1,
          showNavigationArrow: true,
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            agendaViewHeight: 400
            ),
        ),
        ),
      ),
    );
  }
}

