import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:formatted_text/formatted_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, child) => Portal(child: child!),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FormattedText(
            'helo @[nas:61as61fsa] (__fayeedP__) #good# ~adfadf~',
          ),
          TextButton(
            child: Text('Get Text'),
            onPressed: () {
              print(key.currentState!.controller!.markupText);
            },
          ),
          Container(
            child: FlutterMentions(
              key: key,
              suggestionPosition: SuggestionPosition.Top,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(hintText: 'hello'),
              enableInteractiveSelection: true,
              mentions: [
                Mention(
                    trigger: '@',
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                    data: [
                      {
                        'id': '61as61fsa',
                        'display': 'fayeedP',
                        'full_name': 'Fayeed Pawaskar',
                        'photo':
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                      },
                      {
                        'id': '61asasgasgsag6a',
                        'display': 'khaled',
                        'full_name': 'DJ Khaled',
                        'style': TextStyle(color: Colors.purple),
                        'photo':
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                      },
                      {
                        'id': 'asfgasga41',
                        'display': 'markT',
                        'full_name': 'Mark Twain',
                        'photo':
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                      },
                      {
                        'id': 'asfsaf451a',
                        'display': 'JhonL',
                        'full_name': 'Jhon Legend',
                        'photo':
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                      },
                    ],
                    matchAll: false,
                    suggestionBuilder: (data) {
                      return Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                data['photo'],
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: <Widget>[
                                Text(data['full_name']),
                                Text('@${data['display']}'),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                Mention(
                  trigger: '#',
                  disableMarkup: true,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  data: [
                    {'id': 'reactjs', 'display': 'reactjs'},
                    {'id': 'javascript', 'display': 'javascript'},
                  ],
                  matchAll: true,
                ),
              ],
              leading: [SizedBox(width: 16)],
              trailing: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.attach_file_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send_outlined,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  _formatedText('*');
                },
                child: Text('Bold'),
              ),
              TextButton(
                onPressed: () {
                  _formatedText('_');
                },
                child: Text('Italic'),
              ),
              TextButton(
                onPressed: () {
                  _formatedText('#');
                },
                child: Text('Underline'),
              ),
              TextButton(
                onPressed: () {
                  _formatedText('~');
                },
                child: Text('Strikethrough'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _formatedText(String pattern) {
    var controller = key.currentState!.controller;
    if (controller!.selection.textInside(controller.text).isNotEmpty) {
      controller.text = controller.selection.textBefore(controller.text) +
          pattern +
          controller.selection.textInside(controller.text) +
          pattern +
          controller.selection.textAfter(controller.text);
    }
  }
}
