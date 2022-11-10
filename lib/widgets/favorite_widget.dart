import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redo_todo/provider/favourite_provider.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return ListView.builder(
        itemCount: provider.favouriteList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(provider.favouriteList[index]),
            trailing: IconButton(
                onPressed: () {
                  provider.addOrRemoveFavorite(provider.favouriteList[index]);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                )),
          );
        });
  }
}
