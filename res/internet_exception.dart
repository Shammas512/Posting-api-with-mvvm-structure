import 'package:flutter/material.dart';

class InternetWidget extends StatefulWidget {
  final VoidCallback onpress;
  const InternetWidget({super.key, required this.onpress});

  @override
  State<InternetWidget> createState() => _InternetWidgetState();
}

class _InternetWidgetState extends State<InternetWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: height * 0.15),
        const Icon(Icons.cloud_off, size: 64, color: Colors.grey),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text("Internet error"),
        ),
        InkWell(
          onTap: widget.onpress, // Executing the callback properly
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 44,
            width: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Added color so white text is visible
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Retry",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}