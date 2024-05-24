import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/login_store.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text_field.dart';
import 'list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = new LoginStore();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(builder: (_){
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: loginStore.isLoading ? false : true,
                      );
                    }),
                    const SizedBox(height: 16,),
                    Observer(builder: (_){
                      return CustomTextField(
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: !loginStore.passwordIsVisible,
                        onChanged: loginStore.setPassword,
                        enabled: loginStore.isLoading ? false : true,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: loginStore.passwordIsVisible ?   Icons.visibility : Icons.visibility_off ,
                          onTap: (){
                            loginStore.changeVisiblePassword();
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 16,),
                   Observer(
                     builder:(_){
                       return SizedBox(
                         height: 44,
                         child: ElevatedButton(

                           child: loginStore.isLoading ? CircularProgressIndicator(color: Colors.white, ) : Text('Login'),
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Theme.of(context).primaryColor,
                             disabledBackgroundColor: Theme.of(context).primaryColor.withAlpha(100),
                             textStyle: TextStyle(color: Colors.white, ),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(32),
                             ),
                           ),

                           onPressed: loginStore.loginPressed
                         ),
                       );
                     }
                   )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
