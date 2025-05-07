import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';

abstract class OtpState extends Equatable {
  const OtpState();
  
  @override
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpVerified extends OtpState {
  final UserModel user;
  
  const OtpVerified(this.user);
  
  @override
  List<Object?> get props => [user];
}

class OtpError extends OtpState {
  final String message;
  
  const OtpError(this.message);
  
  @override
  List<Object?> get props => [message];
}