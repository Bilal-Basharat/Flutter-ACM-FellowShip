import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart/';

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
      home: MyHomePage(),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
      return 0;
});

class MyHomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref){
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      body: Center(
        child: Text('Value is $value', style: Theme.of(context).textTheme.headline4,),
      ),
      floatingActionButton:
      Padding(
        padding: EdgeInsets.only(left: 30.0),
        child: Row(
          children: [
            FloatingActionButton(
                onPressed:() => ref.read(counterStateProvider.state).state++,
            child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed:() => ref.read(counterStateProvider.state).state--,
              child: Icon(Icons.remove),
            ),

          ],
        ),
      ),
    );
  }

}
