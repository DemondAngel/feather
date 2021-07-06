import 'package:feater_flutter_app/Users/view/widgets/social_buttons.dart';
import 'package:feater_flutter_app/utils/assets.dart';
import 'package:feater_flutter_app/utils/regex.dart';
import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_layout.dart';
import 'package:feater_flutter_app/widgets/custom_textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginStateScreen();

}

class _LoginStateScreen extends State<LoginScreen>{

  late TextEditingController _txtEmail;
  late TextEditingController _txtPass;

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


  @override
  Widget build(BuildContext context) {

    return CustomLayout(
      appBarType: AppBarType.MODULE,
      showReturnButton: true,
      returnButtonAction: () => SystemNavigator.pop(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                              onPressed: () => print('Va a iniciar sesión'),
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
        )
      ),
    );

  }

}