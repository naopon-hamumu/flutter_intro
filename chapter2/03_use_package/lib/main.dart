import 'package:flutter/material.dart';

// 1. エントリーポイントのmain関数
void main() {
  // 2. MyAppを呼び出す
  runApp(const MyApp());
}

// MyAppのクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 3.タイトルとテーマを設定する。画面の本体はMyHomePageで作る。
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0; // 1 変数の定義

  // 5.カウンタが押された時のメソッド
  void _incrementCounter() {
    setState(() { // ※画面表示に必要
      _counter++; // 4 変数を更新
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4.MyHomePageの画面を構成する部分
    return Scaffold(
      // 画面上部のタイトル部分
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 画面の中央に表示されるテキスト
            const Text(
              'You have pushed the button this many times:',
            ),
            // テキストの下に表示されるカウンタ値
            Text( // 2 変数の表示
              '$_counter', // 5 変数の更新
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_counter % 2 == 0)
              const Text('偶数です', style: TextStyle(fontSize: 20, color: Colors.red)),
          ],
        ),
      ),
      // 右下の「+」ボタンに対応するフローティングアクションボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 3 ボタンをタップするとメソッドが呼ばれる
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
