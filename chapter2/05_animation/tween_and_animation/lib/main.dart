import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with
TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationDouble;
  final Tween<double> _tweenDouble = Tween(begin: 0.0, end: 200.0);
  late Animation<Color?> _animationColor;
  final ColorTween _tweenColor =
    ColorTween(begin: Colors.green, end: Colors.blue);

  // 再生
  _forward() async {
    setState(() {
      _animationController.forward();
    });
  }

  // 停止
  _stop() async {
    setState(() {
      _animationController.stop();
    });
  }

  // 逆再生
  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  // 生成
  @override
  void initState() {
    super.initState();
    _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // TweenとAnimationControllerからAnimationを作る(サイズ)
    _animationDouble = _tweenDouble.animate(_animationController);
    _animationDouble.addListener(() {
      setState(() {});
    });
    // TweenとAnimationControllerからAnimationを作る(色)
    _animationColor = _tweenColor.animate(_animationController);
    _animationColor.addListener(() {
      setState(() {});
    });
  }

  // 破棄
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("AnimationController:${_animationController.value}"),
            Text("AnimationDouble:${_animationDouble.value}"),
            Text("AnimationColors:${_animationColor.value}"),
            SizeTransition(
              sizeFactor: _animationController, // AnimationControllerを設定
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(color: _animationColor.value))),
            ),
          ],
        ),
      ),
      // 再生・停止・逆再生のボタン
      floatingActionButton:
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FloatingActionButton(
            onPressed: _forward, child: const Icon(Icons.arrow_forward)),
          FloatingActionButton(onPressed: _stop, child: const Icon(Icons.pause)),
          FloatingActionButton(
            onPressed: _reverse, child: const Icon(Icons.arrow_back)),
        ]),
    );
  }
}
