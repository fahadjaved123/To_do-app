import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_dolist/Post_Screen.dart';
import 'package:to_dolist/Provider/Provid.dart';
import 'package:to_dolist/Provider/true_provider.dart';
import 'package:to_dolist/To%20Do%20list/todo.dart';
import 'package:to_dolist/To%20Do%20list/toitem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget{

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final refrence=FirebaseDatabase.instance.ref('Todo');
  final _todocontrol=TextEditingController();
  final controller=TextEditingController();
   void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
     final _istrue=Provider.of<IsTrue>(context,listen: false);
    return Scaffold(
      drawer: Drawer(
        width: 200,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context)=>PostScreen()));
          },child: Icon(Icons.add),),
      backgroundColor: Color.fromARGB(255, 243, 241, 243),
      appBar: _buildAppbar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child:Consumer<IsTrue>(
    builder: (context,Value,child){
      return TextField(
        onChanged: (value){
          Value.find(value);
        },
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search,color: Colors.black,size: 20,),
          prefixIconConstraints:BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
        ),

      );
    }),

    ),
                SizedBox(
                  height: 10,
                ),
                 Text('All ToDos',style: TextStyle(fontSize: 40,color: Colors.black,),),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child:
                      Consumer<IsTrue>(
                builder: (contex,value,child){
                  return FirebaseAnimatedList(
                      query: refrence,
                      itemBuilder: (context,DataSnapshot,Animation,Index){
                        value.istrue.add(false);
                        List items=[];
                        int? iconCodePoint = DataSnapshot.child('IconCodePoint').value as int;
                        String? fontFamily = DataSnapshot.child('IconFontFamily').value as String?;
                        IconData iconData=IconData(iconCodePoint,fontFamily: fontFamily);
                        items.add(DataSnapshot.child('Title').value.toString());
                        final String title=DataSnapshot.child('Title').value.toString();
                        if(controller.text.isEmpty){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child:  ListTile(
                                leading: InkWell(
                                  onTap: (){
                                    value.setTrue(Index);
                                  },
                                  child: Icon(
                                    value.istrue[Index]? Icons.check_box:
                                    Icons.check_box_outline_blank,color: Colors.deepPurple,),
                                ),
                                title: Text(DataSnapshot.child('Title').value.toString().toUpperCase(),
                                  
                                  style: TextStyle(decoration:value.istrue[Index]? TextDecoration.lineThrough:
                                  TextDecoration.none,shadows: [Shadow(offset:Offset(2.0, 1.0,),
                                    color: Colors.deepPurple.shade200,blurRadius: 2.0 ,)]
                                  ),
                                ),

                                subtitle: Icon(iconData),
                                trailing: PopupMenuButton(
                                    icon: Icon(Icons.more_horiz_outlined),
                                    itemBuilder: (context)=>[
                                      PopupMenuItem(
                                        value: 1,
                                        child: ListTile(
                                          onTap: (){
                                            Navigator.pop(context);
                                            refrence.child(DataSnapshot.child('ID').value.toString()).remove();
                                          },
                                          leading: Icon(Icons.delete_outline_rounded,color: Colors.red,),
                                          title: Text('Delete',style: TextStyle(fontSize: 20,color: Colors.redAccent.shade200),),
                                        ),
                                      ),
                                      PopupMenuItem(
                                          value: 2,
                                          child: ListTile(
                                            onTap: (){
                                              Navigator.pop(context);
                                              showMyDialog(DataSnapshot.child('Title').value.toString(),
                                                  DataSnapshot.child('ID').value.toString());
                                            },
                                            leading: InkWell(

                                                child: Icon(Icons.edit_note_rounded,size: 35,color: Colors.greenAccent,)),
                                            title: Text('Edit',style: TextStyle(fontSize: 20,color: Colors.greenAccent.shade400),),
                                          ))
                                    ]),

                              ),

                            ),
                          );
                        }
                        else if(title.toString().toUpperCase().contains(controller.text.toString().toUpperCase())){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                  leading: InkWell(
                                    onTap: (){
                                      value.setTrue(Index);
                                    },
                                    child: Icon(
                                      value.istrue[Index]? Icons.check_box:
                                      Icons.check_box_outline_blank,color: Colors.deepPurple,),
                                  ),
                                  title: Text(DataSnapshot.child('Title').value.toString().toUpperCase(),
                                    style: TextStyle(decoration:value.istrue[Index]? TextDecoration.lineThrough:
                                    TextDecoration.none,shadows: [Shadow(offset:Offset(2.0, 1.0,),
                                      color: Colors.deepPurple.shade200,blurRadius: 2.0 ,)]
                                    ),
                                  ),
                                  trailing: PopupMenuButton(
                                      icon: Icon(Icons.more_horiz_outlined),
                                      itemBuilder: (context)=>[
                                        PopupMenuItem(
                                          value: 1,
                                          child: ListTile(
                                            onTap: (){
                                              Navigator.pop(context);
                                              refrence.child(DataSnapshot.child('ID').value.toString()).remove();
                                            },
                                            leading: Icon(Icons.delete),
                                            title: Text('Delete'),
                                          ),
                                        ),
                                        PopupMenuItem(
                                            value: 2,
                                            child: ListTile(
                                              onTap: (){
                                                Navigator.pop(context);
                                                showMyDialog(DataSnapshot.child('Title').value.toString(),
                                                    DataSnapshot.child('ID').value.toString());
                                              },
                                              leading: InkWell(

                                                  child: Icon(Icons.edit)),
                                              title: Text('Edit'),
                                            ))
                                      ])

                              ),


                            ),
                          );
                        }
                        else{
                          return Container();
                        }


                      });
                }),


                )
              ],
            ),
          ),
          
        ],
        
      )
    );

  }
  Future<void> showMyDialog(String title,String id)async{
     _todocontrol.text=title;
     return showDialog(
         context: context,
         builder: (BuildContext context){
           return AlertDialog(
             title: Text('Update',style: TextStyle(shadows: [Shadow(color: Colors.grey.shade700,offset: Offset(2.0, 0.0))]),),
             content: Container(
               child: TextField(
                 controller: _todocontrol,
                 decoration: InputDecoration(
                   hintText: 'Edit'
                 ),
               ),
             ),
             actions: [
               TextButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   child: Text('Cancel',style: TextStyle(fontSize: 20,color: Colors.red),)),
               TextButton(
                   onPressed: (){
                     Navigator.pop(context);
                     refrence.child(id).update({
                       'Title':_todocontrol.text.toString().toUpperCase(),

                     }).then((value){
                       print('Updated');
                     }).onError((error,StackTrace){
                       print(error.toString());
                     });
                   },
                   child: Text('Edit',style: TextStyle(fontSize: 20,color: Colors.greenAccent.shade400))),
             ],
           );
         });
  }

}
  Widget searchBar(){
  TextEditingController controller=TextEditingController();
    return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(Icons.search,color: Colors.black,size: 20,),
                    prefixIconConstraints:BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 25,
                    ), 
                    border: InputBorder.none,
                    hintText: 'Search',
                  ),
                  
                ),
              );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 243, 241, 243),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 60,
            width: 60,
            child: ClipRRect(child: Image.asset('assests/images/avtar.png')),
          )
        ],
      ),
    );
  }

