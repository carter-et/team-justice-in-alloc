import 'package:flutter/material.dart';

class AllocationListItem extends StatelessWidget {

  final String entry;
  final List<String> itemList;
  final VoidCallback onDelete;

  AllocationListItem({
    Key key,
    @required this.entry,
    @required this.itemList,
    @required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListTile(
          leading: Text(entry),
          trailing: FlatButton(
            child: Icon(Icons.delete_outline, color: Colors.black,),
            onPressed: (){
              onDelete();
            },
          ),
        ),
      ),
    );
  }
}