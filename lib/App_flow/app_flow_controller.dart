// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import '../Constrant/preferences.dart';
import '../Constrant/utilities.dart';

class AppFlowController extends GetxController {
  RxInt selectType = 0.obs;
  var isaccess =
      Preference.preference.getBool(key: PrefernceKey.isaccess, defVal: false);

  @override
  void onInit() {
    super.onInit();
  }
}
