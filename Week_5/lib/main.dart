import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage2(),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
      return 0;
});

class MyHomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
        body: Center(
          child: Text('Value is $value', style: Theme
              .of(context)
              .textTheme
              .headline4,),
        ),
        floatingActionButton:
        Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () =>
                ref
                    .read(counterStateProvider.state)
                    .state++,
                child: Icon(Icons.add),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                onPressed: () =>
                ref
                    .read(counterStateProvider.state)
                    .state--,
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ),
    );
  }
}

class Clock extends StateNotifier<DateTime>{
  Clock() : super(DateTime.now()){
    _timer = Timer.periodic(Duration(seconds:1),(_) {
      state = DateTime.now();
    },);
  }

  late final Timer _timer;

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }
}

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref){
  return Clock();
});


class HomePage2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final currentTime = ref.watch(clockProvider);
    final timeFormatted = DateFormat.Hms().format(currentTime);
    return Scaffold(
      body: Center(
        child: Text(
          'Current Time: ${timeFormatted}',
          style: Theme.of(context).textTheme.headline4,
        ),
      )
    );
  }
}