import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  List<Widget> listOfWidget = [];

  var index = 0;
  var msg = "";
  var phn = "";

  Widget LoginWidget() {
    return Column(
      children:[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (e){
              setState(() {
                msg = e.toString();
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Name"
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (e){
              setState(() {
                phn = e.toString();
              });
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Phone"
            ),
          ),
        ),
        ElevatedButton(
            onPressed: (){
              setState(() {
                index = 1;
              });
            },
            child: Text('Take Me')
        )
      ],
    );
  }

  Widget DetailWidget(){
    return Column(
      children:[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(msg + " "+ phn, style: TextStyle(color: Colors.black),)
        ),
        ElevatedButton(
            onPressed: (){
              setState(() {
                index = 0;
                msg = "";
                phn = "";
              });
            },
            child: Text('Back')
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Iam From Screen Two.",style: TextStyle(
            //   color: Colors.red,
            //   fontWeight: FontWeight.bold,
            //   fontSize: 23
            // ),),
            // GestureDetector(
            //   onTap: (){
            //     Navigator.pop(context);
            //     //Navigator.pushNamed(context, RoutesName.SECOND_PAGE);
            //   },
            //   child: Container(
            //     height: 40,
            //     width: 200,
            //     alignment: Alignment.center,
            //     margin: EdgeInsets.only(top: 10),
            //     decoration: BoxDecoration(
            //         border: Border.all(
            //             color: Colors.black,
            //             width: 1
            //         ),
            //         borderRadius: BorderRadius.circular(20)
            //     ),
            //     child: Text(
            //       'Go Back',
            //       style: TextStyle(
            //           color: Colors.purple,
            //           fontSize: 17,
            //           fontWeight: FontWeight.bold
            //       ),
            //     ),
            //   ),
            // )

            Container(
              height: MediaQuery.of(context).size.height*0.8,
              width:MediaQuery.of(context).size.width*0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 7,
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: Text('NOKIA',style: TextStyle(
                      color: Colors.white,
                      fontSize: 13
                    ),),
                  ),
                  Expanded(child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        index==0?
                        LoginWidget():
                        DetailWidget()
                      ],
                    ),
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.045,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: (){
                              setState(() {
                                index = 0;
                                msg = "";
                                phn = "";
                              });
                            },
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white,size: 15,)
                          ),
                          IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.home, color: Colors.white,size: 15,)
                          ),
                          IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.check_box_outline_blank, color: Colors.white,size: 15,)
                          ),
                        ],
                      )
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
