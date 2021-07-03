import 'package:feater_flutter_app/utils/assets.dart';
import 'package:feater_flutter_app/utils/regex.dart';
import 'package:feater_flutter_app/widgets/custom_appbar.dart';
import 'package:feater_flutter_app/widgets/custom_layout.dart';
import 'package:feater_flutter_app/widgets/custom_textfields.dart';
import 'package:flutter/cupertino.dart';
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
      appBarType: AppBarType.TRANSPARENT,
      showReturnButton: true,
      returnButtonAction: () => SystemNavigator.pop(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            Container(
              width: double.infinity,
              child: Image.asset(background)
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
                    )
                  ],
                )
              ),
            )



          ],
        ),
      ),
    );

  }

}