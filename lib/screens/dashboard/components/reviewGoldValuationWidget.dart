import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oro/bloc/loanAppointmentBloc/loanappointment_bloc.dart';
import 'package:oro/modals/loanAppointmentModals/loanAppointmentModals.dart';
import 'package:oro/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewGoldValuationWidget extends StatelessWidget {
  const ReviewGoldValuationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoanappointmentBloc, LoanappointmentState>(
        builder: (context, state) {
      if (state is ReviewGoldValuationResult)
        return Stack(
          children: [
            Container(
              color: Color.fromRGBO(248, 248, 248, 1),
              margin: EdgeInsets.only(top: 40),
              constraints: BoxConstraints(
                minHeight: Util.getDeviceHeight(context),
              ),
              width: Util.getDeviceWidth(context),
              child: Column(
                children: [
                  Container(
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
                            "assets/images/goldBrick.jpg"),
                        SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("STEP 2 OF STEP 3",
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
                  Util.getProgressBar(context, progress: 2, rest: 1),
                  Container(
                    margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                    height: 112,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("VALUATION SUMMARY",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(144, 144, 144, 1),
                                  fontWeight: FontWeight.w600)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.all(16),
                          width: double.maxFinite,
                          height: 88,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                  child: valuationSummaryContainer(
                                      "GROSS WEIGHT", state.grossWeight)),
                              Util.divider(),
                              Expanded(
                                  child: valuationSummaryContainer(
                                      "DEDUCTION", state.deduction)),
                              Util.divider(),
                              Expanded(
                                  child: valuationSummaryContainer(
                                      "NET WEIGHT", state.netWeight)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("VALUATION DETAILS",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(144, 144, 144, 1),
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.jewels.payload.length,
                          itemBuilder: (context, index) {
                            return customValuationCardWidget(
                                context, state.jewels.payload[index]);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: InkWell(
                  child: Util.getCustomButton("Approve My Jewels", context),
                  onTap: () {
                    context.read<LoanappointmentBloc>().add(AppoveMyJewels());
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        );
      return Container();
    });
  }

  Container valuationSummaryContainer(String header, double weight) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(header,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  fontWeight: FontWeight.w600)),
          FittedBox(
            child: Text("$weight grams",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  Widget customValuationCardWidget(
      BuildContext context, JewelDomPayload jewelDetail) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 180,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 16, right: 16, bottom: 16),
                    color: Colors.white,
                    constraints: BoxConstraints(minHeight: 155),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Container(
                          height: 32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 70),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("QUANTITY",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text(jewelDetail.quantity.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text("QUALITY",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    Text(jewelDetail.quality.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                decoration: BoxDecoration(
                                    color: Colors.amber[50],
                                    borderRadius: BorderRadius.circular(30)),
                                height: 24,
                                width: 88,
                                child: Center(
                                  child: Text("View Images",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(255, 170, 7, 1),
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16, bottom: 16),
                          child: Row(
                            children: [
                              Text(jewelDetail.type,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.amber[600],
                                      fontWeight: FontWeight.w700)),
                              Expanded(child: Util.oroDivider()),
                            ],
                          ),
                        ),
                        Container(
                          height: 32,
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              weightDetailBar(
                                  jewelDetail.grossWeight, "GROSS WEIGHT"),
                              weightDetailBar(
                                  jewelDetail.stoneWeight, "STONE WEIGHT"),
                              weightDetailBar(
                                  jewelDetail.netWeight, "NET WEIGHT/ANW"),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                left: 10,
                top: 0,
                child: Container(
                  height: 74,
                  width: 74,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 251, 245, 230),
                    radius: 37,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(37),
                      child: Image.asset(
                        jewelDetail.image,
                        fit: BoxFit.contain,
                        height: double.maxFinite,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8)
      ],
    );
  }

  Container weightDetailBar(double weight, String header) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 8,
                  color: Color.fromRGBO(144, 144, 144, 1),
                  fontWeight: FontWeight.w700)),
          FittedBox(
            child: Text(
                header.contains("ANW")
                    ? "$weight\g/$weight\g"
                    : "$weight grams",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
