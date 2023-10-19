import 'dart:convert';

import 'package:api_demo/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<List<User>> futureUser;

  @override
  void initState() {
    futureUser = fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User App"),
        ),
        body: FutureBuilder<List<User>>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.green.shade300,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data![index].imageUrl),
                      ),
                      title: Text(
                          "${snapshot.data![index].title} ${snapshot.data![index].firstname} ${snapshot.data![index].lastname}"),
                      subtitle: Text(snapshot.data![index].email),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.green.shade900,
                      thickness: 2,
                    )),
                    Row(
                      children: List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              )),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.green.shade900,
                      thickness: 2,
                    )),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Future<List<User>> fetchUser() async {
  var user = await http.get(Uri.parse("https://randomuser.me/api/?results=5"));
  var data = jsonDecode(user.body);
  List result = data["results"];
  return List<User>.from(result.map((e) => User.fromMapToObject(e)));
}
