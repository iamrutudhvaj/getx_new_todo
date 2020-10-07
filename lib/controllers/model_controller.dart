import 'package:get/get.dart';
import 'package:getx_new_todo/models/model.dart';

class ModelController extends GetxController {
  var testModel = TestModel().obs;

  void increment() {
    testModel.update((val) {
      val.count++;
    });
  }
}
