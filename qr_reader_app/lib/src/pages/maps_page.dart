import 'package:flutter/material.dart';
import 'package:qr_reader_app/src/bloc/scans_bloc.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:qr_reader_app/src/utils/utils.dart' as utils;

class MapsPage extends StatelessWidget {

  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {

    scansBloc.getScans();

    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStreamGeo,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }

        final scans = snapshot.data;
        if (scans.length == 0) {
          return Center(child: Text('No hay información'),);
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red,),
              onDismissed: (direction) => scansBloc.deleteScan(scans[i].id),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
                title: Text('Geolocalización'),
                subtitle: Text(scans[i].toString()),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
                onTap: () => utils.launchScan(context, scans[i]),
              ),
            );
          },
        );
        
      },
    );
  }
}