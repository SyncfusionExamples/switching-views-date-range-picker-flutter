import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(PickerView());

class PickerView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: CalendarPickerView(),
    );
  }
}

class CalendarPickerView extends StatefulWidget {
  @override
  _CalendarPickerViewState createState() => _CalendarPickerViewState();
}

List<String> views = <String>['Month', 'Year', 'Decade', 'Century'];

class _CalendarPickerViewState extends State<CalendarPickerView> {
  DateRangePickerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = DateRangePickerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton<String>(
            icon: Icon(Icons.calendar_today),
            itemBuilder: (BuildContext context) => views.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            onSelected: (String value) {
              if (value == 'Month') {
                _controller.view = DateRangePickerView.month;
              } else if (value == 'Year') {
                _controller.view = DateRangePickerView.year;
              } else if (value == 'Decade') {
                _controller.view = DateRangePickerView.decade;
              } else if (value == 'Century') {
                _controller.view = DateRangePickerView.century;
              }
            },
          ),
        ),
        body: Card(
          margin: const EdgeInsets.fromLTRB(50, 150, 50, 150),
          child: SfDateRangePicker(
            controller: _controller,
            view: DateRangePickerView.month,
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
