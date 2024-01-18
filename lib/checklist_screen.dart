import 'package:flutter/material.dart';

class ChecklistScreen extends StatefulWidget {
  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  Map<String, bool> checklistItems = {
    'Grab essential items': false,
    'Ensure all family members have evacuated': false,
    'Secure pets': false,
  };

  void toggleCheckbox(String itemTitle) {
    setState(() {
      checklistItems[itemTitle] = !checklistItems[itemTitle]!;
    });
  }

  void addChecklistItem(String newItem) {
    if (newItem.isNotEmpty) {
      setState(() {
        checklistItems[newItem] = false;
      });
    }
  }

  void deleteChecklistItem(String itemTitle) {
    setState(() {
      checklistItems.remove(itemTitle);
    });
  }

  void resetChecklist() {
    setState(() {
      checklistItems.updateAll((key, value) => false);
    });
  }

  void selectAllChecklist() {
    setState(() {
      checklistItems.updateAll((key, value) => true);
    });
  }

  void showDeleteConfirmation(BuildContext context, String itemTitle) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete "$itemTitle"?'),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('DELETE'),
              onPressed: () {
                deleteChecklistItem(itemTitle);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showAddItemDialog(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Checklist Item'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Enter item name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('ADD'),
              onPressed: () {
                addChecklistItem(_textFieldController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evacuation Checklist'),
        actions: [
          IconButton(
            icon: Icon(Icons.select_all),
            onPressed: selectAllChecklist,
            tooltip: 'Select All',
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: checklistItems.length,
        itemBuilder: (BuildContext context, int index) {
          String key = checklistItems.keys.elementAt(index);
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: CheckboxListTile(
              title: Text(
                key,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: checklistItems[key],
              activeColor: Colors.green,
              checkColor: Colors.white,
              secondary: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => showDeleteConfirmation(context, key),
              ),
              onChanged: (bool? value) {
                toggleCheckbox(key);
              },
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => showAddItemDialog(context),
            child: Icon(Icons.add),
            tooltip: 'Add New Item',
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: resetChecklist,
            child: Icon(Icons.refresh),
            tooltip: 'Reset List',
            backgroundColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
