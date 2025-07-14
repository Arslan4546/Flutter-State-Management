import 'package:getxdemo/mvvm_practice/Models/Login_Model/user_model.dart';
import 'package:getxdemo/mvvm_practice/resources/App_Urls/app_urls.dart';

import '../Data/Networks/networkAPI_Services.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();
  Future<UserModel> UserAPI() async {
    dynamic response = await _apiService.getAPI(AppUrls.userModel);
    return UserModel.fromJson(response);
  }
}
