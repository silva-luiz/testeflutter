import 'package:flutter/material.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/injection_container.dart';
import 'package:teste_flutter/shared/widgets/search_input.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

import '../entities/table.entity.dart';
import '../stores/table_store.dart';
import '../stores/tables_store.dart';
import 'new_table_modal_content.widget.dart';

class TablesHeader extends StatelessWidget {
  const TablesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              'Mesas',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(width: 20),
            SearchInput(
              onChanged: (value) => {},
            ),
            const SizedBox(width: 20),
            const CustomersCounter(label: '{sum_customers}'),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () async {
                debugPrint('criar nova mesa');

                final initialTableEntity = TableEntity(
                  id: 10,
                  identification: '',
                  customers: [],
                );

                final tableStore = TableStore(initialTableEntity);
                final result = await showDialog(
                  context: context,
                  builder: (context) => NewTableModalContent(
                    tableStore: tableStore,
                  ),
                );
                if (result != null) {
                  final tablesStore = sl<TablesStore>();
                  tablesStore.addTable(TableStore(result));
                  debugPrint('Nova mesa adicionada: ${result.identification}');
                }
              },
              tooltip: 'Criar nova mesa',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
