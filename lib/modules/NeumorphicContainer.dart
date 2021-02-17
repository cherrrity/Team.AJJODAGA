import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final String shape;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color,
    this.shape,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double _width = MediaQuery.of(context).size.width;

    final color = this.widget.color ?? Theme.of(context).backgroundColor;
    final shadowColor = this.widget.color ?? Theme.of(context).accentColor;
    final shape = this.widget.shape == "iconButton"? _width * 0.015 : _width * 0.03;
    final round = this.widget.shape == "iconButton"? 1 : 10.0;

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.all(shape),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * round),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? color.mix(Colors.black, .05) : color,
                _isPressed ? color.mix(Colors.black, .05) : color,
              ],
              stops: [
                .3,
                .6,
              ]),
          boxShadow: _isPressed ? null : [
            BoxShadow(
              blurRadius: widget.bevel,
              offset: -widget.blurOffset,
              color: color.mix(Colors.white, .4),   // 현재 테마 색상 중 밝은 그림자 색으로 변경
            ),
            BoxShadow(
              blurRadius: widget.bevel,
              offset: widget.blurOffset,
              color: color.mix(shadowColor, .4),   // 현재 테마 색상 중 밝은 그림자 색으로 변경
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
