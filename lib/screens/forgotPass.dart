import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:chat_store/widgets/text_field.dart';
import 'package:chat_store/widgets/CommonButtons.dart';
import 'package:chat_store/screens/WelcomePage.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}
var emailControllerF= TextEditingController();

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: const Center(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                title: 'Email',
                inputType: TextInputType.emailAddress,
                visible: false,
                controller: emailControllerF,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonButton(buttonText: "Send Recovery Email",func: (){},btnAlign: Alignment.center,),
              const SizedBox(height: 10,),
              Center(
                child: RichText(
                    text: TextSpan(text: 'Back to Login',
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Welcome()),
                            );
                          }
                    )


                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}

