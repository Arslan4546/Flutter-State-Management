import 'package:getxdemo/MVMM_Practice/Resources/App_Urls/app_urls.dart';
import 'package:getxdemo/MVMM_Practice/models/User_Model/user_list_model.dart';

import '../Data/Networks/networkAPI_Services.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();
  Future<UserModel> userAPI() async {
    dynamic response = await _apiService.getAPI(AppUrls.userModel);
    print(response);
    return UserModel.fromJson(response);
  }
}
