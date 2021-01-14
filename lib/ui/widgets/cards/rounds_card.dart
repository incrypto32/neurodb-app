import 'package:flutter/material.dart';
import 'package:neurodb/models/round/round.dart';

class RoundsCard extends StatelessWidget {
  const RoundsCard({Key key, this.data}) : super(key: key);
  final RoundsData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Table(
                    children: [
                      buildTableRow(
                        h1: "Temp",
                        d1: "${data.temp}",
                        h2: "Pulse",
                        d2: "${data.pulse}",
                      ),
                      buildTableRow(
                        h1: "BP",
                        d1: "${data.bp}",
                        h2: "GRBS",
                        d2: "${data.grbs}",
                      ),
                      buildTableRow(
                        h1: "Sp02",
                        d1: "${data.sp02}",
                        h2: "Resp Rate",
                        d2: "${data.respRate}",
                      ),
                    ],
                  ),
                ),
                buildRoundsDateBox(data.dateTime),
              ],
            ),
            SizedBox(height: 20),
            Text("Investigation ${data.investigation}"),
            SizedBox(height: 20),
            Text("New Complaints : ${data.newComplaints}"),
            SizedBox(height: 20),
            Text("Medication : ${data.medication}"),
            SizedBox(height: 20),
            Text("Current Status : ${data.currentStatus}"),
            SizedBox(height: 20),
            Text("Comments : ${data.comment}"),
            SizedBox(height: 20),
            Text(
              "Procedures",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text("${data.procedures?.stringRep() ?? "_"}"),
          ],
        ),
      ),
    );
  }

  Column buildRoundsDateBox(DateTime datetime) {
    return Column(
      children: [
        Text(
          "${datetime.day}/${datetime.month}/${datetime.year}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${datetime.hour}:${datetime.minute}",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  TableRow buildTableRow({
    String h1 = "NIL",
    String d1 = "NIL",
    String h2 = "NIL",
    String d2 = "NIL",
  }) {
    return TableRow(
      children: [
        TableCell(
          child: Text("$h1"),
        ),
        TableCell(
          child: Text("$d1"),
        ),
        TableCell(
          child: Text("$h2"),
        ),
        TableCell(
          child: Text("$d2"),
        ),
      ],
    );
  }
}
