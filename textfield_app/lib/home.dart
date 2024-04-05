import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Property
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late  String resultText;

  @override
  void initState() {
    
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    resultText = "";
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Single Textfield'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: num1Controller,
                decoration: const InputDecoration(
                  labelText: '첫번째 숫자를 입력하세요',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.text,
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: num2Controller,
                decoration: const InputDecoration(
                  labelText: '두번쪠 숫자를 입력하세요',
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.text,
              ),
            ),
      
        ElevatedButton(
      onPressed: () => inputCheck(),
      child: const Text('출력'),
      ),


      Padding(
        padding:  EdgeInsets.all(20.0),
        child: Text(
          
          resultText,
          style: const TextStyle(
            
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            
            
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }


//--- Functions ---

  inputCheck() {
    // textfield에 data가 있을 경우와 없을 경우 
    if(num1Controller.text.trim().isNotEmpty && 
        num2Controller.text.trim().isNotEmpty) {
                  showSnackBar();
    }else {
      
      errorSnackBar();
    }
  }
  errorSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
      content:  Text('숫자를 입력해 주세요'),
      backgroundColor: Colors.red,
      duration:  Duration(seconds: 2),
    )
    );
  }
  showSnackBar() {
setState((){});
    int num1 = int.parse(num1Controller.text.trim());
    int num2 = int.parse(num2Controller.text.trim());
  
      resultText = ('입력하신 숫자의 합은${num1+num2} 입니다.');


  
//setState((){});
    


    // ScaffoldMessenger.of(context).showSnackBar( 
    //   SnackBar(
    //   content:  Text('입력한 숫자의 합은$sum 입니다'),
    //   backgroundColor: Colors.blue,
    //   duration: const Duration(seconds: 2),
    // )  
    // );
  }
}
