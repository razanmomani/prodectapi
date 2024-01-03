import 'package:get/get.dart';
class GeneralStatusModel{
  // waiting success erorr
  Rx<GeneralStatus> status = GeneralStatus.waiting.obs;
  RxString errorMsg=''.obs;
  void updateStatus(GeneralStatus newStatus) {
    status.value = newStatus;
  }
  void updateErorr(String nErorr) {
    errorMsg.value=nErorr;
  }
}
enum GeneralStatus {
  waiting,
  success,
  erorr,
}
