import 'package:get/get.dart';
import 'package:getxdemo/mvvm_practice/models/Login_Model/user_model.dart';
import 'package:getxdemo/mvvm_practice/repository/home_repository/home_repo.dart';

import '../../data/Response/status.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserModel().obs;
  RxString error = "".obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void getAPI() {
    _api.UserAPI().then((value) {
      setRxRequestStatus(Status.COMPLETE);
      setUserList(value);
    }).onError((error, StackTrace) {
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
    });
  }
}
