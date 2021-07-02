import 'package:flutter/material.dart';
import 'package:flutter_to_do_app_simple/model/model_list.dart';

import 'package:provider/provider.dart';

import 'elements/text_field.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();

  int counter = 0;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List toDo = Provider.of<ModelList>(context).list;
    return Container(
      color: Colors.grey.shade400,
      /*decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("/*imagePath*/"), fit: BoxFit.cover),
      ),*/
      child: Column(
        children: [
          buildTextField(this.formKey, controller),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    setState(() {
                      toDo.add(controller.text);
                      controller.clear();
                      counter++;
                    });
                  }
                },
                child: Text("Add", style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  return setState(() {
                    toDo.remove(controller.text);
                    controller.clear();
                    counter--;
                  });
                },
                child: Text("Remove", style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              Text("Things to do"),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 1,
                color: Colors.black,
              )
            ],
          ),
          Flexible(
              child: ListView.builder(
            itemCount: toDo.length,
            itemBuilder: (context, indexNumber) => buildListTile(indexNumber, toDo),
          )),
        ],
      ),
    );
  }



  buildListTile(int number, List toDo) {
    counter++;
    return Dismissible(
      key: Key(counter.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          toDo.removeAt(number);
        });
      },
      child: Container(
        height: 70,
        child: Card(
          color: Colors.blueGrey.withOpacity(0.9),
          elevation: 4,
          child: ListTile(
            title: Text(
              toDo[number],
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
