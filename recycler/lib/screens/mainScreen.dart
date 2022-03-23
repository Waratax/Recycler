import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen();

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? barcode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined),
          )
        ],
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton.icon(
                      onPressed: scanBarcode,
                      icon: Icon(Icons.camera_alt),
                      label: Text("Scan Barcode"))),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent)),
                    alignment: Alignment.bottomCenter,
                    child: Text("AdvertisementSpaceHolder"),
                  ),
                ),
              ],
            ),
          ])),
    );
  }

  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        this.barcode = barcode;
      });
    } on Exception {
      barcode = 'Failed to get platform version.';
    }
  }
}
