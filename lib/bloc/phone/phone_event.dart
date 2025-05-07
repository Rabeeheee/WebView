import 'package:equatable/equatable.dart';

abstract class PhoneEvent extends Equatable {
  const PhoneEvent();
  
  @override
  List<Object?> get props => [];
}

class PhoneNumberSubmitted extends PhoneEvent {
  final String phoneNumber;
  
  const PhoneNumberSubmitted(this.phoneNumber);
  
  @override
  List<Object?> get props => [phoneNumber];
}