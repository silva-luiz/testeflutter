import 'package:flutter/material.dart';

import '../../../shared/widgets/primary_button.widget.dart';
import '../../../shared/widgets/secondary_button.widget.dart';

class NewCustomerModal extends StatelessWidget {
  const NewCustomerModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Novo cliente'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nome + Sobrenome',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Telefone',
            ),
          ),
        ],
      ),
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
                // TODO: Salvar cliente
              },
              child: const Text('Criar'),
            ),
          ],
        ),
      ],
    );
  }
}
