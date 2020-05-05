# How to switch between the date range picker views in Flutter date range picker (SfDateRangePicker)?

In the flutter date range picker, you can navigate between the picker views. Switching between picker views has been achieved using the `view` property of DateRangePickerController and tapping the header of the picker views.

## Step 1:
In initState(), initialize the controller for date range picker.

```xml
DateRangePickerController _controller;
 
@override
void initState() {
  // TODO: implement initState
  _controller = DateRangePickerController();
  super.initState();
}
```
 

## Step 2:
Navigate between the picker views using the PopupMenuButton widget as follows. Also navigating between the picker views can be achieved by tapping the header of the picker views. 

```xml
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
```
## Step 3:
Place the calendar inside the body of the Scaffold widget.

```xml
body: Card(
  margin: const EdgeInsets.fromLTRB(50, 150, 50, 150),
  child: SfDateRangePicker(
    controller: _controller,
    view: DateRangePickerView.month,
  ),
)
```
