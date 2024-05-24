import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  _LoginStore(){
    autorun((_){
      print(email);
      print(password);
    });
  }
  @observable
  String email = '';

  @action
  void setEmail(String value){
    email = value;
  }

  @observable
  String password = '';

  @observable
  bool passwordIsVisible = false;

  @action
  void changeVisiblePassword(){
    passwordIsVisible = !passwordIsVisible;
  }

  @action
  void setPassword(String value){
    password = value;
  }


  @observable
  bool isLoading = false;

  @action
  Future<void> login() async{ //SEMPRE QUE TRABALHAR COM ASYNC COLOQUE FUTURE NO METODO VOID, CASO CONTRÁRIO GERARÁ UM ERRO NO CÓDIGO GERADO
    isLoading = true;

   await Future.delayed(Duration(seconds:2 ),);

    isLoading = false;
  }



  @computed
  bool get isEmailValid => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);


  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  @computed //todos computed deve ser get, caso contrário não irá funcionar.
  dynamic Function() get loginPressed =>
      (isEmailValid && isPasswordValid && !isLoading) ? login : () { return null;};
}
