class ToDo{
  String? id;
  String? toDOtext;
  bool isdone;
  ToDo({
    required this.id,
    required this.toDOtext,
    this.isdone=false,
  });
  static List<ToDo> todolist(){
    return[
      ToDo(id: '01', toDOtext: 'Morning Exercise', isdone: true),
      ToDo(id: '02', toDOtext: 'Working On Project', isdone: true),
      ToDo(id: '03', toDOtext: 'Check Email'),
      ToDo(id: '04', toDOtext: 'Handling Clients Calls'),
    ];
  }
}

