import 'package:crypto_tracker/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final Function toggleScreen;

  const SignIn({Key? key, required this.toggleScreen}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: FittedBox(
          alignment: AlignmentDirectional.center,
          fit: BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'C R Y P T O',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Walkway',
                  color: Colors.greenAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 5),
              SizedBox(
                height: 45,
                width: 45,
                child: Image(image: AssetImage('assets/ic_launcher.png'),
                  fit: BoxFit.contain,
                  height: 45,
                ),
              ),
              SizedBox(width: 5),
              const Text(
                'S E E K E R',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Walkway',
                  color: Colors.greenAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
              alignment: Alignment.centerLeft,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            ),

        ),
        backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    style: TextStyle(color: Colors.grey[400]),
                    controller: _emailController,
                    validator: (val) => val!.isNotEmpty
                        ? null
                        : "Please enter an email address",
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    style: TextStyle(color: Colors.grey[400]),
                    controller: _passwordController,
                    validator: (val) => val!.length < 6
                        ? "Enter more than 6 char"
                        : null,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  MaterialButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        //print("Email: ${_emailController.text}");
                        //print("Email: ${_passwordController.text}");
                        await signInProvider.signIn(_emailController.text.trim(),
                                        _passwordController.text.trim());
                      }
                    },
                    height: 60,
                    minWidth: signInProvider.isLoading
                      ? null
                      : double.infinity,
                    color: Colors.grey[900],
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: signInProvider.isLoading
                      ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent))
                      : const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),),
                      const SizedBox(width: 5),
                      TextButton(
                          onPressed: () => widget.toggleScreen(),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.greenAccent,
                            ),
                          ),
                      ),
                    ],
                  ),
                  if(signInProvider.errorMessage != null)
                    Container(
                      color: Colors.greenAccent,
                      child: ListTile(
                          title: Text(signInProvider.errorMessage!,
                            style: const TextStyle(
                              color: Colors.black,
                            ),),
                          leading: const Icon(Icons.error),
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => signInProvider.setMessage(null),
                          )
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
