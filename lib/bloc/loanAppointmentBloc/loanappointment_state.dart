part of 'loanappointment_bloc.dart';

@immutable
abstract class LoanappointmentState {}

class LoanappointmentInitial extends LoanappointmentState {}

class VerifyAppraisalPartnerOTP extends LoanappointmentState {
  final bool result;
  VerifyAppraisalPartnerOTP(this.result);
}

class ReviewGoldValuationResult extends LoanappointmentState {
  final JewelDom jewels;
  final double grossWeight;
  final double deduction;
  final double netWeight;
  ReviewGoldValuationResult(
    this.jewels,
    this.grossWeight,
    this.deduction,
    this.netWeight,
  );
}

class AppoveMyJewelsResult extends LoanappointmentState {
  final bool result;
  AppoveMyJewelsResult(this.result);
}

class ChoosePlanAndGetFundsData extends LoanappointmentState {
  final List<PlanDataDomPayload> plans;
  ChoosePlanAndGetFundsData(this.plans);
}

class ChoosePlanAndGetRefundedResult extends LoanappointmentState {
  final bool result;
  ChoosePlanAndGetRefundedResult(this.result);
}

class OtpFailureState extends LoanappointmentState {
  final String error;
  OtpFailureState(this.error);
}

class SelectedPlanResult extends LoanappointmentState {
  final bool result;
  SelectedPlanResult(this.result);
}

class GetTransactionDetails extends LoanappointmentState {
  final TransactionDom transactions;
  GetTransactionDetails(this.transactions);
}

class LoanAppointmentError extends LoanappointmentState {
  final String error;
  LoanAppointmentError(this.error);
}
