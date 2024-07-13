import 'package:flutter/material.dart';

import '../../../../core/shared/styles.dart';

class ShippingAddressCard extends StatelessWidget {
  const ShippingAddressCard({super.key, required this.address});
  final String address;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Shipping address",
            style:
                Styles.textStyle25black.copyWith(fontWeight: FontWeight.bold)),
        subtitle: Text(address, style: Styles.textStyle20black),
      ),
    );
  }
}
