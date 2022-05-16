import 'package:flutter/material.dart';
import 'package:oro/bloc/loanAppointmentBloc/loanappointment_bloc.dart';
import 'package:oro/screens/dashboard/components/choosePlanAndGetFlundsWidget.dart';
import 'package:oro/screens/dashboard/components/reviewGoldValuationWidget.dart';
import 'package:oro/screens/dashboard/components/verifyAppraisalPartnerWidget.dart';
import 'package:oro/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppraisalPartnerVerificationWidget extends StatefulWidget {
  const AppraisalPartnerVerificationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AppraisalPartnerVerificationWidget> createState() =>
      _AppraisalPartnerVerificationWidgetState();
}

class _AppraisalPartnerVerificationWidgetState
    extends State<AppraisalPartnerVerificationWidget> {
  String buttonText = "Verify Appraisal Partner";
  int step = 0;

  void setStepAndButtonText(
    state,
  ) {
    if (state is VerifyAppraisalPartnerOTP) {
      if (state.result) {
        buttonText = "Review Gold Valuation";
        step = 1;
      }
    }

    if (state is OtpFailureState) {
      showSnackBar(context, state.error);
    }

    if (state is AppoveMyJewelsResult) {
      if (state.result) {
        buttonText = "Choose Plan & Get Funds";
        step = 2;
      }
    }
    if (state is ChoosePlanAndGetRefundedResult) {
      if (state.result) {
        buttonText = "Manage Your Loan";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanappointmentBloc, LoanappointmentState>(
        builder: (context, state) {
      setStepAndButtonText(state);
      return Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
            child: Util.getCustomButton(buttonText, context),
            onTap: () async {
              if (step == 0) {
                verifyAppraisalPartnerPopup(context);
              }
              if (step == 1) {
                context.read<LoanappointmentBloc>().add(ReviewGoldValuation());
                reviewGoldValuationPopup();
              }
              if (step == 2) {
                context
                    .read<LoanappointmentBloc>()
                    .add(ChoosePlanAndGetFunds());
                choosePlanAndGetFundsPopup();
              }
            }),
      );
    });
  }

  void showSnackBar(BuildContext context, String error) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error))));
  }

  Future<void> reviewGoldValuationPopup() async {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return ReviewGoldValuationWidget();
        });
  }

  Future<void> verifyAppraisalPartnerPopup(BuildContext context) async {
    showModalBottomSheet<bool>(
        isScrollControlled: true,
        isDismissible: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (context) {
          return VerifyAppraisalPartnerWidget();
        });
  }

  void choosePlanAndGetFundsPopup() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (context) {
          return ChoosePlanAndGetFundsWidget();
        });
  }
}
