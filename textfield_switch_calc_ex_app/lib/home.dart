import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late TextEditingController addController;
  late TextEditingController subController;
  late TextEditingController mulController;
  late TextEditingController divController;
  late bool addswitchValue;
  late bool subswitchValue;
  late bool mulswitchValue;
  late bool divswitchValue;
    String addRe = "";
    String subRe = "";
    String mulRe = "";
    String divRe = "";

  

@override
  void initState() {
    
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    addController = TextEditingController();
    subController = TextEditingController();
    mulController = TextEditingController();
    divController = TextEditingController();
    addswitchValue = true;
    subswitchValue = true;
    mulswitchValue = true;
    divswitchValue = true;
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                      controller: num1Controller,
                      decoration: const InputDecoration(
                        labelText: '첫번째 숫자를 입력하세요',
                        
                      ),
                      keyboardType: TextInputType.number,
                    ),
              ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: num2Controller,
                      decoration: const InputDecoration(
                        labelText: '두번째 숫자를 입력하세요',
                        
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 20, 50, 5),
                    child: Row(
                      
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => calc(), 
                            child:  Text('계산하기'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4)
                                            )
                              
                          ),
                          ),
                        ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                                        onPressed: () => clear(),
                                                        child: const Text('지우기'),
                                                        style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4)
                                                )
                              
                                                    ),
                                                  ),
                            )
                      ],
                    ),
                  
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 10, 10),
                    child: Row(
                      children: [
                        Text('덧셈'),
                            Switch(
                      value: addswitchValue,
                              // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                              onChanged: (addvalue) {
                                addswitchValue = addvalue;
 setState(() { });

                                  
                              },
                              ),
                              Text('뺄셈'),
                                  Switch(
                      value: subswitchValue,
                              // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                              onChanged: (subvalue) {
                                subswitchValue = subvalue;                   
 setState(() { });
                                  
                              },
                              ),
                              Text('곱셈'),
                                  Switch(
                      value: mulswitchValue,
                              // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                              onChanged: (mulvalue) {
                                mulswitchValue = mulvalue;         
                                   setState((){});
                                  
                              },
                              ),
                              Text('나눗셈'),
                                  Switch(
                      value: divswitchValue,
                              // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                              onChanged: (divvalue) {
                                divswitchValue = divvalue;
                                   setState(() { });

                                  
                              },
                              ),
                      ],
                    ),
                  ),
              SizedBox(
                height: 20,
              ),

                    TextField(
                    readOnly: true,
                    controller: addController,
                    decoration: const InputDecoration(
                      labelText: '덧셈결과',
                    
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                      readOnly: true,
                    controller: subController,
                    decoration: const InputDecoration(
                      labelText: '뺄셈결과',
                      
                  
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    readOnly: true,
                    controller: mulController,
                    decoration: const InputDecoration(
                      labelText: '곱셈결과',
                  
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    readOnly: true,
                    controller: divController,
                    decoration: const InputDecoration(
                      labelText: '나눗셈 결과',
                    ),
                    keyboardType: TextInputType.text,
                  ),

              ],
            ),
        ),
      ),
    );
  }



  // Function ------


clear() {
    num1Controller.clear();
         num2Controller.clear();
         addController.clear();
         subController.clear();
         mulController.clear();
         divController.clear();
}


calc() {
    if(num1Controller.text.trim().isEmpty && 
        num2Controller.text.trim().isEmpty) {
                  showSnackBar();
    }else {
      
      resultOn();
    }
}

resultOn() {
      setState((){});
      
          int num1 = int.parse(num1Controller.text.trim());
          int num2 = int.parse(num2Controller.text.trim());

          int sub = num1 - num2;
          int add = num1 + num2;
          int mul = num1 * num2;
          double div = num1 / num2;

          addRe = add.toString();
          subRe = sub.toString();
          mulRe = mul.toString();
          divRe = div.toString();


                    addswitchValue == true ?  addController.text = addRe : "";
                    subswitchValue == true ?   subController.text = subRe : "";
                    mulswitchValue == true ?    mulController.text =  mulRe : "";
                    divswitchValue == true ?   divController.text =  divRe : "";


}

showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar( 
        const SnackBar(
        content:  Text('숫자를 모두 입력하세요'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      )
      );
}

}