// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_match/dpHelper/MongoDBModel.dart';
import 'package:tech_match/dpHelper/mongodb.dart';
import 'package:tech_match/screen/home.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class InsertLaptopScreen extends StatefulWidget {
  const InsertLaptopScreen({Key? key}) : super(key: key);

  @override
  _InsertLaptopScreenState createState() => _InsertLaptopScreenState();
}

final companyController = new TextEditingController();
final productController = new TextEditingController();
final inchController = new TextEditingController();
final screenController = new TextEditingController();
final ramController = new TextEditingController();
final cpuController = new TextEditingController();
final gpuController = new TextEditingController();
final memoryController = new TextEditingController();
final osController = new TextEditingController();
final typeController = new TextEditingController();
final priceController = new TextEditingController();
//final weightController = new TextEditingController();

class _InsertLaptopScreenState extends State<InsertLaptopScreen> {
  @override
  Widget build(BuildContext context) {
    final companyField = TextFormField(
      autofocus: false,
      controller: companyController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        companyController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a company name");
        }
        //reg expr
        /* if (!RegExp("[a-zA-Z]{3,}").hasMatch(value)) {
          return ("Inserisci una città del tuo shop valida!");
        } */
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        hintText: "Company name",
        prefixIcon: Icon(Icons.home_filled),
        fillColor: Color.fromARGB(255, 232, 232, 232),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromRGBO(24, 72, 160, 1),
            width: 3.0,
          ),
        ),
      ),
    );
    final productField = TextFormField(
      autofocus: false,
      controller: productController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        productController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid product name");
        }
      },
      textInputAction: TextInputAction.next,

      //email decoration
      decoration: InputDecoration(
        filled: true,
        hintText: "Product name",
        prefixIcon: Icon(Icons.laptop),
        fillColor: Color.fromARGB(255, 232, 232, 232),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromRGBO(24, 72, 160, 1),
            width: 3.0,
          ),
        ),
      ),
    );
    final inchField = TextFormField(
      autofocus: false,
      controller: inchController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        inchController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid number");
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        hintText: "Inches",
        prefixIcon: Icon(Icons.pinch_rounded),
        fillColor: Color.fromARGB(255, 232, 232, 232),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromRGBO(24, 72, 160, 1),
            width: 3.0,
          ),
        ),
      ),
    );
    final screenField = TextFormField(
      autofocus: false,
      controller: screenController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        screenController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid number");
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        hintText: "Screen resolution",
        prefixIcon: Icon(Icons.fit_screen_rounded),
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
    );
    final memoryField = TextFormField(
      autofocus: false,
      controller: memoryController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        memoryController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid memory size");
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        hintText: "Memory size",
        prefixIcon: Icon(Icons.memory),
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
      //email decoration
    );
    final cpuField = TextFormField(
      autofocus: false,
      controller: cpuController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        cpuController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid cpu name");
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        hintText: "CPU",
        prefixIcon: Icon(Icons.build_circle_rounded),
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
      //email decoration
    );
    final gpuField = TextFormField(
      autofocus: false,
      controller: gpuController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        gpuController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid GPU name");
        }
      },
      textInputAction: TextInputAction.next,

      //email decoration
      decoration: InputDecoration(
        filled: true,
        hintText: "GPU",
        prefixIcon: Icon(Icons.build_circle_outlined),
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
    );
    final osField = TextFormField(
      autofocus: false,
      controller: osController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        osController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid OS");
        }
      },
      textInputAction: TextInputAction.next,

      //email decoration
      decoration: InputDecoration(
        filled: true,
        hintText: "OS",
        prefixIcon: Icon(Icons.auto_awesome_motion_outlined),
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
    );
    final typeField = TextFormField(
      autofocus: false,
      controller: typeController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        typeController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid laptop type");
        }
      },
      textInputAction: TextInputAction.next,

      //email decoration
      decoration: InputDecoration(
        filled: true,
        hintText: "Laptop type",
        prefixIcon: Icon(Icons.laptop_mac_sharp),
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
    );
    final priceField = TextFormField(
      autofocus: false,
      controller: priceController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        priceController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid price");
        }
      },
      textInputAction: TextInputAction.next,

      //email decoration
      decoration: InputDecoration(
        filled: true,
        hintText: "Price",
        prefixIcon: Icon(Icons.euro_rounded),
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
    );
    final ramField = TextFormField(
      autofocus: false,
      controller: ramController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        ramController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Insert a valid ram");
        }
      },
      textInputAction: TextInputAction.next,

      //email decoration
      decoration: InputDecoration(
        filled: true,
        hintText: "RAM",
        prefixIcon: Icon(Icons.memory_sharp),
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
    );
    Widget getButton() {
      return SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            _insertData(
                companyController.text,
                productController.text,
                typeController.text,
                osController.text,
                memoryController.text,
                double.parse(inchController.text),
                screenController.text,
                ramController.text,
                gpuController.text,
                cpuController.text,
                double.parse(priceController.text));
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(24, 72, 160, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            "Insert",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Insert a new laptop",
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
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
            //key: _formkey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                companyField,
                SizedBox(height: 20),
                productField,
                SizedBox(height: 20),
                typeField,
                SizedBox(height: 20),
                osField,
                SizedBox(height: 20),
                memoryField,
                SizedBox(height: 20),
                inchField,
                SizedBox(height: 20),
                screenField,
                SizedBox(height: 20),
                ramField,
                SizedBox(height: 20),
                gpuField,
                SizedBox(height: 20),
                cpuField,
                SizedBox(height: 20),
                priceField,
                SizedBox(height: 40),
                getButton(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> _insertData(
      String company,
      String product,
      String type,
      String os,
      String memory,
      double inches,
      String screenRes,
      String ram,
      String gpu,
      String cpu,
      double price) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
        laptopId: _id,
        company: companyController.text,
        product: productController.text,
        typeName: typeController.text,
        inches: double.parse(inchController.text),
        screenResolution: screenController.text,
        cpu: cpuController.text,
        ram: ramController.text,
        memory: memoryController.text,
        gpu: gpuController.text,
        opSys: osController.text,
        price: double.parse(priceController.text));

    if (await MongoDatabase.checkName(product)) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("Failed"),
            content: Text("A device with this name is already in the database"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Got it"))
            ],
          );
        },
      );
    } else {
      var result = await MongoDatabase.insert(data);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Device successfully added!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text("Return to homepage"))
            ],
          );
        },
      );

      _clearField();
    }
  }

  void _clearField() {
    companyController.text = "";
    productController.text = "";
    typeController.text = "";
    osController.text = "";
    memoryController.text = "";
    inchController.text = "";
    screenController.text = "";
    ramController.text = "";
    gpuController.text = "";
    cpuController.text = "";
    priceController.text = "";
  }

/*void insertData(String company, String product, String type, String os,
      String memory, double inches, String ram, String gpu, String cpu, double price) {
    MongoDbModel(
        //id: id,
        //laptopId: ,
        company: companyController.text,
        product: productController.text,
        typeName: typeController.text,
        inches: double.parse(inchController.text),
        screenResolution: screenController.text,
        cpu: cpuController.text,
        ram: ramController.text,
        memory: memoryController.text,
        gpu: gpuController.text,
        opSys: osController.text,
        price: double.parse(priceController.text),

    );
  }*/
}
