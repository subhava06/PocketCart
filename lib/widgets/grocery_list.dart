
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/models/category.dart';
//import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

import '../data/categories.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
   List<GroceryItem> _groceryItems = [];

  //to initialize the list with already saved items
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  //method to load items
  void _loadItems() async {
    final url = Uri.https('shopping-list-69df6-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);

    final Map<String, dynamic>listData = json.decode(response.body);

    final List<GroceryItem> _loadedItems = []; // temp list

    for(final item in listData.entries) {
      final category = categories.entries.firstWhere(
          (catItem) => catItem.value.title == item.value['category']
      ).value;
       _loadedItems.add(
           GroceryItem(
           id: item.key,
           name: item.value['name'],
           quantity: item.value['quantity'],
           category: category,
       ));
    }
    setState(() {
      _groceryItems = _loadedItems;

    });
  }



  void _addItem() async {
   final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(
            builder: (ctx) => const NewItem()
        ),
    );
    if(newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
      setState(() {
        _groceryItems.remove(item);
      });
  }

  @override
  Widget build(BuildContext context) {

    Widget content = Center(
      child: Text(
        'No items added yet!',
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.35),
          fontSize: 24,
          fontWeight: FontWeight.bold,

        ),
    ),
    );

    if(_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx,index) =>
            Dismissible(
              key: ValueKey(_groceryItems[index].id),
              onDismissed: (direction ) {
                _removeItem(_groceryItems[index]);
              },
              child: ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.color,
                ),
                trailing:  Text(_groceryItems[index].quantity.toString()),
              ),
            ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries🥖🫓🍞🍲'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: Icon(Icons.add),

          ),
        ],
      ),
      body: content,
    );
  }
}
