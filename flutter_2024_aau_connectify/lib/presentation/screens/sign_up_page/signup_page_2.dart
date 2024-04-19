import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/announcement%20page/announcement_user.dart';
import 'package:flutter_2024_aau_connectify/presentation/screens/user_Home.dart';
import 'package:flutter_2024_aau_connectify/presentation/style/paddings.dart';
import 'package:flutter_2024_aau_connectify/presentation/navigation/route.dart'
    as route;

class SignUp2 extends StatelessWidget {
  SignUp2({super.key});
  final TextEditingController _fieldController = TextEditingController();
  final TextEditingController _newpassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _secretController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Fill these fields to finish the registration',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w600))),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CustomPaddings.medium),
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          decoration: const InputDecoration(
                              label: Text('New password')),
                          controller: _newpassController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          decoration: const InputDecoration(
                              label: Text('Confirm password ')),
                          controller: _confirmPassController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          decoration: const InputDecoration(
                              label: Text('Field of Study')),
                          controller: _fieldController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          decoration:
                              const InputDecoration(label: Text('Secret Word')),
                          controller: _secretController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          decoration:
                              const InputDecoration(label: Text('Image link')),
                          controller: _imageController,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home()),
                        (Route<dynamic> route) => false);
                  },
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      minimumSize: const MaterialStatePropertyAll(
                          Size(double.infinity, 50))),
                  child: Text(
                    "Done",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
