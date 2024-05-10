import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';




void main (){
  runApp(const MainPage());
}
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  final TextEditingController _textController = TextEditingController(text:'');
  final GlobalKey _qrkey = GlobalKey();
  String data ='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Qr Code Scanner'),
        backgroundColor: const Color.fromARGB(255, 0, 90, 200),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 15.0),
          Padding(padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child:TextField(
            controller: _textController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15),
                labelText: 'Enter Name To Generate Qr_code',
              labelStyle: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,width: 3.0,
                ),
              ),
            ),
          ),),
          const SizedBox(
              height: 15.0),
          RawMaterialButton(onPressed: (){
            setState(() {
              data = _textController.text;
            });
          },
          fillColor: Colors.blue,
          shape: const StadiumBorder(),
          padding:  const EdgeInsets.symmetric(horizontal: 38, vertical: 18),
            child: const Text('Generate', style: TextStyle(color: Colors.white,
            fontSize: 19,)),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: RepaintBoundary(
              key: _qrkey,
              child:QrImageView(data:data,
                version: QrVersions.auto,
                size: 280,
                gapless: true,
                errorStateBuilder: (ctx,err){
                return const Center(
                  child: Text('Something went Wrong!!!',
                  textAlign: TextAlign.center,));

                },
              ) ,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RawMaterialButton(onPressed: (){},
          fillColor: Colors.blue,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 19),
            child: const Text('Export',
            style: TextStyle(color: Colors.white,
            fontSize: 18)
              ,),
          )
        ],),
      ),
    );
  }
}
