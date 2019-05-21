library container_helper;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insets/flutter_insets.dart';

class CardPaddingTitle extends StatelessWidget {
	final Widget child;
	final double padding;
	final String title;

  const CardPaddingTitle({
	  Key key,
	  this.padding=20.0,
	  this.title,
	  this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardPadding(
	    padding: padding,
	    children: <Widget>[
		    Text(
			    title,
			    style: Theme.of(context).textTheme.headline,
		    ),
		    Divider(),
		    child
	    ],
    );
  }
}

class CardPadding extends StatelessWidget {
	final List<Widget> children;
	final double padding;
	final CrossAxisAlignment crossAxisAlignment;
  final Color color;

	const CardPadding({
		Key key,
		this.padding=20.0,
		@required this.children,
		this.crossAxisAlignment = CrossAxisAlignment.start,
		this.color = Colors.white,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Card(
			color: color,
			child: Padding(
				padding: EdgeInsets.all(padding),
				child: Column(
					mainAxisSize: MainAxisSize.min,
					crossAxisAlignment: crossAxisAlignment,
					children: children,
				),
			),
		);
	}
}

class ContainerBox extends StatelessWidget {
  final List<Widget> children;

  final double topMargin;

  final CrossAxisAlignment crossAxisAlignment;

  final EdgeInsets padding;

  const ContainerBox({
    Key key,
    @required this.children,
    this.topMargin = 20.0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color dividerColor = theme.dividerColor;

    return Container(
      margin: EdgeInsets.only(top: topMargin),
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: dividerColor),
          top: BorderSide(color: dividerColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}

class ContainerBoxPadding extends StatelessWidget {
  final List<Widget> children;
  final double topMargin;
  final CrossAxisAlignment crossAxisAlignment;

  const ContainerBoxPadding({
    Key key,
    @required this.children,
    this.topMargin = 20.0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBox(
      children: children,
      padding: const EdgeInsets.all(16.0),
      topMargin: topMargin,
      crossAxisAlignment: crossAxisAlignment,
    );
  }
}

class ContainerBoxPaddingWithHeader extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final EdgeInsets padding;

  const ContainerBoxPaddingWithHeader({
    Key key,
    this.title,
    @required this.children,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20.0),
          child: Text(title, style: Theme.of(context).textTheme.subhead,),
        ),
        ContainerBox(
          topMargin: 5.0,
          children: children,
          padding: padding,
        )
      ],
    );
  }
}

class ContainerBoxSeparated extends StatelessWidget {
  final double topMargin;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController controller;
  final Widget separator;

  const ContainerBoxSeparated({
    Key key,
    this.topMargin = 20.0,
    @required this.itemBuilder,
    @required this.itemCount,
    this.controller,
    this.separator = dividerIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color dividerColor = theme.dividerColor;

    return Container(
      margin: EdgeInsets.only(top: topMargin),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: dividerColor),
          top: BorderSide(color: dividerColor),
        ),
      ),
      child: ListView.separated(
        controller: controller,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: itemBuilder,
        separatorBuilder: (BuildContext context, int index) {
          return separator;
        },
        itemCount: itemCount,
      ),
    );
  }
}

class ContainerBoxSeparatedWithHeader extends StatelessWidget {
  final String title;
  final CrossAxisAlignment crossAxisAlignment;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  const ContainerBoxSeparatedWithHeader({
    Key key,
    this.title,
    @required this.itemBuilder,
    @required this.itemCount,
    this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20.0),
          child: Text(title, style: Theme.of(context).textTheme.subhead,),
        ),
        ContainerBoxSeparated(
          topMargin: 5.0,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        )
      ],
    );
  }
}
