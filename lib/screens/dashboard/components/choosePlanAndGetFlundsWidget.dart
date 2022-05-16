import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oro/bloc/loanAppointmentBloc/loanappointment_bloc.dart';
import 'package:oro/modals/loanAppointmentModals/plansModal.dart';
import 'package:oro/screens/congratulationScreen.dart';
import 'package:oro/utils/enums.dart';
import 'package:oro/utils/util.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChoosePlanAndGetFundsWidget extends StatelessWidget {
  const ChoosePlanAndGetFundsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(248, 248, 248, 1),
      height: Util.getDeviceHeight(context),
      width: Util.getDeviceWidth(context),
      margin: EdgeInsets.only(top: 60, bottom: 50),
      child: Column(children: [
        Container(
          child: Container(
            width: double.maxFinite,
            height: 55,
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 17,
            ),
            child: Row(
              children: [
                Util.getCircularImageContainer(
                    "assets/images/processIcons.jpg"),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("STEP 3 OF STEP 3",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(144, 144, 144, 1),
                            fontWeight: FontWeight.w600)),
                    Text("GOLD VALUATION",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.xmark,
                      size: 32,
                    )),
              ],
            ),
          ),
        ),
        Util.getProgressBar(context, progress: 9, rest: 1),
        Container(
          margin: EdgeInsets.only(left: 15, right: 36.5, top: 24),
          height: 27,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              customChip("RECOMMENDED"),
              customChip("PAY MONTHLY"),
              customChip("PAY AFTER 6 MONTHS"),
            ],
          ),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 15, right: 9, top: 24),
          child: BlocBuilder<LoanappointmentBloc, LoanappointmentState>(
            builder: (context, state) {
              if (state is ChoosePlanAndGetFundsData)
                return ListView.builder(
                  itemCount: state.plans.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return customPlanWidget(state.plans[index], index, context);
                  },
                );
              return Center(child: CircularProgressIndicator.adaptive());
            },
          ),
        ))
      ]),
    );
  }

  Container customChip(String text) {
    return Container(
      alignment: Alignment.center,
      height: 27,
      width: 97,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 8,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget customPlanWidget(
      PlanDataDomPayload payload, int index, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 468,
          width: double.maxFinite,
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
                width: 80,
                height: 20.5,
                child: Image.asset(
                  "assets/images/Group 228.jpg",
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ))),
        Positioned(
          bottom: 10,
          left: 0,
          right: 8,
          top: 11,
          child: Container(
            height: 457,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 255, 201, 119)),
                borderRadius: BorderRadius.circular(5)),
            width: double.maxFinite,
            child: Column(
              children: [
                planHeader(payload),
                Util.oroDivider(),
                Container(
                  height: 47,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        child: Image.asset("assets/images/rupee.jpg",
                            height: double.maxFinite,
                            width: double.maxFinite,
                            fit: BoxFit.contain),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Max Eligible Amount",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color.fromRGBO(79, 79, 79, 1),
                                    fontWeight: FontWeight.w400)),
                            Text("₹ ${payload.maxEligibleAmount.toString()}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.w800))
                          ],
                        ),
                      ),
                      Util.divider(),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Per Gram Rate",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color.fromRGBO(79, 79, 79, 1),
                                    fontWeight: FontWeight.w400)),
                            Text(payload.perGramRate.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.w800))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Util.oroDivider(direction: DividerDirection.RightToLeft),
                Container(
                  alignment: Alignment.center,
                  height: 14,
                  child: Text("INTEREST IF PAYMENT IS DEFAULTED BY",
                      style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(144, 144, 144, 1),
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 8),
                  child: ListView.builder(
                    itemCount: payload.defaulterInterest.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return customDefaulterIntrestPlanWidget(index, payload);
                    },
                  ),
                ),
                Util.oroDivider(),
                cashBackCoupon(),
                selectPlanButton(context)
              ],
            ),
          ),
        ),
      ],
    );
  }

  InkWell selectPlanButton(BuildContext context) {
    return InkWell(
      child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 20),
          width: MediaQuery.of(context).size.width,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color.fromRGBO(249, 202, 54, 1),
          ),
          child: Center(
              child: Text("Select this Plan",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w700)))),
      onTap: () {
        Navigator.pop(context);
        context.read<LoanappointmentBloc>().add(SelectedPlan());

        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => CongratulationScreen())));
      },
    );
  }

  Row customDefaulterIntrestPlanWidget(int index, PlanDataDomPayload payload) {
    return Row(
      children: [
        Container(
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${payload.defaulterInterest[index].days} days".toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${payload.defaulterInterest[index].interest.toStringAsFixed(2)}%",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "per month".toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "(${(payload.defaulterInterest[index].interest * 12).toStringAsFixed(2)}% p.a)"
                    .toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        if (index != payload.defaulterInterest.length - 1)
          Container(
            constraints: BoxConstraints(maxWidth: 54),
            height: 60,
            child: Center(
              child: Util.divider(),
            ),
          )
      ],
    );
  }

  Container planHeader(PlanDataDomPayload payload) {
    return Container(
      height: 51,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 4.01,
                ),
                child: Text(
                  "Zero Tension ",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 4,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pay After ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: payload.payAfterMonth.toString(),
                        style: TextStyle(
                          color: Colors.amber[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' Months',
                        style: TextStyle(
                          color: Colors.amber[700],
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ((payload.intrestPa) / 12.0).toStringAsFixed(2),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.yellow[700],
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.61,
                    ),
                    child: Text(
                      "%",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.yellow[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '(${payload.intrestPa}% ',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Per Annum',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ')',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container cashBackCoupon() {
    return Container(
      height: 100,
      width: 196,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.amber,
      )),
      child: Stack(children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enjoy Cashback',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "upto ₹100",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.yellow[700],
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "extra",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Text(
                "ON EVERY INTEREST PAYMENT",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
