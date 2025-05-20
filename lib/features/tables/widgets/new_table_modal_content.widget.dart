import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

import '../../../shared/widgets/modal.widget.dart';
import '../../../shared/widgets/primary_button.widget.dart';
import '../../../shared/widgets/secondary_button.widget.dart';
import 'customers_counter_input.widget.dart';

import '../stores/table_store.dart';

class NewTableModalContent extends StatelessWidget {
  final TableStore tableStore;

  const NewTableModalContent({super.key, required this.tableStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final title =
            'Editar informações da ${tableStore.identification.isEmpty ? "Mesa" : tableStore.identification}';
        return Modal(
          width: 470,
          title: title,
          content: [
            TextFormField(
              initialValue: tableStore.identification,
              decoration: const InputDecoration(
                labelText: 'Identificação da mesa',
              ),
              onChanged: (value) => tableStore.setIdentification(value),
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
                  onPressed: () {},
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
