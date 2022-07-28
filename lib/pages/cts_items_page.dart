import 'package:app_prototype/models/cts_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/CTSItem.dart';
import 'add_edit_cts_item_page.dart';

class CtsItemsPage extends StatelessWidget {
  const CtsItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grading Criteria"),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.add,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEditCtsItemPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<CtsItems>(
        builder: (context, value, child) {
          final List<CTSItem> items = value.ctsItems;
          return items.isNotEmpty
              ? Column(
                  children: items
                      .map((item) => ListTile(
                            title: Text(item.name),
                          ))
                      .toList(),
                )
              : Center(child: Text("No Items :O"));
        },
      ),
    );
  }
}
