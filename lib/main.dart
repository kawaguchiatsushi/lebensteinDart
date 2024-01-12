import 'package:flutter/material.dart';
import 'package:lebenstein/lebenstein.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lebenstein Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter lebenstein'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String query = "america";

  // List<String> damiydata = ["american", "bameredon", "americom", "americrion"];

  String query = "日本";
  List<String> damiydata = ["日本人", "日本語版", "日本", "アメリカン"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///////
          ///
          /// lebenstein
          ///
          var index = CalcLevenshtein.calc(query, damiydata);
          var indices = CalcLevenshtein.changeIndex(index, damiydata);
          print(indices);
        },
        tooltip: 'Lebenstein',
        child: const Icon(Icons.add),
      ),
    );
  }
}
