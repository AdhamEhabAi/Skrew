import 'package:flutter/material.dart';

void addScoreToResult (Map<String,int> score , Map<String,int> total )
{ 
  score.forEach((key,value)
  {
    if(total.containsKey(key))
    {
      total[key] = total[key] !+ value;
    }else
    {
      total[key] = value;
    }
  });
}
Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exitApp = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Really ?'),
        content: const Text('Do you want to close the app ??'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
  return exitApp ?? false;
}