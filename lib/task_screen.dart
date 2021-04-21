import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String> item = [];
  String temp = "";

//we cAN USE tEXTeDITcONTROLLER OR ABOVE MEATHOD  READ BOTH
  // var todo;
  // final todoControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          'TODO',
        ),
      ),
      body: ListView(
        children: item
            .map(
              (e) => Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.teal[200],
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    e,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.teal,
          onPressed: () {
            showModalBottomSheet(context: context, builder: buildBottomSheet);
          }),
    );
  }

  //Creating bottom sheet
  Widget buildBottomSheet(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              TextField(
                onChanged: (str) {
                  temp = str;
                },
                // controller: todoControler,
                autofocus: true,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  color: Colors.teal,
                  onPressed: () {
                    setState(() {
                      item.add(temp);
                    });
                  },
                  child: Text('Add Todo'))
            ],
          ),
        ),
      ),
    );
  }
}
