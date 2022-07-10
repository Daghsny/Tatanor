import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String? scanResult;
  String qrResult = "Not Yet Scannner";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "أضافة نقاط ",
          style:
              TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'taj'),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "إمسح الـــــكود\nحتــــــــــى تتمكن\nمن المشاركة\nفي المسابقة",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'taj'),
              textAlign: TextAlign.center,
            ),
            const Text(
              "",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'taj'),
              textAlign: TextAlign.center,
            ),
            Text(
              scanResult == null ? 'Scan a code!' : 'Scan result:$scanResult ',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                onPrimary: Colors.white,
              ),
              icon: const Icon(
                Icons.scanner_outlined,
              ),
              label: const Text('Start Scan'),
              onPressed: scanBarcode,
            )
          ],
        ),
      ),
    );
  }

  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );
    } on PlatformException {
      scanResult = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      this.scanResult = scanResult;
    });
  }
}
