import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:studies/_common/colors.dart';
import 'package:studies/_common/snackbar.dart';
import 'package:studies/components/decoration_input.dart';
import 'package:studies/service/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool authenticated = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.2,
                  1
                ],
                    colors: [
                  Color(0XFF31E981),
                  Color(0xFF00120B),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          "assets/todo.png",
                          height: 128,
                        ),
                        const Text(
                          'Fastask',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: getDecorationInput('Email'),
                          validator: (String? value) {
                            if (value == null) {
                              return "O e-mail não pode ser vazio";
                            }

                            if (!value.contains('@')) {
                              return 'E-mail inválido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          decoration: getDecorationInput('Senha'),
                          validator: (String? value) {
                            if (value == null) {
                              return "A senha não pode ser vazio";
                            }

                            if (value.length < 5) {
                              return 'A senha é muito curta';
                            }

                            return null;
                          },
                          obscureText: true,
                        ),
                        const SizedBox(height: 8),
                        Visibility(
                            visible: !authenticated,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  decoration: getDecorationInput('Nome'),
                                  validator: (String? value) {
                                    if (value == null) {
                                      return "O nome não pode ser vazio";
                                    }

                                    if (value.length < 5) {
                                      return 'O nome é muito curto';
                                    }

                                    return null;
                                  },
                                ),
                              ],
                            )),
                        const SizedBox(height: 32),
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 1],
                              colors: [
                                Color(0xFF00120B),
                                Color(0XFF31E981),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: TextButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    authenticated ? 'Login' : 'Cadastrar',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                onPressSign();
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              authenticated = !authenticated;
                            });
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text((authenticated)
                              ? 'Ainda não tem uma conta? Cadastre-se!'
                              : 'Já tem uma conta? Entre'),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPressSign() {
    String email = _emailController.text;
    String name = _nameController.text;
    String password = _passwordController.text;
    bool formHasValidated = _formKey.currentState!.validate();

    if (formHasValidated) {
      if (authenticated) {
        _authService
            .signUser(email: email, password: password)
            .then((String? error) {
          if (error != null) {
            showSnackBar(context: context, text: error);
          }
        });
      } else {
        _authService
            .registerUser(email: email, name: name, password: password)
            .then((String? erro) => {
                  if (erro != null) {showSnackBar(context: context, text: erro)}
                });
      }
    } else {
      print('form invalido');
    }
  }
}
