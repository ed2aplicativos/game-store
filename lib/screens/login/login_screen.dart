import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:new_game_store/models/user.dart';
import 'package:new_game_store/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:new_game_store/helpers/validators.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Entrar'),
          centerTitle: true,
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/signup');
              },
              child: const Text(
                'CRIAR CONTA',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
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
                builder: (_, userManager, child){
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
                        validator: (email){
                          if(!emailValid(email))
                            return 'E-mail inválido';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      TextFormField(
                        controller: passController,
                        enabled: !userManager.loading,
                        decoration: const InputDecoration(hintText: 'Senha'),
                        autocorrect: false,
                        obscureText: true,
                        validator: (pass){
                          if(pass.isEmpty || pass.length < 6)
                            return 'Senha inválida';
                          return null;
                        },
                      ),
                      child,
                      const SizedBox(height: 16,),
                      ElevatedButton(
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState.validate()){
                            userManager.signIn(
                                user: User(
                                    email: emailController.text,
                                    password: passController.text
                                ),
                                onFail: (e){
                                  scaffoldMessengerKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Falha ao entrar: $e',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                },
                                onSuccess: (){
                                  Navigator.of(context).pop();
                                }
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 4, 125, 141),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: userManager.loading ?
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ) :
                        const Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                      ),
                      SignInButton(
                        Buttons.Facebook,
                        text: 'Entrar com Facebook',
                        onPressed: (){
                          userManager.facebookLogin();
                        },
                      ),
                      SignInButton(
                        Buttons.Google,
                        onPressed: (){
                          userManager.googleLogin();
                        },
                      ),
                    ],
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: TextButton(
                      onPressed: (){

                      },
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          color: Color.fromARGB(255, 4, 125, 141),
                        ),
                      ),
                    ),
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
