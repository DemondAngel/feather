import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class CustomTextField extends StatefulWidget {

  final bool isPassword;
  final bool isDatePicker;
  final String? labelText;
  final bool withoutOutlineBorder;
  final Function()? closeButton;
  final String? regex;
  final int? maxLength;
  final String? errorMessage;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextInputType? textInputType;
  final AutovalidateMode autovalidateMode;
  final bool showCharNumber;
  final Function()? onPressedDatePicker;
  final bool isCopy;
  final String textToClip;

  CustomTextField({this.isPassword = false, this.labelText, this.withoutOutlineBorder = false, this.closeButton, this.regex, this.maxLength, this.errorMessage,
    this.onChanged, this.onSubmitted, this.controller, this.focusNode, this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none, this.textInputType, this.autovalidateMode = AutovalidateMode.always,
    this.showCharNumber = false, this.isDatePicker = false, this.onPressedDatePicker, this.isCopy = false, this.textToClip = ""});

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();

}

class _CustomTextFieldState extends State<CustomTextField>{

  late bool showPassword;

  @override
  void initState() {

    if(this.widget.isPassword)
      showPassword = true;
    else
      showPassword = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context){

    Widget textFormWidget = Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 10,
      ),
      child: TextFormField(
        onChanged: this.widget.onChanged,
        obscureText: showPassword,
        controller: this.widget.controller,
        focusNode: this.widget.focusNode,
        maxLength: this.widget.maxLength,
        onFieldSubmitted: this.widget.onSubmitted,
        textInputAction: this.widget.textInputAction,
        keyboardType: this.widget.textInputType,
        textCapitalization: this.widget.textCapitalization,
        autovalidateMode: this.widget.autovalidateMode,
        enabled: !this.widget.isDatePicker,
        validator: (value){
          RegExp exp = RegExp("${this.widget.regex}");
          Iterable<RegExpMatch> matches = exp.allMatches(value!);

          if(matches.isEmpty)
            return widget.errorMessage;
          else
            return null;

        },
        decoration: InputDecoration(
            labelText: this.widget.labelText,
            suffixIcon: this.widget.isCopy ? IconButton(
                icon: Icon(Icons.share), //TODO: Icon
                onPressed: () =>
                  WcFlutterShare.share(
                      sharePopupTitle: 'Share',
                      subject: 'Codigo Referrido',
                      text: '${this.widget.textToClip}',
                      mimeType: 'text/plain'),
                padding: EdgeInsets.zero
            ):this.widget.isDatePicker ? Icon(Icons.calendar_today_outlined) : this.widget.isPassword ?  IconButton( //TODO: Icon
              icon: showPassword ? Icon(Icons.remove_red_eye_rounded): Icon(Icons.remove_red_eye_outlined), //TODO: Icon
              autofocus: false,
              focusNode: null,
              onPressed: () => setState(() => showPassword = !showPassword),
              padding: EdgeInsets.zero,
            ): this.widget.closeButton != null ? IconButton(
                icon: Icon(Icons.cancel_outlined), //TODO: Icon
                onPressed: this.widget.closeButton,
                padding: EdgeInsets.zero
            ): null,
            border: this.widget.withoutOutlineBorder ? OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8),
            ): null,
            enabledBorder: this.widget.withoutOutlineBorder ? OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8),
            ): null,
            disabledBorder: this.widget.withoutOutlineBorder ? OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8),
            ): null,
            focusedBorder: this.widget.withoutOutlineBorder ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  width: 1,
                  color: Colors.transparent
              ),
            ): null,
            counterText: !this.widget.showCharNumber ? "": null
        ),
      ),
    );

    return this.widget.isDatePicker ? TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)
      ),
      onPressed: this.widget.onPressedDatePicker,
      child: textFormWidget
    ): textFormWidget;

  }

}