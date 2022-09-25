import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mtdz_run/database/drift_database.dart';
import 'package:mtdz_run/main/MainPage.dart';
import 'package:mtdz_run/main/SliderPage.dart';
// import 'package:mtdz_run/model/Movements.dart';
import 'package:mtdz_run/mypage/MyPage.dart';
import 'package:mtdz_run/mypage/RecordDetailPage.dart';
import 'package:mtdz_run/mypage/RecordPage.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting(); // 다국어 설정 (날짜)

  final database = LocalDatabase();

  // 어떤타입인지 지정을 하고 database 인스턴스를 넣어준다.
  GetIt.I.registerSingleton<LocalDatabase>(database);

  final records = await database.getRecord();
  print("records $records");

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MTDZ Run',
      debugShowCheckedModeBanner: false,
      // home: LogIn(),
      initialRoute: '/login',
      routes: {
        '/': (context) => MainPage(),
        '/login': (context) => LogIn(),
        '/sliderPage': (context) => SliderPage(),
        '/myPage': (context) => MyPage(),
        '/recordPage': (context) => RecordPage(),
        '/recordDetailPage': (context) => RecordDetailPage(),
      },
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            const Center(
              child: Image(
                image: AssetImage('images/shoes.png'),
                width: 170,
                height: 190,
              ),
            ),
            Form(
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.teal,
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter "MTDZ"',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(90, 42),
                          primary: Colors.orangeAccent,
                        ),
                        onPressed: () async {
                          final data = await getDatabase();
                          data.forEach((e) {
                            print('xddddd $e');
                          });

                          Navigator.of(context).pushNamed('/', arguments: 1);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) => MainPage(),
                          //   ),
                          // );
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getDatabase() async {
    // final database = LocalDatabase();
    // 어떤타입인지 지정을 하고 database 인스턴스를 넣어준다.
    final data = await GetIt.I<LocalDatabase>().getMovements();
    // print("ddddd $data");

    return data;
  }
}
