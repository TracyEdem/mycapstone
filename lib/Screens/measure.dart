import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../components/measure_row.dart';

class MeasureWidget extends StatefulWidget {
  // const UpWidget({Key? key}) : super(key: key);
  const MeasureWidget({super.key});

  @override
  _MeasureWidgetState createState() => _MeasureWidgetState();
}

class _MeasureWidgetState extends State<MeasureWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: const [
            Text(
              'Measurements',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                    padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 10.h),
                    child: const Text(
                      'Upper body',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87),
                    ),
                  ),
              const MeasureRow(
                  firstField: 'bustCirc',
                  secondField: 'waistCirc',
                  firstLabel: 'Bust',
                  secondLabel: 'Waist'),
              const MeasureRow(
                  firstField: 'accrossBack',
                  secondField: 'biceps',
                  firstLabel: 'Across Back',
                  secondLabel: 'Biceps'),
              const MeasureRow(
                  firstField: 'sleeveLen',
                  secondField: 'shoulderWaist',
                  firstLabel: 'Sleeve',
                  secondLabel: 'Shoulder-Waist'),
              const MeasureRow(
                  firstField: 'nipNip',
                  secondField: 'nipShoulder',
                  firstLabel: 'Nip-Nip',
                  secondLabel: 'Nip-Shoulder'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 10.h),
                    child: const Text(
                      'Lower body',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87),
                    ),
                  ),
              const MeasureRow(
                  firstField: 'dressLen',
                  secondField: 'hipCirc',
                  firstLabel: 'Dress Length',
                  secondLabel: 'Hips'),
              const MeasureRow(
                  firstField: 'kneeCirc',
                  secondField: 'skirtLen',
                  firstLabel: 'Knee Circumference',
                  secondLabel: 'Skirt Length'),
              const MeasureRow(
                  firstField: 'thighWidth',
                  secondField: 'trouserLen',
                  firstLabel: 'Thigh Width',
                  secondLabel: 'Trouser Length'),
              Padding(
                padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 10.h),
                child: SizedBox(
                  width: 170,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 148, 5, 250),
                    ),
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
