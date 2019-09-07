import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';

launchScan( BuildContext context, ScanModel scan ) async {
  if (scan.type == 'http') {
    if (await canLaunch(scan.value)) {
      await launch(scan.value);
    } else {
      
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}