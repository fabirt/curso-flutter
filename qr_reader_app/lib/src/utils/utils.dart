import 'package:url_launcher/url_launcher.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';

launchScan( ScanModel scan ) async {
  if (scan.type == 'http') {
    if (await canLaunch(scan.value)) {
      await launch(scan.value);
    } else {
      
    }
  } else {

  }
}