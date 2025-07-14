import 'package:get/get.dart';
import 'package:getxdemo/MVMM_Practice/Repositories/home_repository.dart';
import 'package:getxdemo/MVMM_Practice/models/User_Model/user_list_model.dart';

import '../../Data/Response/status.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserModel().obs;
  RxString error = "".obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(UserModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void getAPI() async {
    await _api.userAPI().then((value) {
      setRxRequestStatus(Status.COMPLETE);
      setUserList(value);
    }).onError((error, StackTrace) {
      setRxRequestStatus(Status.ERROR);
      print(StackTrace);
      setError(error.toString());
    });
  }
}
