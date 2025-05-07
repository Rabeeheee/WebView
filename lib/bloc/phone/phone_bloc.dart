import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/firebase_auth_repository.dart';
import 'phone_event.dart';
import 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  final FirebaseAuthRepository _authRepository;
  
  PhoneBloc({required FirebaseAuthRepository authRepository})
      : _authRepository = authRepository,
        super(PhoneInitial()) {
    on<PhoneNumberSubmitted>(_onPhoneNumberSubmitted);
  }

  void _onPhoneNumberSubmitted(PhoneNumberSubmitted event, Emitter<PhoneState> emit) async {
    emit(PhoneLoading());
    try {
      await _authRepository.sendOTP(event.phoneNumber);
      emit(PhoneNumberSent(event.phoneNumber));
    } catch (e) {
      emit(PhoneError(e.toString()));
    }
  }
}