import 'package:equatable/equatable.dart';

abstract class WebViewState extends Equatable {
  const WebViewState();
  
  @override
  List<Object?> get props => [];
}

class WebViewInitial extends WebViewState {}

class WebViewLoading extends WebViewState {}

class WebViewLoaded extends WebViewState {}

class WebViewKeyboardVisible extends WebViewState {
  final double keyboardHeight;
  
  const WebViewKeyboardVisible(this.keyboardHeight);
  
  @override
  List<Object?> get props => [keyboardHeight];
}

class WebViewKeyboardHidden extends WebViewState {}