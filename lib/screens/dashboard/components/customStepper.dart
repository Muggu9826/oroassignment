import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro/bloc/loanAppointmentBloc/loanappointment_bloc.dart';
import 'package:oro/utils/enums.dart';

enum Progress { Inprogress, Pending, Completed }

class CustomStepper extends StatefulWidget {
  const CustomStepper({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int index = 1;
  void stepperIndex(LoanappointmentState loanState) {
    if (loanState is VerifyAppraisalPartnerOTP) {
      if (loanState.result) {
        index = 2;
      }
    }
    if (loanState is AppoveMyJewelsResult) {
      if (loanState.result) index = 3;
    }
    if (loanState is ChoosePlanAndGetRefundedResult) {
      if (loanState.result) {
        index = 4;
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    var loanState = context.watch<LoanappointmentBloc>().state;
    stepperIndex(loanState);

    return Container(
      margin: EdgeInsets.only(top: 24, left: 16, right: 16),
      height: 336,
      width: double.maxFinite,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text("Simple Steps to get your Gold Load",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(144, 144, 144, 1),
                      fontWeight: FontWeight.w600)),
            ),
          ),
          stepper(index)
        ],
      ),
    );
  }

  Expanded stepper(int index) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: double.maxFinite,
              child: stepperBar(index),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [...stepperLogic(index)]),
          ],
        ),
      ),
    );
  }

  Column stepperBar(int index) {
    var status = stepperBarLogic(index);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: 32,
          height: 32,
          child: Image.asset(
            status[0],
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 6),
          width: 32,
          height: 64,
          child: Image.asset(
            status[1],
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Container(
          width: 32,
          height: 32,
          child: Image.asset(
            status[2],
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6, bottom: 6),
          width: 32,
          height: 64,
          child: Image.asset(
            status[3],
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 32,
          height: 32,
          child: Image.asset(
            status[4],
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ],
    );
  }

  Widget customStepDetailWidget(
      int stepNumber, String title, StepperProgress progress) {
    return Container(
      height: 64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Step $stepNumber",
            style: TextStyle(
                fontSize: 10,
                color: Colors.grey[400],
                fontWeight: FontWeight.w600),
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w700)),
          Container(
              width: 100,
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  progress == StepperProgress.inprogress
                      ? "assets/images/inprogress.png"
                      : progress == StepperProgress.pending
                          ? "assets/images/pending.png"
                          : "assets/images/completedicon.png",
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              )),
        ],
      ),
    );
  }

  List<Widget> stepperLogic(int index) {
    List<Widget> action = [];
    if (index < 2) {
      action.add(
        customStepDetailWidget(
            1, "Appraisal Partner Verification", StepperProgress.inprogress),
      );
      action.add(
        customStepDetailWidget(
            2, "Appraisal Partner Verification", StepperProgress.pending),
      );
      action.add(
        customStepDetailWidget(
            3, "Appraisal Partner Verification", StepperProgress.pending),
      );
      return action;
    }
    if (index < 3) {
      action.add(
        customStepDetailWidget(
            1, "Appraisal Partner Verification", StepperProgress.completed),
      );
      action.add(
        customStepDetailWidget(
            2, "Appraisal Partner Verification", StepperProgress.inprogress),
      );
      action.add(
        customStepDetailWidget(
            3, "Appraisal Partner Verification", StepperProgress.pending),
      );
      return action;
    }
    if (index < 4) {
      action.add(
        customStepDetailWidget(
            1, "Appraisal Partner Verification", StepperProgress.completed),
      );
      action.add(
        customStepDetailWidget(
            2, "Appraisal Partner Verification", StepperProgress.completed),
      );
      action.add(
        customStepDetailWidget(
            3, "Appraisal Partner Verification", StepperProgress.inprogress),
      );
      return action;
    }
    if (index < 4) {
      action.add(
        customStepDetailWidget(
            1, "Appraisal Partner Verification", StepperProgress.completed),
      );
      action.add(
        customStepDetailWidget(
            2, "Appraisal Partner Verification", StepperProgress.completed),
      );
      action.add(
        customStepDetailWidget(
            3, "Appraisal Partner Verification", StepperProgress.completed),
      );
      return action;
    }
    return [Container()];
  }

  List<String> stepperBarLogic(int index) {
    if (index < 2) {
      return [
        "assets/images/step1P.png",
        "assets/images/pipePR.png",
        "assets/images/step2P.png",
        "assets/images/pipeP.png",
        "assets/images/step3P.png",
      ];
    }
    if (index < 3) {
      return [
        "assets/images/step1C.png",
        "assets/images/pipeC.png",
        "assets/images/step2PR.png",
        "assets/images/pipePR.png",
        "assets/images/step3P.png",
      ];
    }
    if (index < 4) {
      return [
        "assets/images/step1C.png",
        "assets/images/pipeC.png",
        "assets/images/step2C.png",
        "assets/images/pipeC.png",
        "assets/images/step3P.png",
      ];
    }
    return [
      "assets/images/step1C.png",
      "assets/images/pipeC.png",
      "assets/images/step2C.png",
      "assets/images/pipePR.png",
      "assets/images/step3P.png",
    ];
  }
}
