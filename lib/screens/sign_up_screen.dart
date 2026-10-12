import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/locale/locale_cubit.dart';
import '../blocs/theme/theme_bloc.dart';
import '../blocs/theme/theme_event.dart';
import '../l10n/app_localizations.dart';
import '../utils/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmation = TextEditingController();
  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmation.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final l10n = AppLocalizations.of(context)!;
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        content: Text(l10n.accountCreated),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
    if (mounted) Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: l.language,
            onPressed: () => context.read<LocaleCubit>().toggle(),
            icon: const Icon(Icons.language),
          ),
          IconButton(
            tooltip: l.theme,
            onPressed: () => context.read<ThemeBloc>().add(const ToggleTheme()),
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width > 600 ? 420 : width),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 72,
                    color: Color(0xFF9775FA),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    l.signUp,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 28),
                  TextFormField(
                    controller: _name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: l.fullName,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      final name = v?.trim() ?? '';
                      if (name.isEmpty) return l.requiredName;
                      if (!RegExp(r'^[A-Z]').hasMatch(name))
                        return l.capitalName;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: l.email,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      final email = v?.trim() ?? '';
                      if (email.isEmpty) return l.requiredEmail;
                      if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                          .hasMatch(email))
                        return l.invalidEmail;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: l.password,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return l.requiredPassword;
                      if (v.length < 6) return l.shortPassword;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmation,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: l.confirmPassword,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return l.requiredConfirmation;
                      if (v != _password.text) return l.passwordMismatch;
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _submit,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(l.createAccount),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
