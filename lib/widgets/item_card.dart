import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final bool isChecked;
  final Function(bool?)? onCheckboxChanged;
  final Function()? onDelete;

  ItemCard({
    required this.itemName,
    required this.itemDescription,
    this.isChecked = false,
    this.onCheckboxChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(itemDescription),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: onCheckboxChanged,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}