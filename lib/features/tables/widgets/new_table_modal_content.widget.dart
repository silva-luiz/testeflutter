import 'package:flutter/material.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

import '../../../shared/widgets/modal.widget.dart';
import '../../../shared/widgets/primary_button.widget.dart';
import '../../../shared/widgets/secondary_button.widget.dart';
import 'customers_counter_input.widget.dart';

class NewTableModalContent extends StatelessWidget {
  const NewTableModalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Modal(
      width: 470,
      title: 'Editar informações da Mesa 1',
      content: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Identificação da mesa',
          ),
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
              onPressed: () {
                // TODO: Salvar mesa
              },
              child: const Text('Criar'),
            ),
          ],
        ),
      ],
    );
  }
}
