import 'package:flutter/material.dart';
import 'package:pull_to_reach/widgets/reachable_icon.dart';
import 'package:pull_to_reach/widgets/pull_to_reach_scope.dart';
import 'package:pull_to_reach/widgets/reachable.dart';
import 'package:pull_to_reach/widgets/scroll_to_index_converter.dart';
import 'package:pull_to_refresh/testReachable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PullToReach(),
    );
  }
}

class PullToReach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isFocused = false;
    return PullToReachContext(indexCount: 4,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              ReachableIcon(
                icon: Icon(Icons.search),
                index: 1,
                onSelect: () {
                  print("test");
                },
              ),
              ReachableIcon(
                icon: Icon(Icons.menu),
                index: 2,
                onSelect: () {
                  print("test2");
                },
              ),
              testReachable(
                  child: Icon(Icons.share),
                  index: 3,
                  onSelect: null
              )
            ],
          ),
          body: ScrollToIndexConverter(
            child: _buildList(),
          ),
        ));
  }

  Widget _buildList() {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black38),
              ),
            ),
            child: ListTile(
              leading: const Icon(Icons.flight_land),
              title: Text('$index'),
              subtitle: Text('&listItem'),
              onTap: () { /* react to the tile being tapped */ },
            ),
          );
        },
      itemCount: 5,
    );
  }
}

