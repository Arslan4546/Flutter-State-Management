import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:splash_screen_practice/Bloc/Movie_Bloc/movie_bloc.dart';
import 'package:splash_screen_practice/Configs/Routes/route_names.dart';
import 'package:splash_screen_practice/Repositories/Movie_Repositories/movie_repository.dart';
import 'package:splash_screen_practice/Services/Storage/app_local_storage.dart';
import 'package:splash_screen_practice/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late MovieBloc _movieBloc;
  @override
  void initState() {
    super.initState();
    _movieBloc = MovieBloc(movieRepo: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              AppLocalStorage localStorage = AppLocalStorage();
              localStorage.deleteValue("token").then((value) {
                localStorage.deleteValue("isLogin").then((value) {
                  Navigator.pushNamed(context, RouteNames.loginScreen);
                });
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text("This is Home Screen")),
    );
  }
}
