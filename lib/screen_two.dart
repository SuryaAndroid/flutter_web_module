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
  var adrs = "";
  var error = false;

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
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (e){
              setState(() {
                adrs = e.toString();
              });
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Address"
            ),
          ),
        ),
        ElevatedButton(
            onPressed: (){
              setState(() {
                if(msg == ""||phn==""||adrs==""){
                  error = true;
                }else{
                  index = 1;
                  error = false;
                }
              });
            },
            child: Text('Take Me')
        ),
        error?
        Container(
          height: MediaQuery.of(context).size.height*0.091,
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          color: Colors.red,
          child: Row(
            children: [
              Text("Please Fill All Details",style: TextStyle(color: Colors.white),)
            ],
          ),
        ):Container(),
      ],
    );
  }

  Widget DetailWidget(){
    return Column(
      children:[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Your Details \n\n"+msg + "\n"+ phn+"\n"+adrs, style: TextStyle(color: Colors.black),)
        ),
        ElevatedButton(
            onPressed: (){
              setState(() {
                index = 0;
                msg = "";
                phn = "";
                adrs = "";
              });
            },
            child: Text('Back')
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        color: Colors.white,
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
              height: MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 10,
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
                            icon: Icon(Icons.arrow_back_ios, color: Colors.white,size: height*0.03,)
                          ),
                          IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.home, color: Colors.white,size: height*0.03,)
                          ),
                          IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.check_box_outline_blank, color: Colors.white,size: height*0.03,)
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
