import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MeasureRow extends StatelessWidget {
  final String firstField;
  final String secondField;
  final String firstLabel;
  final String secondLabel;


  const MeasureRow({
    Key? key, 
    required this.firstField, 
    required this.secondField, 
    required this.firstLabel, 
    required this.secondLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, 
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 5.h),
        child: SizedBox(
          width: 170,
          height: 90,
          child: FormBuilderTextField(
            name: firstField,
            keyboardType: TextInputType.number,
            // controller: phonectl,
            decoration:  InputDecoration(
              labelText: firstLabel,
              labelStyle: const TextStyle(color: Colors.black87, fontSize: 15),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              fillColor: const Color.fromRGBO(209, 209, 207, 0.4),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: Color.fromARGB(255, 148, 5, 250)),
              ),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 0.h),
        child: SizedBox(
          width: 170,
          height: 90,
          child: FormBuilderTextField(
            name: secondField,
            keyboardType: TextInputType.number,
            // controller: phonectl,
            decoration: InputDecoration(
              labelText: secondLabel,
              labelStyle: const TextStyle(color: Colors.black87, fontSize: 15),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              fillColor: const Color.fromRGBO(209, 209, 207, 0.4),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: Color.fromARGB(255, 148, 5, 250)),
              ),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
        ),
      ),
    ]);
  }
}
