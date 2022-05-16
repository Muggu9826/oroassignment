part of 'loanappointment_bloc.dart';

@immutable
abstract class LoanAppointmentEvent {}

class VerifyAppraisalPartner extends LoanAppointmentEvent {
  final int otp;
  VerifyAppraisalPartner(this.otp);
}

class ReviewGoldValuation extends LoanAppointmentEvent {}

class AppoveMyJewels extends LoanAppointmentEvent {}

class ChoosePlanAndGetFunds extends LoanAppointmentEvent {}

class SelectedPlan extends LoanAppointmentEvent {}
