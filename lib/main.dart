import 'package:api_test/provider_rest_api/home.dart';
import 'package:api_test/provider_rest_api/rest_api/rest_api.dart';
import 'package:api_test/simple_rest_api/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
      (rec) => {print("${rec.level.name}: ${rec.time} : ${rec.message}")});
}
//-----------------------Simple Rest Api Service ....//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rest Api Test',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHome(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: MaterialApp(
        title: "Provider Rest Api",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyProviderHome(),
      ),
    );
  }
}
