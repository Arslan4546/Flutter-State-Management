import 'package:getxdemo/mvvm_practice/models/loginModels/user_model.dart';
import 'package:getxdemo/mvvm_practice/resources/App_Urls/appUrls.dart';

import '../../data/Networks/networkAPI_Services.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();
  Future<UserModel> UserAPI() async {
    dynamic response = await _apiService.getAPI(Appurls.userModel);
    return UserModel.fromJson(response);
  }
}
