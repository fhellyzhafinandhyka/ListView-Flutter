import 'package:flutter/material.dart';
import 'package:modul4/FruitDataModel.dart';
import 'package:modul4/FruitDetail.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    static List<String> fruitname =['Banana','Mango','Orange','PineApple'];

    static List url = [
      'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
      'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
      'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];

    final List<FruitDataModel> Fruitdata = List.generate(
        fruitname.length,
            (index)
        => FruitDataModel('${fruitname[index]}', '${url[index]}','${fruitname[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toko Buah'),),
      body: ListView.builder(
           itemCount: Fruitdata.length,
          itemBuilder: (context,index){
             return Card(
               child: ListTile(
                 title: Text(Fruitdata[index].name),
                 leading: SizedBox(
                   width: 50,
                   height: 50,
                   child: Image.network(Fruitdata[index].ImageUrl),
                 ),
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FruitDetail(fruitDataModel: Fruitdata[index],)));
                 },
               ),
             );
          }
      )
    );
  }
}