import 'package:app_hf_pratico/app/modules/dashboard/controller.dart';
import 'package:app_hf_pratico/app/modules/home/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    bottomNavigationBar: Obx(() => NavigationBar(
      onDestinationSelected: controller.changePageIndex,
      selectedIndex: controller.currentPageIndex.value,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.explore_outlined), 
          selectedIcon: Icon(Icons.explore),          
          label: 'Início'
        ),
        NavigationDestination(
          icon: Icon(Icons.view_list_outlined),
          selectedIcon: Icon(Icons.view_list),
          label: 'Meus Pedidos' 
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outlined),
          selectedIcon: Icon(Icons.person),
          label: 'Perfil'
        )
      ]
    )),
    body: Obx(() =>
      IndexedStack(
        index: controller.currentPageIndex.value,
        children: [
          HomePage()
        ],
      ),
    )
  );
  }
}