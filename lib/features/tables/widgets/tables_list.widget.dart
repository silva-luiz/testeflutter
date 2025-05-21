import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_flutter/injection_container.dart';
import '../stores/tables_store.dart';
import 'table_card.widget.dart';

class TablesList extends StatelessWidget {
  const TablesList({super.key});

  @override
  Widget build(BuildContext context) {
    final tablesStore = sl<TablesStore>();

    return Observer(
      builder: (_) {
        final tables = tablesStore.tables;

        if (tables.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Nenhuma mesa cadastrada."),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: tables.map((table) {
              return TableCard(table: table);
            }).toList(),
          ),
        );
      },
    );
  }
}
