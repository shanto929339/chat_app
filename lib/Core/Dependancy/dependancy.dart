import 'package:firabse_realtime/View/Screen/Home/Controller/hom_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class DependancyInjection extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(()=> HomController(),fenix: true);

  }

}