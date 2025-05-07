import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  
  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class AuthLogoutRequested extends AuthEvent {}

class AuthUserChanged extends AuthEvent {
  final String uid;
  final String phoneNumber;
  
  const AuthUserChanged({required this.uid, required this.phoneNumber});
  
  @override
  List<Object?> get props => [uid, phoneNumber];
}