import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';

import '../models/category.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false; // loading spinner


  void _saveItem() async {

    if(  _formKey.currentState!.validate()) {

      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      final url = Uri.https('shopping-list-69df6-default-rtdb.firebaseio.com', 'shopping-list.json');
      final response = await http.post(url, headers: {
        'Content-Type': 'application/json',
      }, body: json.encode({
        'name': _enteredName,
        'quantity': _enteredQuantity,
        'category': _selectedCategory.title,
      }),
      );

      final Map<String, dynamic> resData = json.decode(response.body);

      if(!context.mounted) {
        return;
      }
      Navigator.of(context).pop(GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory
      ),
      ); // to close the screen after adding the item



      // print(_enteredName);
      // print(_enteredQuantity);
      // print(_selectedCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item'),
        //centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(12),
        child: Form(
          key : _formKey,
            child: Column(
              children: [
                TextFormField(  // instead of textfield
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: Text('enter grocery'),
                  ),
                  validator: (value) {
                    if(value == null ||
                        value.isEmpty ||
                        value.trim().length <=1 ||
                        value.trim().length >=50)
                       {
                         return 'Must be between 1 and 50 characters';
                       }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredName = value!;
                  },
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text('Quantity'),
                        ),
                        initialValue: _enteredQuantity.toString(), // as a string not as a no.
                        keyboardType: TextInputType.number,

                        validator: (value) {
                          if(value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null||
                              int.tryParse(value)! <=0)
                          {
                            return 'Must be a valid positive number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredQuantity = int.parse(value!).toInt();
                        },

                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          label: Text('Categories'),
                        ),
                          items: [
                            for(final category in categories.entries) // .entries converts map to a list
                              DropdownMenuItem(
                                value : category.value, // to get the value of the category
                                child: Row(
                                  children: [
                                    Container(
                                      width: 16, height: 16,
                                      color: category.value.color,
                                    ),
                                    SizedBox(width: 6,),
                                    Text(category.value.title),
                                  ],

                                ),
                              ),
                          ],
                          onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;

                          });
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _isSending
                            ? null
                             : () {
                          _formKey.currentState!.reset();
                        },
                        child: Text('Reset'),
                    ), // to reset
                   // Spacer(flex: 1,),
                    ElevatedButton(onPressed: _isSending ? null : _saveItem,
                        child: _isSending
                            ? SizedBox(height: 16, width: 16, child: CircularProgressIndicator(),)
                            : Text('Add Item'),
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}
