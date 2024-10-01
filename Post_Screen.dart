import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:to_dolist/Provider/Provid.dart';
import 'package:to_dolist/Utils.dart';
import 'package:provider/provider.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {


  final _todocontrol=TextEditingController();
  final refrence=FirebaseDatabase.instance.ref('Todo');
  var selecteditem;
  @override
  void dispose() {
    super.dispose();
    _todocontrol.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final providerauth=Provider.of<ProvideScreen>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 241, 243),
      appBar: AppBar(
        title: Text('PostScreen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
                height: 150,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  top: 40,
                ) ,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 0.0),
                        color: Colors.grey,
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),

                    ],
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  controller: _todocontrol,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add New todo list',
                  ),
                ),
              ),
         Row(
           children: [
             const Padding(
                padding:  EdgeInsets.only(top: 15,left: 20),
                child: Text('Category:',style: TextStyle(fontSize: 20),),
              ),
           ],
         ),
             Consumer<ProvideScreen>(
                 builder: (context,value,child){
                   return Padding(
                     padding: const EdgeInsets.only(top: 5,left: 15),
                     child: Row(
                       children: [
                         Container(
                           child: IconButton(
                               onPressed: (){
                                 value.geticon(Icons.favorite);
                               }, icon: Icon(Icons.favorite)),
                         ),
                         IconButton(
                             onPressed: (){
                               value.geticon(Icons.home);
                             }, icon: Icon(Icons.home)),
                       ],
                     ),
                   );
                 }),

          SizedBox(height: 50,),
          Consumer<ProvideScreen>(
              builder: (context,value,child){
                return Container(
                  width: 350,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.blue,
                            ),

                          )
                      ),
                      onPressed: (){
                        if(_todocontrol.text.isEmpty ){
                          print('please enter todo');
                        }
                        else if(value.ion==null){
                          print('please select on icon');
                        }
                        else{
                          value.Add(_todocontrol.text.toString());
                        }

                      },
                      child: Center(child: Text('Add TODO',style: TextStyle(fontSize: 20),))),
                );
              }),

        ],
      ),
    );
  }

}

