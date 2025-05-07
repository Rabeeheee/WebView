import 'package:bw_task_bloc/bloc/phone/phone_bloc.dart';
import 'package:bw_task_bloc/bloc/phone/phone_state.dart';
import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:bw_task_bloc/screens/otp_screen.dart';
import 'package:bw_task_bloc/widgets/phone/phone_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,

      //APPBAR
      appBar: AppBar(
        title: const Text('Enter Phone Number'),
      ),
      body: BlocConsumer<PhoneBloc, PhoneState>(
        listener: (context, state) {
          if (state is PhoneNumberSent) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(phoneNumber: state.phoneNumber),
              ),
            );
          }
          if (state is PhoneError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppTheme.primaryColor,
              ),
            );
          }
        },
        builder: (context, state) {
          //FORM
          return const PhoneForm();
        },
      ),
    );
  }
}