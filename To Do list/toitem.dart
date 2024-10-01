import 'package:flutter/material.dart';
import 'todo.dart';

class Todoitem extends StatelessWidget{
  final ToDo todo;
  final ontodochange;
  final ontododelect;
  
  Todoitem({Key? key,required this.todo,
  required this.ontododelect,required this.ontodochange
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          ontodochange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15)),
          tileColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,vertical: 5),
          leading: Icon(
             todo.isdone? Icons.check_box:
             Icons.check_box_outline_blank,
          color: Colors.blue,),
          title: Text(todo.toDOtext.toString(),
          style: TextStyle(fontSize: 20,decoration:
          todo.isdone? TextDecoration.lineThrough:null),),
          
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
              
            ),
            child:IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                ontododelect(todo.id);
              },
            ),
          ),
      ),
    );
  }
}

