import 'package:flutter/material.dart';
import 'package:my_mailclient/counter_manager.dart';
import 'package:my_mailclient/provider.dart';

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager counterManager = Provider.of(context).fetch(CounterManager);
    return FloatingActionButton(
      onPressed: (){
        counterManager.increment();
      },
    );
  }
}
