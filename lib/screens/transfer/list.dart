import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

import './form.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  //All dynamic values goes here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: ListView.builder(
        itemCount:
            widget._transfers.length, //widget is a TransferList in this case
        itemBuilder: (context, index) {
          Transfer transfer = widget._transfers[index];

          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));

          future.then((receivedTransfer) {
            debugPrint('$receivedTransfer');

            setState(() {
              //Like React's setState, it calls widget's state build method. Used whenever we need to update content
              if (receivedTransfer != null) {
                widget._transfers.add(receivedTransfer);
              }
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

