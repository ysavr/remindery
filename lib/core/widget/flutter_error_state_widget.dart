import 'package:flutter/material.dart';

import 'package:remindery/utils/style/text_style.dart';

class FlutterErrorStateWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const FlutterErrorStateWidget(this.errorDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Global Error handling",
      home: customErrorWidget(errorMessage: errorDetails.exceptionAsString()),
    );
  }

  Widget customErrorWidget({required String errorMessage}) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const Icon(
                    Icons.error_sharp,
                    size: 75,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    errorMessage,
                    style: AppTextStyle.sathosiRegular17(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
