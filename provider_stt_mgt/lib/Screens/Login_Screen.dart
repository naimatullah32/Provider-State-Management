

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stt_mgt/Provider/login_auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController=TextEditingController();
TextEditingController passController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider=Provider.of<authProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Authorization"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: loginProvider.isVisible,
              controller: passController,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    loginProvider.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: loginProvider.toggleVisibility,
                ),
              ),
            ),
            SizedBox(height: 55,),
            InkWell(
              onTap: (){
                loginProvider.login(emailController.text.toString(),
                    passController.text.toString());
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: loginProvider.loading ? CircularProgressIndicator(): Text("Login",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
