import 'package:bw_task_bloc/widgets/webview/logout_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bw_task_bloc/bloc/auth/auth_bloc.dart';
import 'package:bw_task_bloc/bloc/auth/auth_event.dart';
import 'package:bw_task_bloc/screens/phone_screen.dart';

class WebViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  const WebViewAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _handleLogout(BuildContext context) {
    LogoutConfirmationDialog.show(
      context: context,
      onConfirm: () {
        context.read<AuthBloc>().add(AuthLogoutRequested());
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PhoneScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () => _handleLogout(context),
      ),
    );
  }
}