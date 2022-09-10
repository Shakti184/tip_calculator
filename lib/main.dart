import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller=TextEditingController();
  final List<bool> _selection =[true,false,false];
  String tip='cal';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children:  [
               
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    tip,
                    style: const TextStyle(fontSize: 30),
                    ),
                  ),
              const Text('Total Amount'),
              SizedBox(
                width: 80,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: '\$100.00'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ToggleButtons(
                  children: const [Text('10%'),Text('15%'),Text('20%')], 
                  isSelected: _selection,
                  onPressed: updateSelection,
                  ),
              ),
              FlatButton(onPressed: (){}, child: const Text('Calculator Tip'),
              color: Colors.deepPurple,
              textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void updateSelection(int selectIndex){
    setState(() {
      for(int i=0;i<_selection.length;i++){
      _selection[i]=selectIndex==i;
      }
    });
  }
  void calculateTip(){
    final totalAmount = double.parse(controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1,0.15,0.2][selectedIndex];
    
    final tipTotal = (totalAmount*tipPercentage).toStringAsFixed(2);
    
    setState(() {
      tip='\$$tipTotal';
    });

  }
}



