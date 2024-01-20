import 'package:app_hf_pratico/app/data/models/store.dart';
import 'package:app_hf_pratico/app/modules/store/repository.dart';
import 'package:get/get.dart';

class StoreController extends GetxController with StateMixin<StoreModel> {
  final StoreRepository repository;
  StoreController(this.repository);

  @override
  void onInit() {

    int id = int.parse(Get.parameters['id']!);

    repository.getStore(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }
}