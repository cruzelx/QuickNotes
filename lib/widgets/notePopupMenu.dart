import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknotes/bloc/noteProvider.dart';

Future<List<dynamic>> styleMenu(BuildContext context) async {
  return await showDialog<List<dynamic>>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text("Style Menu"),
        backgroundColor: Color(0xfffbfaf8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        children: <Widget>[
          MenuContent(),
        ],
      );
    },
  );
}

class MenuContent extends StatefulWidget {
  @override
  _MenuContentState createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  double _sliderVal = 20.0;
  String defaultFontFamily;
  List<String> _fontFamilies = [];

  @override
  void initState() {
    super.initState();
    _fontFamilies.addAll([
      "Alef-Regular",
      "AmaticSC-Regular",
      "Chewy-Regular",
      "DancingScript-VariableFont_wght",
      "IndieFlower-Regular",
      "Roboto-Regular",
      "Lobster-Regular",
      "Montserrat-Regular",
      "PTSerif-Regular",
      "RobotoMono-Regular",
      "JosefinSans-Regular"
    ]);
    defaultFontFamily = _fontFamilies.elementAt(5);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 10.0),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Font Size: "),
                Row(
                  children: <Widget>[
                     Slider(
                        value: _sliderVal,
                        min: 15.0,
                        max: 40.0,
                        divisions: 25,
                        activeColor: Theme.of(context).primaryColor,
                        inactiveColor: Colors.grey,
                        label: "$_sliderVal",
                        onChanged: (double newVal) {
                          setState(() {
                            _sliderVal = newVal;
                           
                          });
                        },
                      ),
                    
                    Text("$_sliderVal"),
                  ],
                ),
                Text("Font Family: "),
                 DropdownButton(
                    value: defaultFontFamily,
                    items: _fontFamilies.map((String fontFamily) {
                      return DropdownMenuItem(
                        value: fontFamily,
                        child: Text("$fontFamily"),
                      );
                    }).toList(),
                    onChanged: (String newVal) {
                      setState(() {
                        defaultFontFamily = newVal;
                        
                      });
                    },
                  ),
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Okay",
                ),
                onPressed: () {
                  Navigator.of(context).pop([_sliderVal,defaultFontFamily]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
