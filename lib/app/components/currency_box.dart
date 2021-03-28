import 'package:conversor_moeda/app/models/currency_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel model) onChanged;
  final CurrencyModel selectedItem;

  const CurrencyBox(
      {Key key, this.items, this.controller, this.onChanged, this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 57,
              child: DropdownButton<CurrencyModel>(
                  isExpanded: true,
                  value: selectedItem,
                  focusColor: Colors.amber,
                  underline: Container(height: 1, color: Colors.amber),
                  items: items
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: onChanged),
            )),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber))),
          ),
        ),
      ],
    );
  }
}
