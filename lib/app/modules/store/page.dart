import 'package:app_hf_pratico/app/modules/store/controller.dart';
import 'package:app_hf_pratico/app/widgets/store_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class StorePage extends GetView<StoreController> {

  @override
  Widget build(BuildContext context) {

    const noImage = 'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg';

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black38)
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  SizedBox( // Logo do Estabelecimento
                    width: 96.0,
                    child: ClipRRect( 
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: state!.image != null ? state.image! : noImage,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0, height: 4.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.name,
                          style: Get.textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 8.0),
                        StoreStatus(state.isOnline)
                      ]
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}