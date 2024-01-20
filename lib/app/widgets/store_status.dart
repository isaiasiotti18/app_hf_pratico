import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StoreStatus extends StatelessWidget {

  bool isOnline;

  StoreStatus(this.isOnline);

  @override
  Widget build(BuildContext context) {
    return Container( // Status do Estabelecimento (Aberto/Fechado)
      decoration: BoxDecoration(
        color: isOnline ? Colors.green : Colors.black45,
        border: Border.all(color: Colors.black12, width: 2.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Text(
        isOnline ? 'Aberto' : 'Fechado',
        style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
      ),
    );
  }
}