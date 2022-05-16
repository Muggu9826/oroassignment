import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oro/modals/loanAppointmentModals/loanAppointmentModals.dart';
import 'package:oro/modals/loanAppointmentModals/plansModal.dart';
import 'package:oro/modals/loanAppointmentModals/tansactionDetailsModal.dart';

part 'loanappointment_event.dart';
part 'loanappointment_state.dart';

class LoanappointmentBloc
    extends Bloc<LoanAppointmentEvent, LoanappointmentState> {
  LoanappointmentBloc() : super(LoanappointmentInitial()) {
    on<LoanAppointmentEvent>((event, emit) {
      try {
        if (event is VerifyAppraisalPartner) {
          if (event.otp == (getOtp["otp"] as int)) {
            emit(VerifyAppraisalPartnerOTP(true));
          } else {
            emit(OtpFailureState("Otp miss match. Please try 0000."));
          }
        }
        if (event is ReviewGoldValuation) {
          JewelDom jewelResultList;
          double grossWeight = 0.0, deduction = 0.0, netWeight = 0.0;

          jewelResultList = JewelDom.fromMap(jewelsDetails);
          jewelResultList.payload.forEach(
            (element) {
              grossWeight += element.grossWeight;
              netWeight += element.netWeight;
            },
          );
          deduction = grossWeight - netWeight;

          emit(ReviewGoldValuationResult(
              jewelResultList, netWeight, deduction, grossWeight));
        }
        if (event is AppoveMyJewels) {
          emit(AppoveMyJewelsResult(true));
        }
        if (event is ChoosePlanAndGetFunds) {
          PlanDataDom plans;
          plans = PlanDataDom.fromMap(planData);
          emit(ChoosePlanAndGetRefundedResult(true));
          emit(ChoosePlanAndGetFundsData(plans.payload));
        }

        if (event is SelectedPlan) {
          TransactionDom transactions;
          transactions = TransactionDom.fromMap(tansactionDetails);

          emit(GetTransactionDetails(transactions));
        }
      } catch (e) {
        print(
            "Error in emmiting state please check bloc implementation for now... $e");
      }
    });
  }
}
