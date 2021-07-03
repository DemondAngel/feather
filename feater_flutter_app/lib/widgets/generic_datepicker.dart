import 'package:feater_flutter_app/utils/datetime_converter.dart';
import 'package:flutter/material.dart';

typedef DateChangedCallback(DateTime time);

// ignore: must_be_immutable
class GenericDatePicker extends StatefulWidget {

  final DateTime firstDate;
  final DateTime lastDate;
  DateChangedCallback? onChange;
  DateTime selectedTime;

  GenericDatePicker({required this.selectedTime, required  this.firstDate, required this.lastDate, Key? key, @required this.onChange}) : super(key: key);

  @override
  _GenericDatePickerState createState() => _GenericDatePickerState();
}

class _GenericDatePickerState extends State<GenericDatePicker> {
  
  _changeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedTime,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      helpText: "Dias disponibles",
      locale: Locale("es", "MX"),
      builder: (context, widget){
        return Theme(
          data:Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.grey,
              onBackground: Colors.green,
              onSecondary: Colors.yellow,
              error: Colors.blue,
            ),
            dialogTheme: DialogTheme(
              backgroundColor: Color(0xFFE5E5E5),
            ),
          ),
          child: widget!,
        );
      }
    );
    if (picked != null && picked != widget.selectedTime) {
      setState(() {
        widget.onChange!(picked);
        widget.selectedTime = picked;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    widget.selectedTime ??= DateTime.now();
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Color(0xFF474747),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                child: Icon(Icons.calendar_today), //TODO: Icon
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Theme.of(context).primaryColor, width: 2))
                ),
                padding: EdgeInsets.symmetric(vertical:20,horizontal: 15),
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: TextButton(
                onPressed: () => _changeDate(context),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 12, top: 20, bottom: 20),
                  child: Text(
                    DateTimeConverter.longDateConversion(widget.selectedTime),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))), 
                  padding: EdgeInsets.zero
                ),
              ),
            )
          ]
        ),
      );
  }


}