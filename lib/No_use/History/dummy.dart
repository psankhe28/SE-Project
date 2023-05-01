import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholarship_vjti/main.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';

class MyTable extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Table"),
      body:  StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').doc("201090040").collection("scholarship").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                dataRowHeight: 60,
                headingRowHeight: 50,
                horizontalMargin: 10,
                columns: <DataColumn>[
                  DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                  DataColumn(label: Text('Age', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                  DataColumn(label: Text('Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                ],
                rows:  (snapshot.data! as QuerySnapshot).docs
                    .map((DocumentSnapshot document) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(document['caste'], style: TextStyle(fontSize: 16))),
                      DataCell(Text(document['caste'].toString(), style: TextStyle(fontSize: 16))),
                      DataCell(Text(document['caste'], style: TextStyle(fontSize: 16))),
                    ],
                  );
                }).toList(),
              ),
            );
        }
      },
    ) , 
    ) ; 
  }
}

