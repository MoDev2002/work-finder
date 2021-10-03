import 'package:flutter/cupertino.dart';

class DataOfJobs {
  final String jobImage;
  final String jobDiscribtion;
  final double jobPrice;
  final String availableDate;

  DataOfJobs(
      {required this.jobDiscribtion,
      required this.availableDate,
      required this.jobPrice,
      required this.jobImage});
}

class Jobs with ChangeNotifier {
  final List<DataOfJobs> _availableJobs = [
    DataOfJobs(
        jobDiscribtion: 'GUIDE TO HIKE IN THE ALPS',
        availableDate: '9.10 - 9.20',
        jobPrice: 150,
        jobImage:
            'https://img.freepik.com/free-vector/couple-with-backpacks-walking-outdoors-tourists-with-nordic-poles-hiking-mountains-flat-vector-illustration-vacation-travel-trekking-concept_74855-9831.jpg?size=626&ext=jpg'),
    DataOfJobs(
        jobDiscribtion: 'LOOKING AFTER YOUR PLANTS',
        availableDate: '8.05 - 9.10',
        jobPrice: 3,
        jobImage:
            'https://media.istockphoto.com/vectors/young-woman-taking-care-plants-vector-id1212900176?k=20&m=1212900176&s=612x612&w=0&h=5OSWkc65prZvI7UT2UbQ2GvpIIfWeJxfteCPsrCDEng='),
    DataOfJobs(
        jobDiscribtion: 'PASTRY CHEF FOR A FESTIVE DINNER',
        availableDate: '8.29',
        jobPrice: 40,
        jobImage:
            'https://media.istockphoto.com/vectors/woman-decorates-a-cake-vector-id1218734468?k=20&m=1218734468&s=612x612&w=0&h=PF7X_c1TAvqoJQbwhhRPXO_A0xOpUtfcoI-HNlgGT-o='),
  ];
  List<DataOfJobs> get availableJobs {
    return [..._availableJobs];
  }

  void addNewJob(
      String jDiscribtion, String aDate, double jPrice, String jImage) {
    final newJob = DataOfJobs(
        jobDiscribtion: jDiscribtion,
        availableDate: aDate,
        jobPrice: jPrice,
        jobImage: jImage);
    _availableJobs.add(newJob);
    notifyListeners();
  }
}
