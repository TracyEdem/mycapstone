import 'package:flutter/material.dart';
import 'package:mycapstone/components/express_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/heading1.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int incomplete = 10;
  int complete = 2;
  late double completedPercent = incomplete / (incomplete + complete);
  late double myPercent = double.parse((completedPercent).toStringAsFixed(1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 231, 157, 250),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Head_1Widget(
                  title: 'Completed',
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(25, 249, 247, 248),
                          Color.fromARGB(25, 163, 4, 237),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 485,
                    child: Padding(
                      padding: EdgeInsets.all(15.0.r),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          CircularPercentIndicator(
                            radius: 190.0.r,
                            animation: true,
                            animationDuration: 2000,
                            lineWidth: 15.0,
                            percent: myPercent,
                            reverse: true,
                            arcBackgroundColor:
                                // const Color.fromARGB(255, 247, 132, 191),
                                const Color.fromARGB(255, 148, 5, 250),
                            arcType: ArcType.FULL,
                            center: Column(
                              children: [
                                SizedBox(
                                  height: 37.h,
                                ),
                                Text(
                                  complete.toString(),
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'projects completed',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Text(
                                  incomplete.toString(),
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.sp,
                                ),
                                Text(
                                  'more to go',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor: Colors.yellow,
                            progressColor: const Color(0xFF21242c),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Head_1Widget(
                  title: 'Express orders',
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView(
                  shrinkWrap: true,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ExpressCard(
                      customerName: 'Abena Owusu',
                      date: DateTime.utc(2022, 11, 9),
                      status: 'Complete',
                      projectName: 'Abena\'s Skirt',
                      fee: 70.00,
                    ),
                    ExpressCard(
                      customerName: 'Kofi Ntim',
                      date: DateTime.utc(2022, 11, 9),
                      status: 'Complete',
                      projectName: 'Kofi\'s Shirt',
                      fee: 100.00,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
