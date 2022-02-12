import 'package:flutter/material.dart';
import 'package:mobile_dev_hw3/card_donativos.dart';
import 'package:mobile_dev_hw3/donativos.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PaymentMethod _paymentMethod = PaymentMethod.none;
  int _amount = 100;
  int totalPaypal = 0;
  int totalTarjeta = 0;
  int meta = 10000;

  void setPaymentMethod(PaymentMethod paymentMethod) {
    setState(() {
      _paymentMethod = paymentMethod;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donativos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Es para una buena causa',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const Text('Elija modo de donativo',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
            CardDonativos(
              paymentMethod: _paymentMethod,
              setPaymentMethod: setPaymentMethod,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                const Expanded(child: Text('Cantidad a donar')),
                DropdownButton<int>(
                    value: _amount,
                    items: <int>[100, 300, 850, 1050, 9999]
                        .map((value) => DropdownMenuItem(
                              child: Text(value.toString()),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (newAmount) {
                      setState(() {
                        _amount = newAmount ?? 100;
                      });
                    })
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                  value: (totalPaypal + totalTarjeta) / meta),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text('${(totalPaypal + totalTarjeta) * 100 / meta}%')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        switch (_paymentMethod) {
                          case PaymentMethod.paypal:
                            setState(() {
                              totalPaypal += _amount;
                            });
                            break;
                          case PaymentMethod.tarjeta:
                            setState(() {
                              totalTarjeta += _amount;
                            });
                            break;
                          default:
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Selecciona un metodo de pago')),
                            );
                        }
                        //reset variables
                        if (_paymentMethod != PaymentMethod.none) {
                          setState(() {
                            _paymentMethod = PaymentMethod.none;
                            _amount = 100;
                          });
                        }
                      },
                      child: const Text('Donar'))),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        tooltip: "Ver donativos",
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Donativos(
                    totalPaypal: totalPaypal,
                    totalTarjeta: totalTarjeta,
                    meta: meta,
                  )));
        },
      ),
    );
  }
}
