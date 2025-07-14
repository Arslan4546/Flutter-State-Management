import 'package:getxdemo/MVMM_Practice/Data/Networks/networkAPI_Services.dart';
import 'package:getxdemo/MVMM_Practice/Resources/App_Urls/app_urls.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> loginAPI(var data) async {
    dynamic response = await _apiService.postAPI(data, AppUrls.loginURl);
    return response;
  }
}
