import 'package:equatable/equatable.dart';

abstract class WebViewEvent extends Equatable {
  const WebViewEvent();
  
  @override
  List<Object?> get props => [];
}

class WebViewStarted extends WebViewEvent {}

class WebViewPageLoaded extends WebViewEvent {}

class WebViewKeyboardShown extends WebViewEvent {
  final double keyboardHeight;
  
  const WebViewKeyboardShown(this.keyboardHeight);
  
  @override
  List<Object?> get props => [keyboardHeight];
}

class WebViewKeyboardHide extends WebViewEvent {}