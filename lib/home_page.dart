import 'package:flutter/material.dart';
import 'package:gallery/images.dart';
import 'package:permission_handler/permission_handler.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    permission();
  }

  void permission() async {
    await [Permission.storage].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const ImageGrid(),
          ),
        );
      },
      child: Container(
          color: Colors.purpleAccent.withOpacity(.3),
          padding: const EdgeInsets.all(22),
          child: const Text('Press here\nto show\nImage Grid')),
    ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueAccent.withOpacity(0.5),
      elevation: 0,
      title: const Text('Images From Specific Folder'),
    );
  }
}
