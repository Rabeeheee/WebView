import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/firebase_auth_repository.dart';
import '../../models/user_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthRepository _authRepository;
  
  AuthBloc({required FirebaseAuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthUserChanged>(_onAuthUserChanged);
  }

  void _onAuthCheckRequested(AuthCheckRequested event, Emitter<AuthState> emit) {
    if (_authRepository.isAuthenticated()) {
      // In a real app, you would get the user details from your repository
      emit(AuthAuthenticated(UserModel(
        phoneNumber: 'From Firebase',
        uid: 'From Firebase',
      )));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void _onAuthLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    emit(AuthAuthenticated(UserModel(
      phoneNumber: event.phoneNumber,
      uid: event.uid,
    )));
  }
}