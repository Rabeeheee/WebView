import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bw_task_bloc/bloc/webview/webview_event.dart';
import 'package:bw_task_bloc/bloc/webview/webview_state.dart';

class WebViewBloc extends Bloc<WebViewEvent, WebViewState> {
  WebViewBloc() : super(WebViewInitial()) {
    on<WebViewStarted>(_onWebViewStarted);
    on<WebViewPageLoaded>(_onWebViewPageLoaded);
    on<WebViewKeyboardShown>(_onWebViewKeyboardShown);
    on<WebViewKeyboardHide>(_onWebViewKeyboardHide);
  }

  void _onWebViewStarted(WebViewStarted event, Emitter<WebViewState> emit) {
    emit(WebViewLoading());
  }

  void _onWebViewPageLoaded(WebViewPageLoaded event, Emitter<WebViewState> emit) {
    emit(WebViewLoaded());
  }

  void _onWebViewKeyboardShown(WebViewKeyboardShown event, Emitter<WebViewState> emit) {
    emit(WebViewKeyboardVisible(event.keyboardHeight));
  }

  void _onWebViewKeyboardHide(WebViewKeyboardHide event, Emitter<WebViewState> emit) {
    emit(WebViewKeyboardHidden());
  }
}