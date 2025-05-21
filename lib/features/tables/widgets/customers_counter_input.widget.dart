import 'package:flutter/material.dart';

class CounterInput extends StatefulWidget {
  const CounterInput({super.key});

  @override
  State<CounterInput> createState() => _CounterInputState();
}

class _CounterInputState extends State<CounterInput> {
  final TextEditingController _controller = TextEditingController(text: '0');

  int get _currentValue => int.tryParse(_controller.text) ?? 0;

  void _increment() {
    setState(() {
      _controller.text = (_currentValue + 1).toString();
    });
  }

  void _decrement() {
    setState(() {
      if (_currentValue > 0) {
        _controller.text = (_currentValue - 1).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: true,
              controller: _controller,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade de pessoas',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decrement,
            splashRadius: 20,
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _increment,
            splashRadius: 50,
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          )
        ],
      ),
    );
  }
}
