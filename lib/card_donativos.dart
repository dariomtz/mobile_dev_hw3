import 'package:flutter/material.dart';
import 'package:mobile_dev_hw3/payment_method_option.dart';

enum PaymentMethod { none, paypal, tarjeta }

class CardDonativos extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final Function setPaymentMethod;
  const CardDonativos(
      {Key? key, required this.paymentMethod, required this.setPaymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              PaymentMethodOption(
                  asset: "assets/paypal_logo.png",
                  label: "Paypal",
                  paymentMethod: paymentMethod,
                  setPaymentMethod: setPaymentMethod,
                  value: PaymentMethod.paypal),
              PaymentMethodOption(
                  asset: "assets/tarjeta_logo.jpeg",
                  label: "Tarjeta",
                  paymentMethod: paymentMethod,
                  setPaymentMethod: setPaymentMethod,
                  value: PaymentMethod.tarjeta),
            ],
          ),
        ),
      ),
    );
  }
}
