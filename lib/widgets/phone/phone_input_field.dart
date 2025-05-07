import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:bw_task_bloc/constants/theme_constants.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(PhoneNumber) onInputChanged;
  final String initialCountry;

  const PhoneInputField({
    Key? key,
    required this.controller,
    required this.onInputChanged,
    required this.initialCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: onInputChanged,
        onInputValidated: (bool value) {},
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          setSelectorButtonAsPrefixIcon: true,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: PhoneNumber(isoCode: 'IN'),
        countries: const ['IN'],
        textFieldController: controller,
        formatInput: true,
        keyboardType: TextInputType.number,
        inputDecoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Mobile Number',
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        ),
        // Remove the maxLength constraint
      ),
    );
  }
}