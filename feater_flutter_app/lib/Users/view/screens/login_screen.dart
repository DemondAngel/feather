import 'package:feater_flutter_app/Users/bloc/user_bloc.dart';
import 'package:feater_flutter_app/Users/model/user.dart';
import 'package:feater_flutter_app/Users/view/widgets/social_buttons.dart';
import 'package:feater_flutter_app/utils/assets.dart';
import 'package:feater_flutter_app/utils/regex.dart';
import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_layout.dart';
import 'package:feater_flutter_app/widgets/custom_snackbar.dart';
import 'package:feater_flutter_app/widgets/custom_textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginStateScreen();

}

class _LoginStateScreen extends State<LoginScreen>{

  late TextEditingController _txtEmail;
  late TextEditingController _txtPass;
  late UserBloc _userBloc;

  @override
  void initState() {

    _txtEmail = TextEditingController();
    _txtPass = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _txtEmail.dispose();
    _txtPass.dispose();

    super.dispose();
  }

  validateForm(context, runMutation){

    if(Form.of(context)!.validate()){

      User user = User(email: _txtEmail.text, password: _txtPass.text);
      runMutation(user.toLoginMutate());
    }
    else{
      showCustomSnackBar(context, 'Verifique su formulario', SnackBarStyle.ALERT);
    }

  }

  onCompleted(data){
    if(data != null){
      _userBloc.saveToken(data['login']['jwt']);
      _userBloc.saveUser(User.fromJson(data['login']['user']));
      Navigator.of(context).pushNamed('/products');
    }
  }

  onError(error){

  }

  @override
  Widget build(BuildContext context) {

    _userBloc = BlocProvider.of<UserBloc>(context);

    return CustomLayout(
      appBarType: AppBarType.MODULE,
      showReturnButton: true,
      returnButtonAction: () => SystemNavigator.pop(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GraphQLProvider(
          client: _userBloc.client,
          child: Mutation(
            options: _userBloc.mutationOptionsLogin(onCompleted, onError),
            builder: (runMutation, result){

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [

                    Container(
                        width: double.infinity,
                        height: 250,
                        child: Image.asset(logo)
                    ),

                    Form(
                      child: Builder(
                          builder: (BuildContext context) => Column(
                            children: [
                              CustomTextField(
                                controller: _txtEmail,
                                textInputType: TextInputType.emailAddress,
                                isPassword: false,
                                isDatePicker: false,
                                showCharNumber: false,
                                maxLength: 300,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                errorMessage: 'Favor de colocar correctamente su email',
                                regex: Regex.email,
                                labelText: 'Email',
                              ),
                              CustomTextField(
                                controller: _txtPass,
                                textInputType: TextInputType.visiblePassword,
                                isPassword: true,
                                isDatePicker: false,
                                showCharNumber: false,
                                maxLength: 300,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                errorMessage: 'Favor de colocar correctamente su email',
                                regex: Regex.todo,
                                labelText: 'Password',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Flexible(
                                      flex: 6,
                                      child: GestureDetector(
                                        onTap: () => Navigator.of(context).pushReplacementNamed('/user/register'),
                                        child: Text(
                                          'Registrarse',
                                          style: Theme.of(context).textTheme.bodyText2,
                                        ),
                                      )
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () => validateForm(context, runMutation),
                                      child: Text(
                                        'Iniciar sesión',
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      )
                                  )
                              ),
                              Container(
                                  width: double.infinity,
                                  child: SocialButtons.facebook()
                              ),
                              Container(
                                  width: double.infinity,
                                  child: SocialButtons.google()
                              ),
                            ],
                          )
                      ),
                    )



                  ],
                ),
              );
            },
          )
        )
      ),
    );

  }

}