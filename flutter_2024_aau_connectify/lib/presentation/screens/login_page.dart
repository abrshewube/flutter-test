import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_2024_aau_connectify/presentation/provides/providers.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/radiuses.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _login() async {
  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();

  if (email.isNotEmpty && password.isNotEmpty) {
    try {
      final userLoginControllerNotifier = ref.read(userLoginController.notifier);
      bool success = false;

      // Perform the login operation
      try {
        success = await userLoginControllerNotifier.loginUser(email, password);
      } catch (e) {
        // Log the error or handle it appropriately
        print('Login failed: $e');
      }

      // Check if the widget is still mounted before updating the UI
      if (mounted && success) {
        Navigator.pushReplacementNamed(context, homeRoute); // Navigate to Home on success
      } else {
        // Handle unsuccessful login
        // Optionally show error message
      }
    } catch (_) {} // Catch any errors thrown by the try-catch blocks above
  } else {
    // Handle empty fields if needed
  }
}


  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Make the content scrollable
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomPaddings.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: CustomPaddings.large), // Add top padding
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: CustomPaddings.large),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: CustomPaddings.small),
                        child: CircleAvatar(
                          backgroundColor: CustomColors.backgroundColor,
                          radius: CustomRadius.ultimateLarge,
                          backgroundImage: AssetImage('assets/images/aau_logo.png'),
                        ),
                      ),
                      Text(
                        "AAU Connectify",
                        style: _textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: CustomPaddings.extraUltraLarge,
                      ),
                      Text(
                        "Login To Your Account",
                        style: _textTheme.titleLarge,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(CustomPaddings.large),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      hintText: "Email",
                                      contentPadding: EdgeInsets.all(CustomPaddings.medium),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: CustomPaddings.medium,
                                  ),
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(right: CustomPaddings.small),
                                        child: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            color: CustomColors.primaryColor,
                                          ),
                                          onPressed: _togglePasswordVisibility,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.all(CustomPaddings.medium),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: CustomPaddings.extraUltraLarge,
                            ),
                            Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, resetPasswordRoute);
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: _textTheme.labelLarge!.copyWith(
                                      color: CustomColors.primaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: CustomPaddings.small,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  onPressed: _login,
                                  child: Text(
                                    "Login",
                                    style: _textTheme.labelLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: CustomPaddings.small,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don't have an account?"),
                                    TextButton(
                                      onPressed: () => Navigator.pushNamed(context, signupRoute),
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: CustomColors.primaryColor,
                                          fontSize: CustomFontSize.h6,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
