import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class DeleteLaptopScreen extends StatefulWidget {
  const DeleteLaptopScreen({Key? key}) : super(key: key);

  @override
  _DeleteLaptopScreenState createState() => _DeleteLaptopScreenState();
}

final deleteController = new TextEditingController();

class _DeleteLaptopScreenState extends State<DeleteLaptopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Delete a laptop",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade100,
          elevation: 2,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Insert here the laptop's ID",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    autofocus: false,
                    controller: deleteController,
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      deleteController.text = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Insert a valid ID");
                      }
                    },
                    textInputAction: TextInputAction.next,

                    //email decoration
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "ID number",
                      prefixIcon: Icon(Icons.delete),
                      fillColor: Color.fromARGB(255, 232, 232, 232),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(24, 72, 160, 1),
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(24, 72, 160, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        "Delete",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
