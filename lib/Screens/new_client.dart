import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:mycapstone/Screens/measure.dart';

class NewClient extends StatefulWidget {
  // const UpWidget({Key? key}) : super(key: key);
  const NewClient({super.key});

  @override
  _NewClientState createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  TextEditingController namectl = TextEditingController();
  TextEditingController genderctl = TextEditingController();
  TextEditingController phonectl = TextEditingController();
  TextEditingController balancectl = TextEditingController();
  TextEditingController profilectl = TextEditingController();

  late bool error, sending, success;
  late String msg;

  String phpurl = "http://172.16.8.152/test/write.php";

  @override
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> sendData() async {
    var res = await http.post(Uri.parse(phpurl), body: {
      "name": namectl.text,
      "gender": genderctl.text,
      "phoneno": phonectl.text,
      "balance": balancectl.text,
      "profile": profilectl.text,
    }); //sending post request with header data

    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if (data["error"]) {
        setState(() {
          //refresh the UI when error is recieved from server
          sending = false;
          error = true;
          msg = data["message"]; //error message from server
        });
      } else {
        namectl.text = "";
        genderctl.text = "";
        phonectl.text = "";
        balancectl.text = "";
        //after write success, make fields empty

        setState(() {
          sending = false;
          success = true; //mark success and refresh UI with setState
        });
      }
    } else {
      //there is error
      setState(() {
        error = true;
        msg = "Error during sendign data.";
        sending = false;
        //mark error and refresh UI with setState
      });
    }
  }

  final _formKey = GlobalKey<FormBuilderState>();

  String dropdownValue = 'Male';
  // String styleValue = 'Skirt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: const [
            Text(
              'New Client',
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
        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderTextField(
                    name: 'Name',
                    controller: namectl,
                    decoration: const InputDecoration(
                      labelText: 'Name',
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
                      FormBuilderValidators.minLength(3),
                    ]),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderDropdown(
                    name: 'gender',
                    // controller: genderctl,
                    decoration: const InputDecoration(
                      labelText: 'Gender',
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
                      'Male',
                      'Female',
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
                  child: FormBuilderTextField(
                    name: 'number',
                    controller: phonectl,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
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
                      FormBuilderValidators.maxLength(15),
                    ]),
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 90,
                  child: FormBuilderTextField(
                    name: 'balance',
                    controller: balancectl,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Balance',
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
                    name: 'Profile Picture',
                    // controller: profilectl,
                    decoration: const InputDecoration(
                      labelText: 'Upload Profile Picture',
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
                    allowMultiple: false,
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
                              child: Text("Add image"),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                        elevation: 0,
                        side: const BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 148, 5, 250),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const MeasureWidget(),
                          ),
                        );
                      },
                      child: const Text(
                        'Add Body Measurements',
                        style: TextStyle(
                            color: Color.fromARGB(255, 148, 5, 250),
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 148, 5, 250),
                      ),
                      onPressed: () {
                        setState(() {
                          sending = true;
                        });
                        sendData();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
