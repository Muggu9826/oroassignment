import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oro/bloc/loanAppointmentBloc/loanappointment_bloc.dart';
import 'package:oro/modals/loanAppointmentModals/tansactionDetailsModal.dart';
import 'package:oro/utils/util.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: 60, bottom: 50, left: 16, right: 16),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 36,
                  width: 80,
                  child: Image.asset(
                    "assets/images/oroLogo.png",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    "assets/images/check.png",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Container(
                constraints: BoxConstraints(
                  minHeight: 340,
                ),
                margin: EdgeInsets.only(top: 20),
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Congratulation 🎉",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        "Gold Loan Amount has been transferred \nto your bank account",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 48, bottom: 16),
                      width: double.maxFinite,
                      height: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 1),
                              height: 1,
                              child: Image.asset(
                                "assets/images/line.jpg",
                                height: double.maxFinite,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "TRANSACTION DETAILS",
                            style: TextStyle(
                              color: Color.fromRGBO(144, 144, 144, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 1),
                              height: 1,
                              child: Image.asset(
                                "assets/images/line.jpg",
                                height: double.maxFinite,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<LoanappointmentBloc, LoanappointmentState>(
                        builder: (context, state) {
                      if (state is GetTransactionDetails)
                        return Wrap(spacing: 16, runSpacing: 5, children: [
                          ...state.transactions.payload
                              .map(
                                (e) => transactionDetailWidget(e),
                              )
                              .toList()
                        ]);
                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Util.getCustomButton("Manage Your Loan", context))
    ]));
  }

  Container transactionDetailWidget(TransactionDomPayload e) {
    return Container(
      height: 158,
      width: 163.5,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 242, 202),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amount",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(144, 144, 144, 1),
                        fontWeight: FontWeight.w400)),
                Text("₹ ${e.amount}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Transaction ID",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(144, 144, 144, 1),
                        fontWeight: FontWeight.w400)),
                Text(e.id,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("MODE",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(144, 144, 144, 1),
                        fontWeight: FontWeight.w400)),
                Text(e.mode,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
