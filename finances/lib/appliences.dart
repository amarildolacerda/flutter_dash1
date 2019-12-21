import 'package:flutter/material.dart';

class ApplienceTimeLine extends StatelessWidget {
  final Widget leadding;
  final Widget title;
  final Widget actions;
  final Color color;
  final double height;
  final double width;
  const ApplienceTimeLine(
      {Key key,
      this.height = 90,
      this.width,
      this.color,
      this.leadding,
      this.title,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        color: color,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child:
                  leadding ?? Container(width: 5, color: color ?? Colors.red),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: title,
            )),
            if (actions != null) actions,
          ],
        ));
  }
}

class ApplienceTag extends StatelessWidget {
  final double height;
  final String title;
  final String value;
  final List<Widget> children;
  final Color tagColor;
  final double tagWidth;
  final double tagHeight;
  final List<Widget> tagChildren;
  final double width;
  final Icon icon;
  final Widget actions;
  const ApplienceTag({
    Key key,
    this.title,
    this.value,
    this.children,
    this.tagColor = Colors.blue,
    this.tagWidth = 5,
    this.tagHeight,
    this.height: 90,
    this.width,
    this.icon,
    this.actions,
    this.tagChildren,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplienceTimeLine(
      height: height,
      width: width,
      leadding: Stack(
        children: <Widget>[
          if (tagWidth > 0)
            Container(
              width: tagWidth,
              height: tagHeight,
              color: tagColor,
            ),
          if (icon != null) Center(child: icon),
          ...tagChildren ?? [],
        ],
      ),
      title: Column(
        children: <Widget>[
          if (title != null)
            Text(title ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                )),
          if (value != null)
            SizedBox(
              height: 10,
            ),
          if (value != null)
            Text(value ?? '',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                )),
          ...children ?? [],
        ],
      ),
      actions: actions,
    );
  }
}
