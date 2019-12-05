import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknotes/bloc/noteProvider.dart';
import 'package:quicknotes/widgets/notePopupMenu.dart';

class NoteEditorScreen extends StatefulWidget {
  @override
  _NoteEditorScreenState createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  //Note Status Flags
  bool isBookmarked = false;
  bool isSaved = false;

  // TextEditingControllers
  final _titleTextController = TextEditingController();
  final _contentTextController = TextEditingController();

  //note style
  var _fontSize;
  var _fontFamily;

  @override
  void initState() {
    _fontFamily = "Roboto-Regular";
    _fontSize = 20.0;
    super.initState();
  }

  @override
  void dispose() {
    _contentTextController.dispose();
    _titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Title"),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                  child: (isBookmarked)
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border)),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                   styleMenu(context).then((onVal){
                     print(onVal);
                     setState(() {
                       _fontSize = onVal[0];
                       _fontFamily = onVal[1];
                     });
                   });
                  },
                ),
              ),
            
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                    controller: _titleTextController,
                    style:
                        TextStyle(fontSize: 30.0, fontFamily: (_fontFamily != null)?_fontFamily:"Roboto-Regular"),
                    decoration: InputDecoration(hintText: "Enter Title"),
                    maxLines: 2,
                    maxLength: 50,
                  ),
                
                SizedBox(
                  height: 50.0,
                ),
                Expanded(
                  child: TextField(
                      controller: _contentTextController,
                      style: TextStyle(    
                        fontFamily:_fontFamily,
                        fontSize:_fontSize,       
                      ),
                      maxLines: 99999,
                      maxLength: 500,
                      scrollPhysics: BouncingScrollPhysics(),
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Enter Content"),
                    ),
                  ),
                
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Save"),
          icon: Icon(Icons.check),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}
