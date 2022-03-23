import 'dart:html';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen();

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? scanResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                searchProduct();
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(scanResult.toString()),
            Row(
              children: [
                ElevatedButton.icon(
                    onPressed: scanBarcode,
                    icon: Icon(Icons.camera_alt),
                    label: Text("Scan Barcode"))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text("AdvertisementSpaceHolder"),
                  ),
                ),
              ],
            ),
          ])),
    );
  }

  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "90EE90", "Cansel", true, ScanMode.BARCODE);
    } on Exception {
      scanResult = "failed to scan";
    }
    if (!mounted) return;
    setState(() {
      this.scanResult = scanResult;
    });
  }
}

void searchProduct() {
  //database sucker
}
