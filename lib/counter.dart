import 'package:flutter/material.dart';
import 'package:my_mailclient/counter_manager.dart';
import 'package:my_mailclient/provider.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager counter_manger = Provider.of(context).fetch(CounterManager);
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: counter_manger.counter$,
        builder: (context, snapshot){
          return(Text("Calendar: ${snapshot.data}"));
        }
      ),
    );
  }
}
