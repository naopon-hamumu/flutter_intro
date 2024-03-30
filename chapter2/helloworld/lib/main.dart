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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const[
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ]),
      ),
      body: Column(children:[ // Column：縦にWidgetを配置
                              // children：どのWidgetを並べるか配列を指定
        const Text("HelloWorld"),
        const Text("ハローワールド"),
        TextButton(
          onPressed: () => {print("ボタンが押されたよ")}, // ボタンが押された時のイベントを設定
          child: const Text("テキストボタン"), // 画面上に表示する文字列
        ),
        Row( // 横にWidgetを配置
          mainAxisAlignment: MainAxisAlignment.spaceAround, // 列の要素を等間隔で表示
          children: const[
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
            ),
            Icon(
              Icons.audiotrack,
              color: Colors.green,
              size: 30.0,
            ),
            Icon(
              Icons.beach_access,
              color: Colors.blue,
              size: 36.0,
            ),
          ]),
      ]),
      floatingActionButton: FloatingActionButton( // 画面の右下最前面に表示されるボタンを作成
        onPressed: () => {print("押したね？")}, child: const Icon(Icons.timer)),
    );
  }
}
