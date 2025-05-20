import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_flutter/features/tables/stores/tables_store.dart';
import 'package:teste_flutter/features/tables/widgets/tables_header.widget.dart';
import 'package:teste_flutter/features/tables/widgets/tables_list.widget.dart';

import '../../../injection_container.dart';

class TablesPage extends StatelessWidget {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tablesStore = sl<TablesStore>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TablesHeader(),
        const Divider(),
        Observer(
          builder: (_) => const TablesList(),
        ),
      ],
    );
  }
}
