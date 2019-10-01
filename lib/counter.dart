import 'package:flutter/material.dart';
import 'package:my_mailclient/Observer.dart';
import 'package:my_mailclient/counter_manager.dart';
import 'package:my_mailclient/provider.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager counter_manger = Provider.of(context).fetch(CounterManager);
    return Center(
      child: Observer<int>(
        stream: counter_manger.counter$,
        onSuccess: (context, data) {
          return Text("Calendar: $data");
        },
        onError: (context, error) {},
      ),
    );
  }
}
