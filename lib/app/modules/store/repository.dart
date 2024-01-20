
// ignore_for_file: unused_field

import 'package:app_hf_pratico/app/data/models/store.dart';
import 'package:app_hf_pratico/app/data/providers/api.dart';

class StoreRepository {

  final Api _api;

  StoreRepository(this._api);

  Future<StoreModel> getStore(int id) => _api.getStore(id);
}