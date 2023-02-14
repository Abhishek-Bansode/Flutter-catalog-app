import 'package:flutter/material.dart';
// import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(milliseconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      // color: Colors.white,
      // color: context.canvasColor,

      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png", fit: BoxFit.cover),
              const SizedBox(
                height: 20.0,
              ),
              Text("Welcome $name",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      // fontSize: size.width * 0.1,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: context.accentColor)

                  // style: const TextStyle(
                  //   color: Colors.blue,
                  //   fontSize: 28,
                  //   // color: ,
                  //   fontWeight: FontWeight.bold,
                  // ),

                  ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    // creating new logPage design from here
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email or Phone number",
                          // labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          // color: Theme.of(context).primaryColorLight,
                          color: Theme.of(context).primaryColorLight,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Password",
                          // labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Forgot Password?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: context.accentColor),
                    ),

                    // TextFormField(

                    //   decoration: const InputDecoration(
                    //     hintText: "Enter Username",
                    //     labelText: "Username",
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Username cannot be empty";
                    //     }
                    //     return null;
                    //   },
                    //   onChanged: (value) {
                    //     name = value;
                    //     setState(() {});
                    //   },
                    // ),
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: const InputDecoration(
                    //     hintText: "Enter Password",
                    //     labelText: "Password",
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Password cannot be empty";
                    //     } else if (value.length < 6) {
                    //       return "Password length should be atleast 6";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changeButton ? 60 : 150,
                          height: 50,
                          // color: Colors.deepPurple,
                          alignment: Alignment.center,

                          child: changeButton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
