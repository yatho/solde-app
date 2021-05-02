import 'package:flutter/material.dart';

class Solde extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SoldeState();
}

class SoldeState extends State<Solde> {
  double _avantRemise = 0;
  double _apresRemise = 0;
  double _pourcentage = 0;

  void calculRemise() {
    setState(() {
      _apresRemise = _avantRemise * _pourcentage / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Calcul de remise")
        ),
        body: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Prix avant remise",
                  suffix: Text("Euros")
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => {
                  setState(() {
                    _avantRemise = double.parse(value.replaceAll(",", "."));
                    calculRemise();
                  })
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Pourcentage",
                  suffix: Text("%")
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => {
                  setState(() {
                    _pourcentage = double.parse(value.replaceAll(",", "."));
                    calculRemise();
                  })
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Prix après remise"),
                  Text(
                    "$_apresRemise Euros",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    ),
                  ),
                ],
              )
            ],
        ),
    )
    );
  }

}