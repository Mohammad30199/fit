import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = '';
  String _bmiCategory = '';

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      // BMI formula: BMI = weight (kg) / height (m)^2
      double bmi = weight / (height * height);
      
      setState(() {
        _bmiResult = bmi.toStringAsFixed(2); // Display BMI with 2 decimal points
        _bmiCategory = _getBMICategory(bmi);
      });
    } else {
      setState(() {
        _bmiResult = '';
        _bmiCategory = 'Please enter valid numbers.';
      });
    }
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('BMI Calculator' ,style: TextStyle(fontFamily: "Nunito" , fontSize: 25 , fontWeight: FontWeight.w500 , color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height (in meters)',
                hintText: 'e.g. 1.75',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight (in kg)',
                hintText: 'e.g. 70',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.grey,)
              ),
              onPressed: _calculateBMI,
              child: Text('Calculate BMI' , style: TextStyle(fontFamily: "Nunito" , fontSize: 25 , fontWeight: FontWeight.w500 , color: Colors.black),),
            ),
            SizedBox(height: 20.0),
            if (_bmiResult.isNotEmpty) ...[
              Text(
                'BMI: $_bmiResult',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600 , fontFamily: "Nunito") ,
              ),
              Text(
                'Category: $_bmiCategory',
                style: TextStyle(fontSize: 18.0 ,fontWeight: FontWeight.w600 , fontFamily: "Nunito"),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
