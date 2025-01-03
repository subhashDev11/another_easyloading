import 'dart:io';
import 'package:another_easyloading/another_easyloading.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    // AnotherEasyLoading.dismiss();
    AnotherEasyLoading.showSuccess('Use in initState');
    AnotherEasyLoading.addStatusCallback(statusCallback);
  }

  @override
  void deactivate() {
    AnotherEasyLoading.dismiss();
    AnotherEasyLoading.removeCallback(statusCallback);
    super.deactivate();
  }

  void statusCallback(LoadingStatus status) {
    print('Test EasyLoading Status $status');
  }

  void loadData() async {
    try {
      await AnotherEasyLoading.show();
      HttpClient client = HttpClient();
      HttpClientRequest request =
          await client.getUrl(Uri.parse('https://github.com'));
      HttpClientResponse response = await request.close();
      print(response);
      await AnotherEasyLoading.dismiss();
    } catch (e) {
      await AnotherEasyLoading.showError(e.toString());
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text('loadData'),
          onPressed: () {
            AnotherEasyLoading.show(status: '加载中...');
            // loadData();
            // await Future.delayed(Duration(seconds: 2));
            // AnotherEasyLoading.show(status: 'loading...');
            // await Future.delayed(Duration(seconds: 5));
            // AnotherEasyLoading.dismiss();
          },
        ),
      ),
    );
  }
}
