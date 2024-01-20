import 'package:app_hf_pratico/app/modules/home/controller.dart';
import 'package:app_hf_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    const noImage = 'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg';

    return Scaffold(
      appBar: AppBar(title: const Text('App HF Prático.'), backgroundColor: Colors.greenAccent),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var store in state!)
              ListTile(
                leading: SizedBox(
                  width: 56.0,
                  child: ClipRRect( // Logo do Estabelecimento
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: store.image != null ? store.image! : noImage,
                    ),
                  ),
                ),
                title: Text(store.name), // Nome do Estabelecimento
                trailing: Container( // Status do Estabelecimento (Aberto/Fechado)
                  decoration: BoxDecoration(
                    color: store.isOnline ? Colors.green : Colors.black45,
                    border: Border.all(color: Colors.black12, width: 2.0),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Text(
                    store.isOnline ? 'Aberto' : 'Fechado',
                    style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8.0, 
                  horizontal: 16.0
                ),
                onTap: () => Get.toNamed(Routes.STORE.replaceFirst(':id', store.id.toString())),
              )],
      ),
      onEmpty: const Center(
        child: Text('Não há estabelecimentos disponíveis.'),
      ),
      onError: (error) => Center(
        child: Text(error!),
      ),
    )
  );
  }
}