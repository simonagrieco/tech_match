import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multiselect/multiselect.dart';
import 'package:tech_match/dpHelper/MongoDBModel.dart';

import '../components/widget_list.dart';
import '../dpHelper/mongodb.dart';
import 'home.dart';

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
  //List<String> priceList = [];
  final priceController = new TextEditingController();

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
                    "12.5",
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
                    "macOS",
                    "Mac OS X",
                    "Linux",
                    "No OS",
                    "Chrome OS"
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
                    "16GB Flash Storage",
                    "32GB Flash Storage",
                    "32GB SSD",
                    "64GB Flash Storage",
                    "128GB SSD",
                    "128GB Flash Storage",
                    "128GB SSD+ 1TB HDD",
                    "180GB",
                    "256GB SSD",
                    "256GB SSD + 1TB HDD",
                    "256GB SSD + 2TB HDD",
                    "256GB SSD +  500GB HDD",
                    "500GB HDD",
                    "508GB Hybrid"
                        "512GB SSD",
                    "512 Flash Storage",
                    "512GB SSD + 1TB HDD",
                    "512GB SSD + 256GB SSD",
                    "1TB HDD",
                    "2TB HDD",
                    "1.0TB Hybrid",
                    "1TB SSD +  1TB HDD",
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
                  options: const ["Intel", "AMD"],
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
                  options: const ["Intel", "AMD", "Nvidia"],
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter the maximum price",
                    prefixIcon: Icon(Icons.euro_rounded),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black45,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      companyList;
                      typeList;
                      inchList;
                      opsList;
                      memList;
                      screenList;
                      ramList;
                      cpuList;
                      gpuList;
                      double price = double.parse(priceController.text);

                      var dbmodel = await MongoDatabase.getFiltri(
                          companyList,
                          typeList,
                          opsList,
                          ramList,
                          inchList,
                          gpuList,
                          cpuList,
                          memList,
                          price);
                      // print(dbmodel);

                      if (dbmodel.length > 0) {
                        showMyDialog(dbmodel);
                      } else {
                        showMyDialogEmpy(dbmodel);
                      }
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

  showMyDialog(var dbmodel) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            title: const Text('Laptop finded', textAlign: TextAlign.center),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  //height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: ListView.builder(
                            itemCount: dbmodel.length,
                            shrinkWrap: true,
                            itemBuilder: (_, int index) => WidgetList(
                              ram: dbmodel[index].ram,
                              inches: dbmodel[index].inches,
                              memory: dbmodel[index].memory,
                              gpu: dbmodel[index].gpu,
                              cpu: dbmodel[index].cpu,
                              price: dbmodel[index].price,
                              product: dbmodel[index].product,
                              operSyst: dbmodel[index].opSys,
                              typename: dbmodel[index].typeName,
                              company: dbmodel[index].company,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }

  showMyDialogEmpy(var dbmodel) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            title: const Text('Laptop finded', textAlign: TextAlign.center),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  //height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "No laptop fouded!",
                    textAlign: TextAlign.center,
                  )),
            ),
          ),
        );
      },
    );
  }
}
