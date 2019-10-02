import 'package:flutter/material.dart';
import 'package:my_mailclient/Observer.dart';
import 'package:my_mailclient/manager/counter_manager.dart';
import 'package:my_mailclient/provider.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager counterManger = Provider.of(context).fetch(CounterManager);
    return Center(
      child: Observer<int>(
        stream: counterManger.counter$,
        onSuccess: (context, data) {
          return Text("Calendar: $data");
        },
        onError: (context, error) {},
      ),
    );
  }
}
