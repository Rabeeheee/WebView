import 'package:equatable/equatable.dart';

abstract class PhoneState extends Equatable {
  const PhoneState();
  
  @override
  List<Object?> get props => [];
}

class PhoneInitial extends PhoneState {}

class PhoneLoading extends PhoneState {}

class PhoneNumberSent extends PhoneState {
  final String phoneNumber;
  
  const PhoneNumberSent(this.phoneNumber);
  
  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneError extends PhoneState {
  final String message;
  
  const PhoneError(this.message);
  
  @override
  List<Object?> get props => [message];
}