import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:oro/bloc/loanAppointmentBloc/loanappointment_bloc.dart';
import 'package:oro/utils/util.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyAppraisalPartnerWidget extends StatelessWidget {
  const VerifyAppraisalPartnerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight: Util.getDeviceHeight(context) * 0.8,
        ),
        width: Util.getDeviceWidth(context),
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              height: 2,
              width: 120,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              height: 47,
              width: Util.getDeviceWidth(context),
              child: Row(
                children: [
                  Util.getCircularImageContainer("assets/images/groupMan.jpg"),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("STEP 1 OF 3",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w600)),
                      Text("Approval Partner Verification",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w700))
                    ],
                  )
                ],
              ),
            ),
            Util.getProgressBar(context, progress: 1, rest: 2),
            Container(
              margin: EdgeInsets.only(top: 24),
              height: 47,
              width: Util.getDeviceWidth(context),
              child: Center(
                child: Text("Confirm OTP Verification",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              height: 413,
              width: Util.getDeviceWidth(context),
              margin: EdgeInsets.only(top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("ORO APPRAISAL PARTNER",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 24),
                  CircleAvatar(
                    radius: 83,
                    backgroundColor: Colors.amber,
                    child: CircleAvatar(
                      radius: 80,
                      child: ClipRRect(
                          child: Image.asset(
                            "assets/images/demoImage.png",
                            height: double.maxFinite,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(80)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Datchina Moorthi S",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                        Text(
                            "Plese share the 4 digit OTP to \n Oro Appraisal Partner to complete identity check",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(144, 144, 144, 1),
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Container(
                    height: 102,
                    width: Util.getDeviceWidth(context),
                    margin: EdgeInsets.only(top: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("OTP CODE FOR VERIFICATION",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(196, 196, 196, 1),
                                fontWeight: FontWeight.w600)),
                        Container(
                          height: 82,
                          alignment: Alignment.center,
                          child: OtpTextField(
                            numberOfFields: 4,
                            showFieldAsBox: false,
                            borderWidth: 4.0,
                            onSubmit: (String verificationCode) {
                              context.read<LoanappointmentBloc>().add(
                                  VerifyAppraisalPartner(
                                      int.parse(verificationCode)));
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("VISIT ID",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
                      Text("OMV0023",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      Text("VISIT ID",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
                      Text("OMV0023",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
