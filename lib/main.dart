import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/data_of_jobs.dart';
import '../widgets/post_job.dart';
import './widgets/find_job.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Jobs(),
      child: MaterialApp(
        home: MyHomePage(),
        routes: {
          PostJob.routeName: (ctx) => PostJob(),
          FindJob.routeName: (ctx) => FindJob(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 224, 233, 247),
        statusBarBrightness: Brightness.light));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 224, 233, 247),
        body: Column(
          children: [
            Container(child: Image.asset('assets/images/main_image.png')),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 70,
                  child: Row(
                    children: [
                      Text(
                        'POST A JOB',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_rounded)
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(PostJob.routeName),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    elevation: MaterialStateProperty.all<double>(0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 20),
              child: ElevatedButton(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 70,
                    child: Row(
                      children: [
                        Text(
                          'FIND JOB',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(FindJob.routeName),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    elevation: MaterialStateProperty.all<double>(0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
