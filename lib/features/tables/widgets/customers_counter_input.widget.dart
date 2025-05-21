import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_flutter/features/tables/stores/table_store.dart';
import 'package:teste_flutter/features/customers/entities/customer.entity.dart';

class CounterInput extends StatelessWidget {
  final TableStore tableStore;

  const CounterInput({super.key, required this.tableStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final value = tableStore.customerCount;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  controller: TextEditingController(text: value.toString())
                    ..selection = TextSelection.collapsed(
                        offset: value.toString().length),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Quantidade de pessoas',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    isDense: true,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: value > 0
                    ? () => tableStore.removeCustomer(value - 1)
                    : null,
                splashRadius: 20,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  final id = tableStore.customerCount + 1;
                  tableStore.addCustomer(CustomerEntity(
                    id: id,
                    name: 'Cliente $id',
                    phone: 'Não informado',
                  ));
                },
                splashRadius: 50,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              )
            ],
          ),
        );
      },
    );
  }
}
