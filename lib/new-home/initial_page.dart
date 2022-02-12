import 'package:flutter/material.dart';
import 'package:hermes_app/new-home/data_backup-home.dart';
import 'package:hermes_app/widgets/button.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Cloud Storage',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: const [Text('last backup'), Text('28 may 2022')],
          ),
        ),
        ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Created Backup',
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
