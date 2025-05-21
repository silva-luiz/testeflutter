import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_flutter/features/customers/stores/customers.store.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

import '../../../shared/widgets/customer_list_tile.widget.dart';
import '../../../shared/widgets/modal.widget.dart';
import '../../../shared/widgets/primary_button.widget.dart';
import '../../../shared/widgets/secondary_button.widget.dart';
import 'customers_counter_input.widget.dart';

import '../stores/table_store.dart';

class NewTableModalContent extends StatefulWidget {
  final TableStore tableStore;

  const NewTableModalContent({super.key, required this.tableStore});

  @override
  State<NewTableModalContent> createState() => _NewTableModalContentState();
}

final CustomersStore customersStore = GetIt.I<CustomersStore>();
final TableStore tableStore = GetIt.I<TableStore>();

class _NewTableModalContentState extends State<NewTableModalContent> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final title =
            'Editar informações da ${widget.tableStore.identification.isEmpty ? "Mesa" : widget.tableStore.identification}';
        return Modal(
          width: 470,
          title: title,
          content: [
            TextFormField(
              initialValue: widget.tableStore.identification,
              decoration: const InputDecoration(
                labelText: 'Identificação da mesa',
              ),
              onChanged: (value) => widget.tableStore.setIdentification(value),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informação temporária para ajudar na identificação do cliente.',
                style: TextStyle(
                  fontSize: 14,
                  color: context.appColors.darkGrey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                color: context.appColors.grey,
                thickness: 3,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Clientes nesta conta',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                'Associe os clientes aos pedidos para salvar o pedido no histórico do cliente, pontuar no fidelidade e fazer pagamentos no fiado.',
                style: TextStyle(
                  fontSize: 14,
                  color: context.appColors.darkGrey,
                ),
              ),
            ),
            const CounterInput(),
            const CustomerListTile(
              customerName: 'Luiz',
              customerPhone: '(12)99114-4122',
            ),
          ],
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondaryButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Voltar'),
                ),
                const SizedBox(width: 8),
                PrimaryButton(
                  onPressed: () {
                    final tableEntity = widget.tableStore.toEntity();
                    print(tableEntity);
                    Navigator.pop(context, tableEntity);
                  },
                  child: const Text('Criar'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
