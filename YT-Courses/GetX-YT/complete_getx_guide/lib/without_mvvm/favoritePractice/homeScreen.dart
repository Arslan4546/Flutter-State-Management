import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/without_mvvm/favoritePractice/favoriteController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _TestingscreenState();
}

class _TestingscreenState extends State<HomeScreen> {
  Favoritecontroller list = Get.put(Favoritecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Favorite Practice",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: list.fruitList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                onTap: () {
                  if (list.tempList
                      .contains(list.fruitList[index].toString())) {
                    list.removeController(list.fruitList[index].toString());
                  } else {
                    list.addController(list.fruitList[index].toString());
                  }
                },
                title: Text(list.fruitList[index].toString()),
                trailing: Obx(
                  () => Icon(
                    Icons.favorite,
                    color:
                        list.tempList.contains(list.fruitList[index].toString())
                            ? Colors.red
                            : Colors.white,
                  ),
                )),
          );
        },
      ),
    );
  }
}
