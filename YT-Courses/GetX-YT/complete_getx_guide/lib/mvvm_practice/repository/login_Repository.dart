import 'package:getxdemo/mvvm_practice/data/Networks/networkAPI_Services.dart';
import 'package:getxdemo/mvvm_practice/resources/App_Urls/app_urls.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> loginAPI(var data) async {
    dynamic response = await _apiService.postAPI(data, AppUrls.loginURl);
    return response;
  }
}
