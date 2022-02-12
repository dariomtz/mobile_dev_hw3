import 'package:flutter/material.dart';
import 'package:mobile_dev_hw3/card_donativos.dart';

class PaymentMethodOption extends StatelessWidget {
  final String label;
  final PaymentMethod value;
  final PaymentMethod paymentMethod;
  final Function setPaymentMethod;
  final String asset;
  const PaymentMethodOption(
      {Key? key,
      required this.paymentMethod,
      required this.setPaymentMethod,
      required this.value,
      required this.label,
      required this.asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            asset,
            height: 40,
            width: 40,
          ),
        ),
        Expanded(child: Text(label)),
        Radio(
            value: value,
            groupValue: paymentMethod,
            onChanged: (newPaymentMethod) {
              setPaymentMethod(newPaymentMethod);
            })
      ],
    );
  }
}
