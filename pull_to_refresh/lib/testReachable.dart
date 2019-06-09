import 'package:flutter/material.dart';
import 'package:pull_to_reach/widgets/reachable.dart';

class testReachable extends StatefulWidget {
  final Widget child;
  final int index;
  final VoidCallback onSelect;

  testReachable({
    @required this.child,
    @required this.index,
    @required this.onSelect,
  });

  @override
  _testReachableState createState() => _testReachableState();
}

class _testReachableState extends State<testReachable> {
  bool _isFocused = false;
  @override
  Widget build(BuildContext context) {

    return Reachable(
      index: widget.index,
      onSelect: widget.onSelect,
      onFocusChanged: (isFocused) {
        setState(() => _isFocused = isFocused);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isFocused ? Colors.black45 : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: widget.child,
      ),
    );
  }

}