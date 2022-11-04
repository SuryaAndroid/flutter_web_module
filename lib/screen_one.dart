import 'package:flutter/material.dart';
import 'package:flutter_web_module/main.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Iam From Screen One",style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 23
            ),),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.SECOND_PAGE);
              },
              child: Container(
                height: 40,
                width: 200,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  'Navigate Me',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
