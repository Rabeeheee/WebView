import 'dart:async';
import 'package:flutter/material.dart';

class ResendTimerWidget extends StatefulWidget {
  final VoidCallback onResendPressed;

  const ResendTimerWidget({
    Key? key,
    required this.onResendPressed,
  }) : super(key: key);

  @override
  _ResendTimerWidgetState createState() => _ResendTimerWidgetState();
}

class _ResendTimerWidgetState extends State<ResendTimerWidget> {
  int _timeLeft = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Didn\'t receive code? ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        _timeLeft > 0
            ? Text(
                'Resend in $_timeLeft s',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              )
            : TextButton(
                onPressed: () {
                  widget.onResendPressed();
                  setState(() {
                    _timeLeft = 30;
                  });
                  _startTimer();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  foregroundColor: Colors.black,
                ),
                child: const Text(
                  'Resend',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ],
    );
  }
}