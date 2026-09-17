// 导入 Flutter Material 设计语言库，提供按钮、文本、卡片等基础组件
import 'package:flutter/material.dart';

// main 函数是 Dart 程序的入口点，应用从这里开始执行
void main() {
  // runApp 将根组件 MyApp 挂载到屏幕上，const 表示 MyApp 是编译时常量，提升性能
  runApp(const MyApp());
}

// MyApp 是应用的根组件，继承自 StatelessWidget（无状态组件，界面不随交互改变）
class MyApp extends StatelessWidget {
  // 构造函数，super.key 将 key 传给父类，用于组件复用与更新识别
  const MyApp({super.key});

  // This widget is the root of your application.
  // 该组件是应用的根组件
  @override
  Widget build(BuildContext context) {
    // build 方法返回组件树，描述界面长什么样；MaterialApp 是 Material 风格应用的容器
    return MaterialApp(
      // title 是应用在任务切换器中显示的标题（Android 任务管理器）
      title: 'Flutter Demo',
      // theme 定义应用主题，ThemeData.fromSeed 基于一个种子色生成完整配色方案
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
        // colorScheme 从种子色 deepPurple 生成颜色方案，决定整体配色
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home 指定应用的首页组件，这里是带标题的 MyHomePage
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePage 是首页组件，继承自 StatefulWidget（有状态组件，界面会随交互改变）
class MyHomePage extends StatefulWidget {
  // 构造函数，required title 表示必须传入标题
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that there is a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // title 字段保存页面标题，final 表示不可变
  final String title;

  // createState 创建并返回该组件对应的状态对象 _MyHomePageState
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageState 是 MyHomePage 的状态类，下划线开头表示私有（仅在文件内可见）
class _MyHomePageState extends State<MyHomePage> {
  // _counter 记录按钮点击次数，下划线开头表示私有字段，初始值为 0
  int _counter = 0;

  // _incrementCounter 是点击按钮时调用的方法，下划线开头表示私有
  void _incrementCounter() {
    // setState 通知框架状态已改变，触发 build 方法重新执行以刷新界面
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // 计数器自增 1
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // Scaffold 提供页面基础结构（AppBar、body、FAB 等）
    return Scaffold(
      // AppBar 是顶部应用栏
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // 背景色取主题色方案的 inversePrimary（反相主色）
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title 显示从 MyHomePage 传入的标题文本
        title: Text(widget.title),
      ),
      // body 是页面主体内容，Center 让子组件居中
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // Column 是纵向排列子组件的布局容器
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          // mainAxisAlignment.center 让子组件在主轴（纵向）上居中
          mainAxisAlignment: MainAxisAlignment.center,
          // children 是 Column 的子组件列表
          children: <Widget>[
            // 提示文本，const 表示常量组件，提升性能
            const Text('You have pushed the button this many times:'),
            // 显示当前计数器的值，$_counter 是 Dart 字符串插值语法
            Text(
              '$_counter',
              // 使用主题的 headlineMedium 文本样式
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // floatingActionButton 是悬浮动作按钮（FAB），通常用于主要操作
      floatingActionButton: FloatingActionButton(
        // onPressed 指定点击时回调，绑定到 _incrementCounter 方法
        onPressed: _incrementCounter,
        // tooltip 是辅助说明（长按或无障碍时显示）
        tooltip: 'Increment',
        // child 是按钮内的图标，Icons.add 是加号图标
        child: const Icon(Icons.add),
      ),
    );
  }
}
