import 'package:flutter/material.dart';
import 'package:oro/bloc/loanAppointmentBloc/loanappointment_bloc.dart';
import 'package:oro/screens/dashboard/dashboardScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoanappointmentBloc>(
          create: (context) => LoanappointmentBloc(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Oro',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "NunitoSans",
            backgroundColor: Color.fromRGBO(248, 248, 248, 1),
            scaffoldBackgroundColor: Color.fromRGBO(248, 248, 248, 1),
          ),
          home: DashboardScreen(),
        ),
      ),
    );
  }
}
