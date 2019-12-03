import 'package:flutter/material.dart';
import 'package:quicknotes/widgets/notePopupMenu.dart';
import 'package:speech_recognition/speech_recognition.dart';

class NoteEditorScreen extends StatefulWidget {
  @override
  _NoteEditorScreenState createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  //Note Status Flags
  bool isBookmarked = false;
  bool isSaved = false;

  //Speech Status Flag
  bool _isAvailable = false;
  bool _isListening = false;

  // TextEditingControllers
  final _titleTextController = TextEditingController();
  final _contentTextController = TextEditingController();

  //SpeechRecognition controller
  SpeechRecognition _speechRecognition;

  void initSpeechRecognition() {
    _speechRecognition = SpeechRecognition();

    //Available
    _speechRecognition.setAvailabilityHandler(
        (bool res) => setState(() => _isAvailable = res));

    //Listening start
    _speechRecognition.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));

    //Listening stop
    _speechRecognition.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false));

    //Obtain text
    _speechRecognition.setRecognitionResultHandler(
        (String text) => setState(() => _contentTextController.text = text));

    //Launch
    _speechRecognition
        .activate()
        .then((res) => setState(() => _isAvailable = res));
  }

  @override
  void dispose() {
    _contentTextController.dispose();
    _titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("SAVE"),
                  ],
                )),
          ),
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
                styleMenu(context);
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
                style: TextStyle(fontSize: 30.0),
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
        label: Text("Speak"),
        icon: Icon(Icons.mic),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
