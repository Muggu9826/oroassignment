import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oro/screens/dashboard/components/appraisalPartnerVerificationWidget.dart';
import 'package:oro/screens/dashboard/components/customStepper.dart';
import 'package:oro/utils/util.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: Util.getDeviceHeight(context),
                width: Util.getDeviceWidth(context),
              ),
              Column(children: [
                topHeader(),
                partnerDetails(),
                CustomStepper(),
              ]),
              Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: AppraisalPartnerVerificationWidget())
            ],
          ),
        ));
  }

  Widget topHeader() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 39, top: 60),
      child: Stack(
        children: [
          Container(
            height: 61,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: 0,
            top: 0,
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 24,
            ),
          ),
          Positioned(
            left: 30,
            child: Container(
              alignment: Alignment.topLeft,
              height: 61,
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Oro Gold Loan Appointment",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                      "Loans taken in the same doorstep visit will be grouped together.",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(144, 144, 144, 1),
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget partnerDetails() {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 16, right: 16),
      color: Colors.white,
      height: 72,
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: 40,
        width: 311,
        color: Colors.white,
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset("assets/images/Loanicon.png",
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.contain),
            ),
            Container(
              height: 31,
              width: 224,
              margin:
                  EdgeInsets.only(left: 24, top: 4.5, bottom: 4.5, right: 23),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("APPRAISAL PARTNER",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(0, 0, 0, 0.7),
                              fontWeight: FontWeight.w700)),
                      Text("Datchina Moorthi S",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                  Util.divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("VISIT ID",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(0, 0, 0, 0.7),
                              fontWeight: FontWeight.w700)),
                      Text("OMV0023",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
