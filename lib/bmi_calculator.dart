import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Bmi_calculator extends StatefulWidget {
  const Bmi_calculator({super.key});

  @override
  State<Bmi_calculator> createState() => _Bmi_calculatorState();
}

class _Bmi_calculatorState extends State<Bmi_calculator> {
  Color myColor = Colors.blue[300]!;
  TextEditingController weight_Controller = new TextEditingController();
  TextEditingController height_Controller = new TextEditingController();
  var main_result = TextEditingController();
  String? gender;
  CalCulate_BMI(String weight, String height) async {
    var myDouble_weight = double.parse(weight);
    assert(myDouble_weight is double);
    var myDouble_height = double.parse(height);
    assert(myDouble_height is double);

    var res =
        (myDouble_weight / (myDouble_height / 100 * myDouble_height / 100));

    setState(() {
      main_result.text = res.toStringAsFixed(2);
      if (res < 18.5) {
        myColor = Colors.blue[300]!;
      } else if (res >= 18.5 && res <= 24.9) {
        myColor = Colors.green[300]!;
      } else if (res >= 25 && res <= 29.9) {
        myColor = Colors.yellow[600]!;
      } else if (res >= 30 && res <= 34.9) {
        myColor = Colors.orange[300]!;
      } else if (res >= 35) {
        myColor = Colors.red[300]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Center(
            child: Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 70,
                    height: 50,
                    color: Colors.blue[300],
                    child: Center(
                      child: Text(
                        'UnderWeight',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 50,
                    color: Colors.green[300],
                    child: Center(
                      child: Text(
                        'Normal',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 50,
                    color: Colors.yellow[600],
                    child: Center(
                      child: Text(
                        'Overweight',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 50,
                    color: Colors.orange[300],
                    child: Center(
                      child: Text(
                        'Obese',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 50,
                    color: Colors.red[300],
                    child: Center(
                      child: Text(
                        'Extreme',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: myColor,
                    ),
                    child: Center(
                      child: Text(
                        'BMI:' + main_result.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(children: [
                  Expanded(
                    child: RadioListTile(
                      activeColor: Colors.greenAccent,
                      title: Text("Male",
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontWeight: FontWeight.bold)),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      activeColor: Colors.greenAccent,
                      title: Text("Female",
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontWeight: FontWeight.bold)),
                      value: "female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ),
                ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 10),
                child: Container(
                  child: TextFormField(
                    controller: height_Controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                      hintText: 'Height',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 20),
                child: TextFormField(
                  controller: weight_Controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                    hintText: 'Weight',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    CalCulate_BMI(
                        weight_Controller.text, height_Controller.text);
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 17),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
