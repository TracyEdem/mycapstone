import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:intl/intl.dart';

class NewWidget extends StatefulWidget {
  // const UpWidget({Key? key}) : super(key: key);
  const NewWidget({super.key});

  @override
  _NewWidgetState createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  String dropdownValue = 'Akosua Boakye';
  String styleValue = 'Skirt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add New Project',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderTextField(
                    name: 'Title',
                    decoration: const InputDecoration(
                      labelText: 'Project Title',
                      labelStyle:
                          TextStyle(color: Colors.black87, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Color.fromRGBO(209, 209, 207, 0.4),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 148, 5, 250)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.maxLength(25),
                    ]),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderDropdown(
                    name: 'clients',
                    decoration: const InputDecoration(
                      labelText: 'Client',
                      labelStyle:
                          TextStyle(color: Colors.black87, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Color.fromRGBO(209, 209, 207, 0.4),
                      border: InputBorder.none,
                    ),
                    initialValue: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Akosua Boakye',
                      'Eva Owusu',
                      'Irene Gates',
                      'Kofi Owusu'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderDropdown(
                    name: 'style',
                    decoration: const InputDecoration(
                      labelText: 'Style',
                      labelStyle:
                          TextStyle(color: Colors.black87, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Color.fromRGBO(209, 209, 207, 0.4),
                      border: InputBorder.none,
                    ),
                    initialValue: styleValue,
                    focusColor: Colors.blueGrey,
                    onChanged: (String? newValue) {
                      setState(() {
                        styleValue = newValue!;
                      });
                    },
                    items: <String>['Skirt', 'Shirts', 'Dresses', 'Pants']
                        .map<DropdownMenuItem<String>>((String myvalue) {
                      return DropdownMenuItem<String>(
                        value: myvalue,
                        child: Text(
                          myvalue,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderTextField(
                    name: 'Description',
                    decoration: const InputDecoration(
                      labelText: 'Project Description',
                      labelStyle:
                          TextStyle(color: Colors.black87, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Color.fromRGBO(209, 209, 207, 0.4),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 148, 5, 250)),
                      ),
                    ),
                    maxLines: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderDateTimePicker(
                    name: 'Due Date',
                    inputType: InputType.date,
                    initialDate: DateTime.now(),
                    format: DateFormat('yyyy-MM-dd'),
                    transitionBuilder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary:  Color.fromARGB(255, 148, 5, 250), // <-- SEE HERE
                            onPrimary: Colors.white, // <-- SEE HERE
                            onSurface: Colors.black87, // <-- SEE HERE
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: 'Due Date',
                      hintText: 'yyyy-MM-dd',
                      labelStyle:
                          TextStyle(color: Colors.black87, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Color.fromRGBO(209, 209, 207, 0.4),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 148, 5, 250)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderTextField(
                    name: 'Fee',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Project Cost',
                      labelStyle:
                          TextStyle(color: Colors.black87, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Color.fromRGBO(209, 209, 207, 0.4),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 148, 5, 250)),
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderFilePicker(
                    name: 'Image',
                    decoration: const InputDecoration(
                      labelText: 'Upload Related Images',
                      labelStyle:
                          TextStyle(color: Colors.black87, fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      filled: true,
                      fillColor: Color.fromRGBO(209, 209, 207, 0.4),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 148, 5, 250)),
                      ),
                    ),
                    previewImages: true,
                    allowMultiple: true,
                    withData: true,
                    typeSelectors: [
                      TypeSelector(
                        type: FileType.image,
                        selector: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.add_photo_alternate,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("Add images"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 148, 5, 250),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      print(_formKey.currentState!.value['email']);
                      print(_formKey.currentState!.value['password']);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
