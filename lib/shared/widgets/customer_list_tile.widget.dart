import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

import '../../utils/constants/app_icons.constants.dart';

class CustomerListTile extends StatelessWidget {
  final String customerName;
  final String customerPhone;

  const CustomerListTile({
    super.key,
    required this.customerName,
    required this.customerPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.appColors.grey!,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: SvgPicture.asset(
            AppIcons.user,
            width: 24,
            height: 24,
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  customerPhone,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          trailing: SvgPicture.asset(
            AppIcons.search,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
