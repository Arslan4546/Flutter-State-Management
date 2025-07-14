import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxdemo/MVMM_Practice/Data/Response/status.dart';
import 'package:getxdemo/MVMM_Practice/Resources/App_Components/internet_exception_widget.dart';
import 'package:getxdemo/MVMM_Practice/view_models/controller/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.getAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      switch (homeController.rxRequestStatus.value) {
        case Status.LOADING:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case Status.ERROR:
          if (homeController.error.value == "No internet") {
            return InternetExceptionWidget(onPressed: () {
              homeController.getAPI();
            });
          } else {
            return Center(
              child: Text(homeController.error.toString()),
            );
          }

        case Status.COMPLETE:
          return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(
                    homeController.userList.value.data![index].firstName
                        .toString(),
                  ),
                  subtitle: Text(
                    homeController.userList.value.data![index].lastName
                        .toString(),
                  ),
                ));
              });
      }
    }));
  }
}

// this code is for sharePreferences and you can use accordingly
// import 'package:flutter/material.dart';
// import 'package:getxdemo/MVMM_Practice/view_models/controller/user_preferences_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// UserPreferencesModel userPreferencesModel = UserPreferencesModel();

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () {
//                 userPreferencesModel.removeUser();
//               },
//               icon: Icon(Icons.logout))
//         ],
//       ),
//       body: Center(
//         child: Text("This is Home Screen!"),
//       ),
//     );
//   }
// }
