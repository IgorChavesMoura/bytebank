import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(this._accountNumberController.text);
    final double value = double.tryParse(this._valueController.text);

    if (accountNumber != null && value != null) {
      final Transfer newTransfer = Transfer(value, accountNumber);

      Navigator.pop(context, newTransfer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Editor(
                  controller: this._accountNumberController,
                  label: 'Account Number',
                  hint: '0000'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Editor(
                  controller: this._valueController,
                  label: 'Value',
                  hint: '0.00',
                  icon: Icons.monetization_on),
            ),
            RaisedButton(
              onPressed: () => _createTransfer(context),
              child: Text('Confirm'),
            )
          ],
        ),
      ),
    );
  }
}
