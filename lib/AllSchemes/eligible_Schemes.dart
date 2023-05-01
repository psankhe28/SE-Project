import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
import 'package:scholarship_vjti/widgets/textField.dart';
import 'package:scholarship_vjti/widgets/theme.dart';

class MySchemes extends StatefulWidget {
  const MySchemes({Key? key}) : super(key: key);

  @override
  _MySchemesState createState() => _MySchemesState();
}

class _MySchemesState extends State<MySchemes> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String categoryValue = 'OPEN';

  List<String> category = <String>[
    'OPEN',
    'Minority(Muslim, Sikh, Christian, Buddhist, Parsi, Jain & Jew)',
    'SC',
    'ST',
    'OBC',
    'VJNT',
    'SEBC',
    'EWS',
    'SBC',
    'Only Physically Handicapped',
    'AMS Students',
  ];

  bool sank = false;
  late num income;
  // TextEditingController incomedetail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: "Eligible Schemes"),
        body: sank == false
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Headings(title: 'Category'),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  DropdownButton(
                                      value: categoryValue,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      items: category.map((String category) {
                                        return DropdownMenuItem(
                                            child: Text(category),
                                            value: category);
                                      }).toList(),
                                      isExpanded: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          categoryValue = newValue!;
                                        });
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Headings(title: 'Income'),
                                  TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        income = int.parse(value);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          height: 50,
                          minWidth: 175,
                          onPressed: () {
                            sank = true;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Submitted Data')),
                            );
                            setState(() {});
                          },
                          color: Color.fromARGB(255, 97, 49, 218),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "Search",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : ritish());
  }

  Widget ritish() {
    return StreamBuilder(
      stream: db.collection("mySchemes").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final Value = (snapshot.data! as QuerySnapshot).docs;
        return FadeInDown(
          delay: Duration(milliseconds: 800),
          child: Value.length > 0
              ? ListView.builder(
                  itemCount: Value.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (Value[index]["category"].contains(categoryValue) &&
                        int.parse(Value[index]["income"]) >= income) {
                      return Stack(
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 16, right: 16, top: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  )),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                right: 8, top: 4),
                                            child: Text(
                                              Value[index]["name"],
                                              maxLines: 2,
                                              softWrap: true,
                                              style: CustomTextStyle
                                                  .textFormFieldSemiBold
                                                  .copyWith(fontSize: 20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 100,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  })
              : Center(
                  child: Text(
                    "Products Not Available",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ),
        );
      },
    );
  }
}

class Headings extends StatelessWidget {
  Headings({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
