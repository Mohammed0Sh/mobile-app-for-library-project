import 'package:Library/screen/addition/component/contain_step1.dart';
import 'package:Library/screen/addition/component/contain_step2.dart';
import 'package:Library/screen/addition/component/contain_step3.dart';
import 'package:Library/screen/components/error_dialog.dart';
import 'package:Library/service/constants.dart';
import 'package:Library/service/data_transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addition extends StatefulWidget {
  @override
  _AdditionState createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  int currentStep = 0, endStep = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اضافة عنصر للمكتبة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.orange.shade100,
      body: SafeArea(
        child: Container(
          child: Stepper(
            type: StepperType.vertical,
            currentStep: currentStep,
            onStepCancel: () {
              setState(() {
                currentStep =
                    (currentStep - 1 < 0) ? currentStep : currentStep - 1;
              });
            },
            onStepContinue: () async {
              if (currentStep + 1 < 3) {
                setState(() {
                  currentStep = currentStep + 1;
                });
              } else {
                await showErrorDialog(context, 'تم ارسال الطلب', '');
                Navigator.of(context).pop();
              }
            },
            onStepTapped: (step) {
              currentStep = step;
            },
            steps: [
              Step(
                  title: Text("خطوة 1", style: KstepperStyle),
                  isActive: true,
                  state: (currentStep > 0)
                      ? StepState.complete
                      : StepState.editing,
                  content: BuildContaiStep1(size: size)),
              Step(
                  state: (currentStep > 1)
                      ? StepState.complete
                      : StepState.editing,
                  title: Text("خطوة 2", style: KstepperStyle),
                  isActive: (currentStep > 0) ? true : false,
                  content: BuildContainStep2(size: size)),
              Step(
                  state: (currentStep > 1)
                      ? StepState.complete
                      : StepState.editing,
                  title: Text("خطوة 3", style: KstepperStyle),
                  isActive: (currentStep > 1) ? true : false,
                  content: BuildContainStep3(
                    size: size,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
