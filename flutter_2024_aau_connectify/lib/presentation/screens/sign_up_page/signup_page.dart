import 'package:flutter/material.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/colors.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/typography.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart'
    as route;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

void main() {
  runApp(const SignUp());
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentPasswordController =
      TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customtext = Theme.of(context).textTheme;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 200,
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/aau_logo.png'),
                  width: 150,
                  height: 120,
                ),
                Text('AAU Connectify',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: CustomColors.primaryTextColor,
                        ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'Sign Up',
              style: customtext.headlineMedium,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: CustomPaddings.medium),
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      decoration: const InputDecoration(label: Text('Name')),
                      controller: _nameController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      decoration: const InputDecoration(label: Text('ID')),
                      controller: _idController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      decoration: const InputDecoration(
                          label: Text('Student Password')),
                      controller: _studentPasswordController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      decoration:
                          const InputDecoration(label: Text('User Name')),
                      controller: _usernameController,
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, route.signupRoute2);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: CustomFontSize.h4),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(" have an account already?"),
                  TextButton(
                      onPressed: () => (Navigator.pushNamed(
                          context, route.landingpageRoute)),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            color: CustomColors.primaryColor,
                            fontSize: CustomFontSize.h6,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
