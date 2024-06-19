import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/radiuses.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart' as route;
import 'package:flutter_2024_aau_connectify/presentation/service/api_service.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _studentPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();

  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    final customText = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              style: customText.headlineSmall,
            ),
            const SizedBox(
              height: CustomPaddings.extraLarge,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomPaddings.medium),
                child: ListView(
                  children: _buildStepContent(customText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStepContent(TextTheme customText) {
    switch (_currentStep) {
      case 1:
        return [
          Container(
            margin: const EdgeInsets.symmetric(vertical: CustomPaddings.small),
            child: Text(
              "Step 1: Verify Student",
              style: customText.headlineMedium, // Adjust text style as needed
            ),
          ),
          _buildTextField('ID', _idController),
          _buildTextField('Student Password', _studentPasswordController),
          _buildButton('Verify', _verifyStudent),
        ];
      case 2:
        return [
          Container(
            margin: const EdgeInsets.symmetric(vertical: CustomPaddings.small),
            child: Text(
              "Step 2: Register User",
              style: customText.headlineMedium, // Adjust text style as needed
            ),
          ),
          _buildTextField('Name', _nameController),
          _buildTextField('Email', _emailController),
          _buildTextField('Password', _passwordController),
          _buildButton('Register', _registerUser),
        ];
      case 3:
        return [
          Container(
            margin: const EdgeInsets.symmetric(vertical: CustomPaddings.small),
            child: Text(
              "Step 3: Verify Email",
              style: customText.headlineMedium, // Adjust text style as needed
            ),
          ),
          _buildTextField('Verification Code', _verificationCodeController),
          _buildButton('Verify', _verifyEmail),
        ];
      default:
        return [];
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: CustomPaddings.small),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: CustomPaddings.medium),
          labelText: label,
        ),
        controller: controller,
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.primaryColor,
          foregroundColor: CustomColors.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle: const TextStyle(
            fontSize: 18, // Adjust text style as needed
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(text),
      ),
    );
  }

Future<void> _verifyStudent() async {
  final studentId = _idController.text;
  final studentPassword = _studentPasswordController.text;

  print('Verifying student with ID: $studentId');

  try {
    final authService = ref.read(authServiceProvider);
    final studentExists = await authService.checkStudentExistence(studentId, studentPassword);

    print('Student exists result: $studentExists');

    if (studentExists) {
      setState(() {
        _currentStep = 2;
      });
    } else {
      _showErrorMessage('Student verification failed.');
    }
  } catch (e) {
    print('Error in _verifyStudent: $e');
    _showErrorMessage('Error: $e');
  }
}


  Future<void> _registerUser() async {
    final fullName = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final studentId = _idController.text;
    final studentPassword = _studentPasswordController.text;

    try {
      final authService = ref.read(authServiceProvider); // Accessing authServiceProvider using ref.read
      final success = await authService.registerUser(fullName, email, password, studentId, studentPassword);

      if (success) {
        setState(() {
          _currentStep = 3;
        });
      } else {
        _showErrorMessage('User registration failed.');
      }
    } catch (e) {
      _showErrorMessage('Error: $e');
    }
  }

  Future<void> _verifyEmail() async {
    final email = _emailController.text;
    final code = _verificationCodeController.text;

    try {
      final authService = ref.read(authServiceProvider); // Accessing authServiceProvider using ref.read
      final success = await authService.verifyEmail(email, code);

      if (success) {
        Navigator.pushNamed(context, route.homeRoute); // Assuming route.homeRoute is correctly defined
      } else {
        _showErrorMessage('Email verification failed.');
      }
    } catch (e) {
      _showErrorMessage('Error: $e');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
