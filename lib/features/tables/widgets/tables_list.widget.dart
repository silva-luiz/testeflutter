import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_flutter/injection_container.dart';
import '../stores/tables_store.dart';

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
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tables.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, index) {
            final tableStore = tables[index];
            return ListTile(
              title: Text(tableStore.identification),
              subtitle: Text('${tableStore.customerCount} pessoas'),
              onTap: () {},
            );
          },
        );
      },
    );
  }
}
