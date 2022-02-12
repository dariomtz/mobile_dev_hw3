import 'package:flutter/material.dart';

class Donativos extends StatelessWidget {
  final int totalPaypal;
  final int totalTarjeta;
  final int meta;
  const Donativos(
      {Key? key,
      required this.totalPaypal,
      required this.totalTarjeta,
      required this.meta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Donativos obtenidos"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/paypal_logo.png',
                  width: 60,
                  height: 60,
                ),
              )),
              Expanded(
                  child: Center(
                      child: Text(
                "\$ $totalPaypal",
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ))),
            ]),
            Row(children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/tarjeta_logo.jpeg',
                  width: 60,
                  height: 60,
                ),
              )),
              Expanded(
                  child: Center(
                      child: Text(
                "\$ $totalTarjeta",
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ))),
            ]),
            const Divider(
              color: Colors.grey,
            ),
            Row(children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/money.png',
                  width: 60,
                  height: 60,
                ),
              )),
              Expanded(
                  child: Center(
                      child: Text(
                "\$ ${totalTarjeta + totalPaypal}",
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ))),
            ]),
            Center(
              child: (() {
                if (totalPaypal + totalTarjeta >= meta) {
                  return Image.asset('assets/gracias.jpeg');
                }
              })(),
            )
          ],
        ));
  }
}
