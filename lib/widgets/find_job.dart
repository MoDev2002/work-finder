import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/data_of_jobs.dart';
import './jobs_list.dart';

class FindJob extends StatelessWidget {
  static const routeName = '/find-job';

  @override
  Widget build(BuildContext context) {
    final jobs = Provider.of<Jobs>(context).availableJobs;
    final appBar = AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      backgroundColor: Color.fromARGB(255, 224, 233, 247),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 22),
                  children: [
                TextSpan(text: 'HELLO, '),
                TextSpan(
                    text: 'MOHAMED',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ])),
          Spacer(),
          Container(
            child: Image.asset(
              'assets/images/circle-cropped.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          )
        ],
      ),
      centerTitle: true,
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 233, 247),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'SEARCH JOB',
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'NEAR YOU',
                    style: GoogleFonts.righteous(fontSize: 34),
                  ),
                  Spacer(),
                  Text(
                    'SEE ALL',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.84,
              child: JobsList(availableJobs: jobs),
            ),
          ],
        ),
      ),
    );
  }
}
