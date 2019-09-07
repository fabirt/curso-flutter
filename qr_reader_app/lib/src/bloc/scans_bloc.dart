import 'dart:async';

import 'package:qr_reader_app/src/bloc/validator.dart';
import 'package:qr_reader_app/src/providers/db_provider.dart';

class ScansBloc with Validators {

  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    // Obtener scans de la base de datos
    getScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStreamGeo => _scansController.stream.transform(validateGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validateHttp);

  dispose() {
    _scansController?.close();
  }

  getScans() async {
    _scansController.sink.add(await DBProvider.db.getAllScans());
  }

  addScan(ScanModel scan) async {
    await DBProvider.db.newScan(scan);
    getScans();
  }

  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    getScans();
  }

  deleteAll() async {
    await DBProvider.db.deleteAll();
    getScans();
  }

}