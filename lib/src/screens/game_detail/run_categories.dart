import 'package:speedoran/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';

class RunCategories extends StatelessWidget{
    
    RunCategories(this._game, this.categorySelectedID,this.selectedItemCallback);

    final GameViewModel _game;
    final String categorySelectedID;
    final Function selectedItemCallback;

    @override
    Widget build(BuildContext context){
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
            alignment: Alignment.centerLeft,
            width: 40,
            child: Image.asset('assets/images/users.png', height: 40, alignment: Alignment.centerLeft, fit: BoxFit.fitHeight)),
            SizedBox(width: 15),
            Container(
              alignment: Alignment.centerLeft,
              width: 55,
              child:  Text("Runs:", textAlign: TextAlign.left, style: ModeratorNameText)),
            Container(
              width: MediaQuery.of(context).size.width-140,
              child: DropdownButtonHideUnderline(child: 
                DropdownButton(
                  isExpanded: true,
                  iconSize: 30.0,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.grey.withOpacity(0.8)),
                  dropdownColor: Colors.black,
                  value: this.categorySelectedID,
                  items: this._game.categories.map((e) => 
                    DropdownMenuItem(
                      child: Text(
                        e.name, 
                        style: DropDownItemText), value: e.id,)).toList(), 
                  onChanged:(value) => selectedItemCallback(value))))
      ]);
    }
}