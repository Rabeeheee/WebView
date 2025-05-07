import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/firebase_auth_repository.dart';
import '../auth/auth_bloc.dart';
import '../auth/auth_event.dart';
import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final FirebaseAuthRepository _authRepository;
  final AuthBloc _authBloc;
  
  OtpBloc({
    required FirebaseAuthRepository authRepository,
    required AuthBloc authBloc,
  }) : _authRepository = authRepository,
       _authBloc = authBloc,
       super(OtpInitial()) {
    on<OtpSubmitted>(_onOtpSubmitted);
  }

  void _onOtpSubmitted(OtpSubmitted event, Emitter<OtpState> emit) async {
    emit(OtpLoading());
    try {
      final user = await _authRepository.verifyOTP(event.otp);
      _authBloc.add(AuthUserChanged(uid: user.uid, phoneNumber: user.phoneNumber));
      emit(OtpVerified(user));
    } catch (e) {
      emit(OtpError(e.toString()));
    }
  }
}