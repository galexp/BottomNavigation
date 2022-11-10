import 'package:flutter/material.dart';
import 'package:redo_todo/widgets/favorite_widget.dart';
import 'package:redo_todo/widgets/home_widget.dart';
import 'package:redo_todo/widgets/profile_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  int selectedIndex = 0;

  static const List<Widget> screen_list = [
    HomeWidget(),
    FavoriteWidget(),
    ProfileWidget()
  ];

  static const List<String> text_list = ["RedoTodo", "Favorite", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text_list[selectedIndex]),
      ),
      body: screen_list[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
      ),
    );
  }
}
