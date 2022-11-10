import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:redo_todo/provider/favourite_provider.dart';
import '../model/user.dart';
import 'dart:convert';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Future getUsers() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    List users = [];

    if (response.statusCode == 200) {
      var jsons = jsonDecode(response.body);

      for (var element in jsons) {
        users.add(User.fromJson(element));
      }
    } else {
      throw Exception("No data");
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Container(
        clipBehavior: Clip.none,
        child: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(data[index].name),
                      subtitle: Text(data[index].phone),
                      trailing: IconButton(
                          onPressed: () {
                            provider.addOrRemoveFavorite(data[index].name);
                          },
                          icon: provider.isExist(data[index].name)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                )
                              : const Icon(Icons.favorite_border_outlined)),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
