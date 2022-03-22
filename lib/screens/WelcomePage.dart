import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:chat_store/screens/forgotPass.dart';
import 'package:chat_store/screens/homeScreen.dart';
import 'Signup.dart';
import 'package:chat_store/widgets/text_field.dart';
import 'package:chat_store/widgets/CommonButtons.dart';



class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.green,
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60,),
              const Center(
                child: Text("ChatStore",textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60,
                      color: Colors.white),),
              ),
               const SizedBox(height: 60,),
              CustomTextField(
                title: 'Email',
                inputType: TextInputType.emailAddress,
                visible: false,
                controller: emailController,

              ),
              const SizedBox(
                height: 20,
              ),
              // buildEmailField(),
              CustomTextField(
                title: 'Password',
                visible: true,
                controller: passController,
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.only(right:20),
                alignment: Alignment.topRight,
                child: RichText(
                  text:  TextSpan(text: "Forgot Password?",
                  style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ForgotPass()),
                          );
                        }),
                ),
              ),
              const SizedBox(height: 20,),
              CommonButton(buttonText: "Sign in",func: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );

              },btnAlign: Alignment.center,),
              const SizedBox(height: 10,),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: ' Sign up',
                            style: const TextStyle(color: Colors.white, fontSize: 18,
                            fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Signup()));
                              }
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
