import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final String result;
  final Function onRestart;
  const ResultDialog({super.key, required this.result, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        height: height * 0.27,
        padding: EdgeInsetsDirectional.symmetric(vertical: height * 0.05),
        decoration: BoxDecoration(
          color: result.contains("Winner") ? Colors.green : Colors.black54,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(bottom: height * 0.03),
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => onRestart(),
                icon: const Icon(Icons.replay),
                label: const Text("RESTART"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
