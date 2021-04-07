import 'package:new_game_store/models/user.dart';
import 'package:new_game_store/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:new_game_store/helpers/validators.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(right: 8),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            child: const Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, child) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if (!emailValid(email)) return 'E-mail inválido';
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass) {
                        if (pass.isEmpty || pass.length < 6)
                          return 'Senha inválida';
                        return null;
                      },
                    ),
                    child,
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          onSurface:
                              Theme.of(context).primaryColor.withAlpha(100),
                        ),
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  userManager.signIn(
                                      user: User(
                                        email: emailController.text,
                                        password: passController.text,
                                      ),
                                      onFail: (e) {
                                        scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text('Falha ao entrar: $e'),
                                          backgroundColor: Colors.red,
                                        ));
                                      },
                                      onSuccess: () {
                                        Navigator.of(context).pop();
                                      });
                                }
                              },
                        /*color: ,
                        disabledColor:

                        textColor: Colors.white,*/
                        child: userManager.loading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    )
                  ],
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Esqueci minha senha',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
