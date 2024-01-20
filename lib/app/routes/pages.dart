import 'package:app_hf_pratico/app/modules/dashboard/binding.dart';
import 'package:app_hf_pratico/app/modules/dashboard/page.dart';
import 'package:app_hf_pratico/app/modules/store/binding.dart';
import 'package:app_hf_pratico/app/modules/store/page.dart';
import 'package:app_hf_pratico/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.DASHBOARD,
      page: ()=> DashboardPage(),
      binding: DashboardBinding()
    ),

    GetPage(
      name: Routes.STORE,
      page: ()=> StorePage(),
      binding: StoreBinding()
    ),
  ];
}