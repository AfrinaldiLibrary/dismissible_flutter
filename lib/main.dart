import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final Faker faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction){
              if (direction ==  DismissDirection.endToStart){
                print("true");
              }
              else{
                print("false");
              }
            },
              confirmDismiss: (direction){
                return showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("CONFIRM"),
                        content: Text("Are you sure to delete?"),
                        actions: [
                          MaterialButton(onPressed: (){
                            Navigator.of(context).pop(false);
                          },
                            child: Text("No"),
                          ),
                          MaterialButton(onPressed: (){
                            Navigator.of(context).pop(true);
                          },
                            child: Text("Yes"),
                          )
                        ],
                      );
                    },
                );
              },
              key: Key(index.toString()),
              background: Container(
                color: Colors.red,
                child: Icon(
                    Icons.delete,
                  size: 25,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 8),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Center(
                      child: Text("${index+1}")
                  ),
                ),
                title: Text(Faker().person.name()),
                subtitle: Text(Faker().lorem.sentence()),
              )
          );
        },
      ),
    );
  }
}
