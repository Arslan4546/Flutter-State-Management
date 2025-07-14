import 'package:get/get.dart';
import 'package:getxdemo/mvvm_practice/models/User_Model/user_list_model.dart';
import 'package:getxdemo/mvvm_practice/repository/home_repo.dart';

import '../../Data/Response/status.dart';

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
      setUserList(value as UserModel);
    }).onError((error, StackTrace) {
      setRxRequestStatus(Status.ERROR);
      setError(error.toString());
    });
  }
}
