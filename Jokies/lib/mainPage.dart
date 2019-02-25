import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';

const dadJokeApi = "https://icanhazdadjoke.com/";
const httpHeaders = const {
  'User-Agent': 'Amine-Smahi (https://github.com/Amine-Smahi/Jokies)',
  'Accept': 'application/json',
};

const jokeTextStyle = const TextStyle(
    fontFamily: 'Patrick Hand',
    fontSize: 34.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal);

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  Future<String> _response;
  String _displayedJoke = '';

  @override
  initState() {
    super.initState();
    _refreshAction();
  }

  _refreshAction() {
    setState(() {
      _response = http.read(dadJokeApi, headers: httpHeaders);
    });
  }

  _aboutAction() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
              title: Text('About Jokies'),
              content: Text('Jokies is brought to you by Amine-Smahi (@amine-smahi) \n the source code is available at \n ttps://github.com/Amine-Smahi/Jokies'));
        });
  }

  _shareAction() {
    if (_displayedJoke.isNotEmpty) {
      share("Jokies app says : \n" + _displayedJoke);
    }
  }

  FutureBuilder<String> _jokeBody() {
    return FutureBuilder<String>(
      future: _response,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const ListTile(
              leading: Icon(Icons.sync_problem),
              title: Text('No connection'),
            );
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return const Center(
                child: ListTile(
                  leading: Icon(Icons.error),
                  title: Text('Network error'),
                  subtitle: Text(
                      'Sorry - this isn\'t funny, we know, but something went '
                      'wrong when connecting to the Internet. Check your '
                      'network connection and try again.'),
                ),
              );
            } else {
              final decoded = json.decode(snapshot.data);
              if (decoded['status'] == 200) {
                _displayedJoke = decoded['joke'];
                return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Dismissible(
                      key: const Key("joke"),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) {
                        _refreshAction();
                      },
                      child: Text(_displayedJoke, style: jokeTextStyle),
                    ));
              } else {
                return ListTile(
                  leading: const Icon(Icons.sync_problem),
                  title: Text('Unexpected error: ${snapshot.data}'),
                );
              }
            }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            tooltip: 'About Jokies',
            onPressed: _aboutAction,
          ),
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'Share Jokies',
            onPressed: _shareAction,
          )
        ],
      ),
      body: Center(
        child: _jokeBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshAction,
        tooltip: 'New joke',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
