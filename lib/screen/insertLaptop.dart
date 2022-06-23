import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_match/screen/home.dart';

class InsertLaptopScreen extends StatefulWidget {
  const InsertLaptopScreen({Key? key}) : super(key: key);

  @override
  _InsertLaptopScreenState createState() => _InsertLaptopScreenState();
}

final companyController = new TextEditingController();
final productController = new TextEditingController();
final inchController = new TextEditingController();
final screenController = new TextEditingController();
final cpuController = new TextEditingController();
final gpuController = new TextEditingController();

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

      //email decoration
      decoration: InputDecoration(
        filled: true,
        hintText: "Company name",
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
      keyboardType: TextInputType.text,
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
        prefixIcon: Icon(Icons.pivot_table_chart_rounded),
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
        prefixIcon: Icon(Icons.fit_screen_rounded ),
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
        prefixIcon: Icon(Icons.settings),
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
        prefixIcon: Icon(Icons.settings),
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
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(24, 72, 160, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text("Insert", style: TextStyle(fontSize: 18),),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60),
                  companyField,
                  SizedBox(height: 20),
                  productField,
                  SizedBox(height: 20),
                  inchField,
                  SizedBox(height: 20),
                  screenField,
                  SizedBox(height: 20),
                  gpuField,
                  SizedBox(height: 20),
                  cpuField,
                  SizedBox(height: 60,),
                  getButton(),
                ],
              ),
            ),
          ),
        )

      ),
    );
  }
}
