import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:tech_match/dpHelper/MongoDBModel.dart';

import '../dpHelper/mongodb.dart';



class findLaptopScreen extends StatefulWidget {
  const findLaptopScreen({Key? key}) : super(key: key);

  @override
  _findLaptopScreenState createState() => _findLaptopScreenState();
}

class _findLaptopScreenState extends State<findLaptopScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> companyList = [];
  List<String> typeList = [];
  List<String> inchList = [];
  List<String> opsList = [];
  List<String> memList = [];
  List<String> screenList = [];
  List<String> ramList = [];
  List<String> cpuList = [];
  List<String> gpuList = [];
  List<String> priceList = [];

  //RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[

                const Text(
                  "Add filter here",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "Company",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listCompanySelected) {
                    setState(() {
                      companyList = listCompanySelected;
                    });
                  },
                  options: const [
                    "Apple",
                    "Google",
                    "HP",
                    "Acer",
                    "Asus",
                    "Dell",
                    "Microsoft",
                    "Lenovo",
                    "Chuwi",
                    "MSI",
                    "Toshiba",
                    "Xiaomi",
                    "Huawei",
                    "VERO",
                    "Mediacom",
                    "Razer",
                    "LG",
                    "Fujitsu",
                  ],
                  selectedValues: companyList,
                  whenEmpty: ' Select a company',
                ),
                /*Text( //MODEL no perché è quello/quelli che si da in output dai filtri
                    "Model",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      //color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),*/

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "Type",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listTypeSelected) {
                    setState(() {
                      typeList = listTypeSelected;
                    });
                  },
                  options: const [
                    "Ultrabook",
                    "Notebook",
                    "Gaming",
                    "2 in 1 Convertible",
                    "Workstation",
                  ],
                  selectedValues: typeList,
                  whenEmpty: ' Select a type',
                ),

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "Inches",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listInchSelected) {
                    setState(() {
                      inchList = listInchSelected;
                    });
                  },
                  options: const [
                    "10.1",
                    "11.6",
                    "12",
                    "12.5"
                    "13",
                    "13.3",
                    "13.9",
                    "14",
                    "15.4",
                    "15.6",
                    "17.3",
                    "18.4",
                  ],
                  selectedValues: inchList,
                  whenEmpty: ' Select inches',
                ),

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "Operation System",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listOsSelected) {
                    setState(() {
                      opsList = listOsSelected;
                    });
                  },
                  options: const [
                    "Windows 10",
                    "MacOS",
                    "Mac OS X",
                    "Linux",
                    "No OS",
                  ],
                  selectedValues: opsList,
                  whenEmpty: ' Select OS',
                ),

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "Memory",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listMemory) {
                    setState(() {
                      memList = listMemory;
                    });
                  },
                  options: const [
                    "32GB",
                    "64GB",
                    "128GB",
                    "256GB",
                    "500GB",
                    "512GB",
                    "1TB",
                    "2TB"
                  ],
                  selectedValues: memList,
                  whenEmpty: ' Select memory gb',
                ),

                const SizedBox(
                  height: 30,
                ),

                /*const Text(
                  "Screen resolution",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listScreen) {
                    setState(() {
                      screenList = listScreen;
                    });
                  },
                  options: const [
                    "Windows 10",
                    "MacOS",
                    "Mac OS X",
                    "Linux",
                    "No OS",
                  ],
                  selectedValues: screenList,
                  whenEmpty: ' Select OS',
                ), */

                const Text(
                  "RAM",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listRam) {
                    setState(() {
                      ramList = listRam;
                    });
                  },
                  options: const [
                    "2GB",
                    "4GB",
                    "6GB",
                    "8GB",
                    "12GB",
                    "16GB",
                    "32GB",
                  ],
                  selectedValues: ramList,
                  whenEmpty: ' Select RAM gb',
                ),

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "CPU",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listCPU) {
                    setState(() {
                      cpuList = listCPU;
                    });
                  },
                  options: const [
                    "Intel",
                    "AMD"
                  ],
                  selectedValues: cpuList,
                  whenEmpty: ' Select CPU type',
                ),

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "GPU",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    //color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listGPU) {
                    setState(() {
                      gpuList = listGPU;
                    });
                  },
                  options: const [
                    "Intel",
                    "AMD",
                    "Nvidia"
                  ],
                  selectedValues: gpuList,
                  whenEmpty: ' Select GPU type',
                ),

                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "Price",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    // color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*RangeSlider(
                  values: _currentRangeValues,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ), */
                const SizedBox(
                  height: 10,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> listPrice) {
                    setState(() {
                      priceList = listPrice;
                    });
                  },
                  options: const [
                    "100 - 300€",
                    "300 - 500€",
                    "500 - 700€",
                    "700 - 900€",
                    "+ 1000€"
                  ],
                  selectedValues: priceList,
                  whenEmpty: ' Select GPU type',
                ),


                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      /*if(companyList.isEmpty || typeList.isEmpty || inchList.isEmpty || opsList.isEmpty
                      || memList.isEmpty || screenList.isEmpty || ramList.isEmpty || cpuList.isEmpty ||
                      gpuList.isEmpty || priceList.isEmpty){
                        Toast.showToast(
                          'Email o password errate, riprova',
                          context,
                          toastPosition: T.BOTTOM,
                          textStyle: TextStyle(fontSize: 16, color: GFColors.DARK),
                          backgroundColor: Colors.grey.shade200,

                        );
                      }*/
                      companyList;
                      typeList;
                      inchList;
                      opsList;
                      memList;
                      screenList;
                      ramList;
                      cpuList;
                      gpuList;
                      priceList;

                      MongoDatabase.getFiltri(companyList, typeList, opsList, ramList, inchList);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(24, 72, 160, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "Find",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
