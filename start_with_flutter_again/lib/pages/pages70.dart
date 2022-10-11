import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagina70 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade900,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.shade900,
        title: Text("InheritedWidget P1 Page_70"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<int>>(
              future: MyInheritedWidget.of(context).myService.getNumbers(),
              // initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].toString()),
                          tileColor: Colors
                              .primaries[index /* % snapshot.data!.length */],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          MaterialButton(
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyWidget()));
            },
            child: Text("Go to MyWidget"),
          )
        ],
      )),
    );
  }
}

abstract class MyServiceParent {
  Future<List<int>> getNumbers();
}

class MyService extends MyServiceParent {
  @override
  Future<List<int>> getNumbers() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(10, (index) => index);
  }
}

class MyInheritedWidget extends InheritedWidget {
  final MyServiceParent myService;

  MyInheritedWidget({required Widget child, required this.myService})
      : super(child: child);

  static MyInheritedWidget of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<MyInheritedWidget>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

// Realizar
  // MyInheritedWidget(
  //     myService: MyService(),
  //     child: const MaterialApp(
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.shade100,
        title: Text("InheritedWidget P2"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<int>>(
              future: MyInheritedWidget.of(context).myService.getNumbers(),
              // initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].toString()),
                          tileColor: Colors
                              .primaries[index /* % snapshot.data!.length */],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          MaterialButton(
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyWidget()));
            },
            child: Text("Go to MyWidget"),
          )
        ],
      )),
    );
  }
}

class Pagina71 extends StatefulWidget {
  Pagina71({Key? key}) : super(key: key);

  @override
  State<Pagina71> createState() => _Pagina71State();
}

class _Pagina71State extends State<Pagina71> {
  var _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.shade300,
        title: Text("InheritedWidget Listen Page_71"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Slider(
                value: _value,
                onChanged: (val) {
                  setState(() {
                    _value = val;
                  });
                }),
          ),
          Expanded(
              child: MyInheritedWidgetListen(
            value: _value,
            child: Row(
              children: [
                Expanded(child: LeftWidget()),
                Expanded(child: RightWidget()),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: NumberWidget(),
    );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = MyInheritedWidgetListen.of(context).value;
    return Center(
      child: Text(
        value.toStringAsFixed(1),
        style: TextStyle(fontSize: 40.0),
      ),
    );
  }
}

class MyInheritedWidgetListen extends InheritedWidget {
  final double value;

  MyInheritedWidgetListen({required Widget child, required this.value})
      : super(child: child);

  /* static MyInheritedWidgetListen of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<MyInheritedWidgetListen>()!; */
  static MyInheritedWidgetListen of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidgetListen>()!;

  @override
  bool updateShouldNotify(covariant MyInheritedWidgetListen oldWidget) =>
      oldWidget.value != value;

// Realizar
  // MyInheritedWidget(
  //     myService: MyService(),
  //     child: const MaterialApp(
}
