import 'package:flutter/material.dart';

class BackdropMenu extends StatefulWidget {
  @override
  _BackdropMenuState createState() => _BackdropMenuState();
}

class _BackdropMenuState extends State<BackdropMenu> {
  bool isSwitched = false;
  double _sliderVal = 18.0;
  String _fontFamily;
  List<String> _fontFamilies = [];

  @override
  void initState() {
    _fontFamilies.addAll([
      "Alef",
      "AmaticSC",
      "Chewy",
      "DancingScript",
      "IndieFlower",
      "Roboto",
      "Lobster",
      "Montserrat",
      "PTSerif",
      "RobotoMono",
      "JosefinSans"
    ]);
    _fontFamily = _fontFamilies.elementAt(5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Bookmark",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              Switch(
                value: isSwitched,
                activeColor: Colors.pink,
                onChanged: (val) {
                  print(val);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Font Size",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              Slider(
                value: _sliderVal,
                min: 15.0,
                max: 35.0,
                divisions: 20,
                activeColor: Colors.pink,
                inactiveColor: Colors.white,
                label: "$_sliderVal",
                onChanged: (newVal) {
                  setState(() {
                    _sliderVal = newVal;
                  });
                },
              ),
              //  Text("$_sliderVal",style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Font Family",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              DropdownButton(
                value: _fontFamily,
                items: _fontFamilies.map((String fontFamily) {
                  return DropdownMenuItem(
                    value: fontFamily,
                    child: SizedBox(
                      height: 20.0,
                      width: 70.0,
                      child: Container(
                        color: Colors.pink,
                        child: Text("$fontFamily"),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String newVal) {
                  setState(() {
                    _fontFamily = newVal;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
