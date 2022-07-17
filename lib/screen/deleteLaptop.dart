// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:tech_match/dpHelper/mongodb.dart';
import 'package:tech_match/screen/delete.dart';

import 'home.dart';

class DeleteLaptopScreen extends StatefulWidget {
  const DeleteLaptopScreen({Key? key}) : super(key: key);

  @override
  _DeleteLaptopScreenState createState() => _DeleteLaptopScreenState();
}

final deleteController = TextEditingController();

class _DeleteLaptopScreenState extends State<DeleteLaptopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(24, 72, 160, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        title: const Text("Find device"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
          child: Text(
        "Search for a device to remove it",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black45),
      )),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Cisrefudhy");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: MongoDatabase.getData(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            List suggestions = snapshot.data!.where((searchResults) {
              final result = searchResults.toString().toLowerCase();
              final input = query.toLowerCase();

              return result.contains(input);
            }).toList();
            return ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(suggestions[index]["Product"]),
                  onTap: () {
                    query = suggestions[index]["Product"];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Delete(
                          device: suggestions[index]["Product"],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text("Data not found."),
            );
          }
        }
      },
    );
  }
}
