import 'package:flutter/material.dart';
import 'constraints.dart';
class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int height = 150;
  int weight = 50;
  late double bmi = calculateBMI(height: height, weight: weight);
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        print('male');
                        setState((){
                          gender = 'M';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: gender == 'M' ? Colors.orangeAccent.shade400 : Colors.orangeAccent.shade100,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 150.0,
                        width: 125.0,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Icon(Icons.male,
                            size: 100.0,
                            ),
                            Text('Male'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('female');
                        setState(() {
                          gender = 'F';
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: gender == 'F' ? Colors.orangeAccent.shade400 : Colors.orangeAccent.shade100,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 150.0,
                        width: 125.0,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Icon(Icons.female,
                            size: 100.0
                            ),
                            Text('Female'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children:  [
                        Text('Height'),
                        Text('$height',
                        style: kInputLableColor,
                        ),
                        Row(
                          children:  [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                if(height > 50){
                                  height--;
                                }
                                bmi = calculateBMI(height: height, weight: weight);
                              });
                              print('h m');
                            },
                              child: Icon(Icons.remove, size: 40.0,),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                if(height < 220){
                                  height++;
                                }
                                bmi = calculateBMI(height: height, weight: weight);
                              });
                              print('h p');
                            },
                              child: Icon(Icons.add, size: 40.0,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Weight'),
                         Text('$weight',
                          style: kInputLableColor,
                        ),
                        Row(
                          children:  [
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                if(weight > 30){
                                  weight--;
                                }
                                bmi = calculateBMI(height: height, weight: weight);
                              });
                              print('w m');
                            },
                              child: Icon(Icons.remove, size: 40.0,),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                if(weight < 300){
                                  weight++;
                                }
                                bmi = calculateBMI(height: height, weight: weight);
                              });
                              print('w p');
                            },
                              child: Icon(Icons.add, size: 40.0,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Column(
                children: [
                  Text('BMI'),
                  Text('${bmi.toStringAsFixed(2)}',
                    style: kInputLableColor.copyWith(color: kOutputColor,
                    fontSize: 60.0
                    ),
                    ),
                  Text(getResult(bmi)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}){
    return weight / (height/100 * height/100);
  }

  String getResult(bmi){
    if(bmi >= 25){
      return 'Overweight';
    } else if(bmi >= 18){
      return 'Normal';
    } else{
      return 'Underweight';
    }
  }

}


