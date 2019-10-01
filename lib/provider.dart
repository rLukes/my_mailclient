import 'package:flutter/material.dart';
import 'package:my_mailclient/overseer.dart';

class Provider<T> extends InheritedWidget {
  final Overseer data;

  Provider({Key key, Widget child, this.data}) : super(key : key, child: child);

  //create alias, of areas for convenience
  static Overseer of<T>(BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).data;
  }


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    /*
    * because we are using the inheritedwidget in it's immutable form
    * we will never replace that widget,
    * so we don't have to worry  about this method
    * it can be always false
    */
    return false;
  }

}