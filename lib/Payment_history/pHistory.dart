import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/myAppBar.dart';
import '../widgets/textField.dart';

class paymentHistory extends StatefulWidget {
  const paymentHistory({super.key});

  @override
  State<paymentHistory> createState() => _paymentHistorytate();
}

class _paymentHistorytate extends State<paymentHistory> {
  final List<String> list = [];

  TextEditingController regId = TextEditingController();
  TextEditingController sid = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool sank = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Payment History",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            hitory_payment(),
          ],
        ),
      ),
    );
  }

  Widget hitory_payment() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            color: Color.fromARGB(255, 232, 232, 239),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  myText("Name : Sanket Hake"),
                  SizedBox(
                    height: 15,
                  ),
                  myText("Registration ID : 201090038"),
                  SizedBox(
                    height: 15,
                  ),
                  myText("Caste : VJNT"),
                  SizedBox(
                    height: 15,
                  ),
                  myText(
                      "Scheme Name : Post Matric Scholarship for VJNT Student"),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Account Information",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          SizedBox(height: 10,) , 
          myTable(),
          Align(
              alignment: Alignment.bottomRight,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: 'Scroll Horizontally',
                    ),
                    WidgetSpan(
                      child: Icon(Icons.forward),
                    ),
                  
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget myTable() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('fees').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: new Text('Loading...'));
          default:
            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    DataTable(
                     checkboxHorizontalMargin: 20,
                      
                      columnSpacing: 20,
                      dataRowHeight: 60,
                      headingRowHeight: 60,
                      horizontalMargin: 25,
                      columns: <DataColumn>[
                        DataColumn(label: mystyle1("Total Fees"   )  ) , 
                        DataColumn(label: mystyle1("Fees Paid \nby student")),
                        DataColumn(label: mystyle1('1st Installment' )),
                        DataColumn(label: mystyle1('2nd Installment')),
                        DataColumn(label: mystyle1('Balance')),
                        DataColumn(label: mystyle1('Status')),
                      ],
                      rows: (snapshot.data! as QuerySnapshot)
                          .docs
                          .map((DocumentSnapshot document) {
                        return DataRow(
                          
                          cells: <DataCell>[
                            
                            DataCell(Container(child: mystyle(document["total"] , 2)) , ),
                            DataCell(mystyle(document["feestu"] , 2)),
                            DataCell(mystyle(document["mahadbt1"] , 2)),
                            DataCell(mystyle(document["mahadbt2"], 2)),
                            DataCell(mystyle(document["balance"],  int.parse(document["balance"]) > 0 ? 1 : 0) ),
                            DataCell(mystyle(document["status"] , document["status"] == "approved" ? 0 : 1 )),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ));
        }
      },
    );
  }

  Widget myText(
    String txt,
  ) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        txt,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
      ),
    );
  }
  
  Widget mystyle(String txt , int value ) {

    if(value == 1 ){
      return Text(txt,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13 , color: Colors.red)) ; 
    }
    else if (value == 0){
        return   Text(txt,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13 , color: Colors.green));
    }
    else{
      return Text(txt,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13 , color: Colors.black));
    }
   
  }
}

Widget mystyle1 (String txt){
    return  Text(txt,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 , color: Colors.black));
}


//  body: sank == false
//             ? Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 30,
//                     ),
// myTextField(
//   controller: regId,
//   hintTxt: "Enter Registration ID",
//   labelTxt: "Registration ID",
//   myIcon: Icon(Icons.person),
//   textInputType: TextInputType.text,
//   validator: (value) {
//     if (value!.isEmpty) {
//       return 'Enter Registration ID';
//     }
//     return null;
//   },
// ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     myTextField(
//                       controller: sid,
//                       hintTxt: "Enter Scholarship ID",
//                       labelTxt: "Scholarship ID",
//                       myIcon: Icon(Icons.phone),
//                       textInputType: TextInputType.text,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Enter phone no.';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     MaterialButton(
//                       height: 50,
//                       minWidth: 175,
//                       onPressed: () {
//                         sank = true;
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Submitted Data')),
//                         );
//                         setState(() {});
//                       },
//                       color:Color.fromARGB(255, 97, 49, 218),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       child: const Text(
//                         "Search",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             : StreamBuilder(
//                 stream: db
// .collection("Users")
// .doc(regId.text)
// .collection("scholarship")
// .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   final Value = (snapshot.data! as QuerySnapshot).docs;

                  // return ListView.builder(
                  //     itemCount: Value.length,
                  //     itemBuilder: (BuildContext context, int index) {
//                         var doc = snapshot.data?.docs[index].data()
//                             as Map<String, dynamic>;
//                         print(Value[index]["sid"]);
//                         if (Value[index]["sid"] == sid.text) {
//                           return SingleChildScrollView(
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Stack(
//                                 children: [
//                                   Center(
//                                     child: Container(

//                                       width: MediaQuery.of(context).size.width / 4,
//                                       height: 80,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(20),
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 "assets/images/ancient-scroll.png"),
//                                             fit: BoxFit.contain),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(left: 10, top: 100),
//                                     child: Text(
//                                       "Account Information",
//                                       style: TextStyle(
//                                           color: Colors.black, fontSize: 25),
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(
//                                         top:170 ,
//                                         left: 10,
//                                         right: 10),
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "SchemeName : " +
//                                                     Value[index]["SchemeName"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Caste : " +
//                                                     Value[index]["caste"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Total Fees : " +
//                                                     Value[index]["fees"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "MahaDBT Instt 1 : " +
//                                                     Value[index]["instal1"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "MahaDBT Instt 1 : " +
//                                                     Value[index]["iinstal2"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Remark : " +
//                                                     Value[index]["remark"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Total Fees : " +
//                                                     Value[index]["total"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Balance : " +
//                                                     Value[index]["balance"].toString(),
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "financial year : " +
//                                                     Value[index]["fyear"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 25,
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, top: 10),
//                                             width:
//                                                 MediaQuery.of(context).size.width,
//                                             height: 70,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 border: Border.all(
//                                                     color: Colors.black),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15)),
//                                             child: Center(
//                                               child: Text(
//                                                 "Scholarship ID : " +
//                                                     Value[index]["sid"],
//                                                 style: TextStyle(fontSize: 18),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         } else {
//                           return Text("No data");
//                         }
//                       });
//                 },
//               )
