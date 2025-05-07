import 'package:bw_task_bloc/bloc/phone/phone_bloc.dart';
import 'package:bw_task_bloc/bloc/phone/phone_event.dart';
import 'package:bw_task_bloc/bloc/phone/phone_state.dart';
import 'package:bw_task_bloc/constants/theme_constants.dart';
import 'package:bw_task_bloc/widgets/phone/phone_header.dart';
import 'package:bw_task_bloc/widgets/phone/phone_input_field.dart';
import 'package:bw_task_bloc/widgets/phone/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({Key? key}) : super(key: key);

  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String phoneNumber = '';

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PhoneHeader(),
            const SizedBox(height: AppTheme.formSpacing),
            PhoneInputField(
              controller: phoneController,
              onInputChanged: (PhoneNumber number) {
                setState(() {
                  phoneNumber = number.phoneNumber ?? '';
                });
              },
              initialCountry: 'IN',
            ),
            const SizedBox(height: AppTheme.smallSpacing),
            Text(
              'Enter your 10-digit mobile number',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textGrey,
              ),
            ),
            const SizedBox(height: AppTheme.formSpacing),
            BlocBuilder<PhoneBloc, PhoneState>(
              builder: (context, state) {
                return SubmitButton(
                  isLoading: state is PhoneLoading,
                  onPhoneSubmit: (String validPhoneNumber) {
                    context.read<PhoneBloc>().add(
                          PhoneNumberSubmitted(validPhoneNumber),
                        );
                  },
                  phoneNumber: phoneNumber,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}