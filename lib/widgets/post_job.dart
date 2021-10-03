import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data_of_jobs.dart';

class PostJob extends StatelessWidget {
  static const routeName = '/post-job';
  final descriptionController = TextEditingController();

  final rateController = TextEditingController();

  final dateController = TextEditingController();

  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addJob = Provider.of<Jobs>(context);
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
      body: ListView(
        children: [
          Text(
            ' Job Descrption :',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 5, bottom: 10),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: 'JOP DESCRPTION',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Job Rate :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    left: 5,
                    bottom: 10,
                  ),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: rateController,
                    decoration: InputDecoration(
                        hintText: 'RATE PER HOUR',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Available Date :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 5, left: 5, bottom: 10, right: 5),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: dateController,
                    decoration: InputDecoration(
                        hintText: 'EG. 9.10-9.20',
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
              ],
            )
          ]),
          Text(
            ' Job Image URL :',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 5, bottom: 10),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: TextField(
              controller: imageController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  suffixIcon: Icon(Icons.image)),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: ElevatedButton(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      child: Row(
                        children: [
                          Text(
                            'SUBMIT JOB',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(Icons.file_download_done_outlined)
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                    ),
                    onPressed: () => {
                          addJob.addNewJob(
                              descriptionController.text,
                              dateController.text,
                              double.parse(rateController.text),
                              imageController.text),
                          Navigator.of(context).pop()
                        },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      elevation: MaterialStateProperty.all<double>(0),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(child: Image.asset('assets/images/coding.png'))
        ],
      ),
    );
  }
}
