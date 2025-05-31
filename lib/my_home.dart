import 'package:flutter/material.dart';

enum SEX { MALE, FEMALE }

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

double _height = 100;
int _weight = 60;
int _age = 30;
SEX _sex = SEX.MALE;

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.8),
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black.withOpacity(.75),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _sex = SEX.MALE;
                          setState(() {});
                        },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: _sex == SEX.MALE
                                  ? Colors.grey
                                  : Colors.black.withOpacity(.4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.male,
                            size: 150,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _sex = SEX.FEMALE;
                          setState(() {});
                        },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: _sex == SEX.FEMALE
                                  ? Colors.grey
                                  : Colors.black.withOpacity(.4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.female,
                            size: 150,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Height",
                        style: buildTextStyle(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _height.toInt().toString(),
                            style: _numberTextStyle(),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "cm",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: _height,
                        min: 100,
                        max: 220.0,
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        onChanged: (double newValue) {
                          _height = newValue;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 200,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Text(
                                "Weight",
                                style: buildTextStyle(),
                              ),
                              Text(
                                _weight.toString(),
                                style: _numberTextStyle(),
                              ),
                              Row(
                                children: [
                                  FloatingActionButton(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      shape: const CircleBorder(),
                                      mini: true,
                                      backgroundColor: Colors.grey,
                                      onPressed: () {
                                        _weight++;
                                        setState(() {});
                                      }),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  FloatingActionButton(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      shape: const CircleBorder(),
                                      mini: true,
                                      backgroundColor: Colors.grey,
                                      onPressed: () {
                                        _weight--;
                                        setState(() {});
                                      }),
                                ],
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                          height: 200,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.4),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Text(
                                "Age",
                                style: buildTextStyle(),
                              ),
                              Text(
                                _age.toString(),
                                style: _numberTextStyle(),
                              ),
                              Row(
                                children: [
                                  FloatingActionButton(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      shape: const CircleBorder(),
                                      mini: true,
                                      backgroundColor: Colors.grey,
                                      onPressed: () {
                                        _age++;
                                        setState(() {});
                                      }),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  FloatingActionButton(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      shape: const CircleBorder(),
                                      mini: true,
                                      backgroundColor: Colors.grey,
                                      onPressed: () {
                                        _age--;
                                        setState(() {});
                                      }),
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    late double bmi;
                    late String msg;
                    bmi = _weight / (_height * _height * .0001);
                    if (bmi > 30) {
                      msg = "Obese";
                    } else if (25 < bmi && bmi < 29) {
                      msg = "Overweight";
                    } else if (18.5 < bmi && bmi < 24.9) {
                      msg = "Normal";
                    } else {
                      msg = "Underweight";
                    }
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Your BMI is ${bmi.toInt()}"),
                            content: Text(msg),
                            actions: [
                              ElevatedButton(
                                child: Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  },
                  child: Container(
                    height: 80,
                    color: Colors.red,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle _numberTextStyle() => TextStyle(color: Colors.white, fontSize: 50);

TextStyle buildTextStyle() {
  return TextStyle(
    color: Colors.grey,
    fontSize: 20,
  );
}
