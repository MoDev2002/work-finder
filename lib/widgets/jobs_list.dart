import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/data_of_jobs.dart';

class JobsList extends StatelessWidget {
  const JobsList({
    Key? key,
    required this.availableJobs,
  }) : super(key: key);

  final List<DataOfJobs> availableJobs;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: availableJobs.map((jobs) {
      return Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 200,
              alignment: Alignment.center,
              child: Image.network(
                jobs.jobImage,
                fit: BoxFit.contain,
                width: 175,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      jobs.jobDiscribtion,
                      style: GoogleFonts.oswald(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 0.9,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      textWidthBasis: TextWidthBasis.parent,
                    ),
                  ),
                  Text(
                    jobs.availableDate,
                    style: GoogleFonts.oswald(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    '\$${jobs.jobPrice.toStringAsFixed(0)}\\HOUR',
                    style: GoogleFonts.oswald(
                        fontSize: 20, color: Colors.blue[600]),
                  ),
                ],
              ),
            ),
            // subtitle: Text(jobs.availableDate),
            // trailing: Text('\$ ${jobs.jobPrice.toStringAsFixed(0)}\\HOUR'),
          ],
        ),
      );
    }).toList());
  }
}
