import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import 'package:read/base/model.dart';
import 'package:read/base/view.dart';
import 'package:read/components/button.dart';
import 'package:read/components/rounded_input_field.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:read/models/list_item.dart';
import 'package:read/models/user.dart';
import 'package:read/services/location_service.dart';
import 'package:read/viewmodels/auth_provider.dart';
import 'package:read/viewmodels/signup.dart';
import 'package:restcountries/restcountries.dart';

class UserLocation extends StatefulWidget {
  static final kInitialPosition = LatLng(30.0444, 31.2357);

  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "1"),
    ListItem(2, "2"),
    ListItem(3, "3"),
    ListItem(4, "4"),
    ListItem(5, "5"),
    ListItem(6, "6"),
    ListItem(7, "7"),
  ];

  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final pick_up_timesController = TextEditingController();
  final pick_up_daysController = TextEditingController();

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  List _myActivities;
  User _authenticatedUser;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  PickResult selectedPlace;

  final _key = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _k = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return BaseView<SignUpModel>(builder: (context, model, child) {
      return Scaffold(
        key: _k,
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : _location(model, context),
      );
    });
  }

  @override
  Widget _location(SignUpModel model, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            SizedBox(height: size.height * 0.1),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: <Widget>[
                  Text(
                    'LOCATION ',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    'PREF',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('When do you love to share the knowledge',
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedInputField(
              hintText: ' * Country',
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Container(
              width: size.width * 0.9,
              height: 50,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    //      value: _selectedItem,
                    hint: Text(' * City'),
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            RoundedInputField(
              hintText: ' * Street/Apartment',
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: MultiSelectFormField(
                  fillColor: Colors.white,
                  autovalidate: false,
                  titleText: ' * Preferable Pick Up Days',
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select one or more options';
                    }
                  },
                  dataSource: [
                    {
                      "display": "Monday",
                      "value": "Monday",
                    },
                    {
                      "display": "Tuesday",
                      "value": "Tuesday",
                    },
                    {
                      "display": "Wednesday",
                      "value": "Wednesday",
                    },
                    {
                      "display": "Thursday",
                      "value": "Thursday",
                    },
                    {
                      "display": "Friday",
                      "value": "Friday",
                    },
                    {
                      "display": "Saturday",
                      "value": "Saturday",
                    },
                    {
                      "display": "Sunday",
                      "value": "Sunday",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                  hintText: 'Please choose one or more',
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: MultiSelectFormField(
                  fillColor: Colors.white,
                  autovalidate: false,
                  titleText: ' * Preferable Pick Up Times',
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select one or more options';
                    }
                  },
                  dataSource: [
                    {
                      "display": "0:00",
                      "value": "0",
                    },
                    {
                      "display": "1:00",
                      "value": "1",
                    },
                    {
                      "display": "2:00",
                      "value": "2",
                    },
                    {
                      "display": "3:00",
                      "value": "3",
                    },
                    {
                      "display": "4:00",
                      "value": "4",
                    },
                    {
                      "display": "5:00",
                      "value": "5",
                    },
                    {
                      "display": "6:00",
                      "value": "6",
                    },
                    {
                      "display": "7:00",
                      "value": "7",
                    },
                    {
                      "display": "8:00",
                      "value": "8",
                    },
                    {
                      "display": "9:00",
                      "value": "9",
                    },
                    {
                      "display": "10:00",
                      "value": "10",
                    },
                    {
                      "display": "11:00",
                      "value": "11",
                    },
                    {
                      "display": "12:00",
                      "value": "12",
                    },
                    {
                      "display": "13:00",
                      "value": "13",
                    },
                    {
                      "display": "14:00",
                      "value": "14",
                    },
                    {
                      "display": "15:00",
                      "value": "15",
                    },
                    {
                      "display": "16:00",
                      "value": "16",
                    },
                    {
                      "display": "17:00",
                      "value": "17",
                    },
                    {
                      "display": "18:00",
                      "value": "18",
                    },
                    {
                      "display": "19:00",
                      "value": "19",
                    },
                    {
                      "display": "20:00",
                      "value": "20",
                    },
                    {
                      "display": "21:00",
                      "value": "21",
                    },
                    {
                      "display": "22:00",
                      "value": "22",
                    },
                    {
                      "display": "23:00",
                      "value": "23",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                  hintText: 'Please choose one or more',
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              height: 50,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30.0)),
              child: Center(
                child: TextFormField(
                  readOnly: true,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          body: PlacePicker(
                            apiKey: 'AIzaSyBF5pqj7Aji97vgQruDDNF8rgRVEtTC0Ww',
                            initialPosition: UserLocation.kInitialPosition,
                            useCurrentLocation: true,
                            selectInitialPosition: true,
                            //usePlaceDetailSearch: true,
                            onPlacePicked: (result) {
                              selectedPlace = result;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            //forceSearchOnZoomChanged: true,
                            //automaticallyImplyAppBarLeading: false,
                            //autocompleteLanguage: "ko",
                            //region: 'au',
                            //selectInitialPosition: true,
                            selectedPlaceWidgetBuilder:
                                (_, selectedPlace, state, isSearchBarFocused) {
                              print(
                                  "state: $state, isSearchBarFocused: $isSearchBarFocused");
                              return isSearchBarFocused
                                  ? Container()
                                  : FloatingCard(
                                      bottomPosition:
                                          0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                      leftPosition: 0.0,
                                      rightPosition: 0.0,
                                      width: 500,
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: state == SearchingState.Searching
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : RaisedButton(
                                              child: Text("Pick Here"),
                                              onPressed: () {
                                                //  IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                                //            this will override default 'Select here' Button.
                                                print(
                                                    "do something with [selectedPlace] data");
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                    );
                            },
                            // pinBuilder: (context, state) {
                            //   if (state == PinState.Idle) {
                            //     return Icon(Icons.favorite_border);
                            //   } else {
                            //     return Icon(Icons.favorite);
                            //   }
                            // },
                          ),
                        );
                      },
                    ),
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: " * Pick Location On Map",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Button(
              text1: 'Continue',
              height: 50,
              width: size.width * 0.9,
              color: Color.fromRGBO(250, 166, 26, 1),
              textcolor: Colors.white,
              textsize: 16,
              onTap: () async {
                if (_key.currentState.validate()) {
//                  String name = nameController.text;
//                  String defualts = '0';
//                  String user_id = '2';
//                  String country = countryController.text;
//                  String city = cityController.text;
//                  String address = addressController.text;
//                  String times = pick_up_timesController.text;
//                  String date = pick_up_daysController.text;

                  String name = 'home';
                  int defualt = 0;
                  String user_id = _authenticatedUser.id;
                  String country = 'egypt';
                  String city = 'cairo';
                  String address = 'st ahmed';
                  String times = '3:00';
                  String date = 'wednes';

                  bool success = await model
                      .addLocation(name,defualt,user_id,country,city,address,times,date)
                .timeout(Duration(seconds: 10), onTimeout: () {
                    return false;
                  });
                }
              },
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'Back to Reading Appetite',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(90, 90, 90, 1),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
