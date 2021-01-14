import 'package:flutter/material.dart';
import 'package:neurodb/app/architecture/view_builder.dart';
import 'package:neurodb/ui/views/search/search_view_model.dart';
import 'package:provider/provider.dart';

class FilterDialog extends StatelessWidget {
  FilterDialog(this.vm);
  final SearchViewModel vm;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.grey[800]),
        child: ViewBuilder<SearchViewModel>.value(
          vm: vm,
          builder: (context, vm, snapshot) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Filter"),
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                        value: "M",
                        groupValue: vm.filters.sexFilter,
                        onChanged: vm.setSexFilter,
                      ),
                      Text("Male"),
                      Radio(
                        value: "F",
                        groupValue: vm.filters.sexFilter,
                        onChanged: vm.setSexFilter,
                      ),
                      Text("Female"),
                      Radio(
                        value: "O",
                        groupValue: vm.filters.sexFilter,
                        onChanged: vm.setSexFilter,
                      ),
                      Text("Other")
                    ],
                  ),
                ),
                FilterTextField(
                  hintText: "Age Group  eg :- 14-19",
                  onChanged: (val) {
                    vm.filters.ageGroup = val;
                  },
                ),
                FilterTextField(
                  label: "ICD Coding",
                  onChanged: (val) {
                    vm.filters.icd = val;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    print(vm.filters.toJson());
                  },
                  color: Colors.blue,
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Expanded buildTextField({
    String hintText = "label",
    String label,
    Function(String) onChanged,
  }) {
    return Expanded(
      child: FilterTextField(
        label: label,
        onChanged: onChanged,
        hintText: hintText,
      ),
    );
  }
}

class FilterTextField extends StatelessWidget {
  const FilterTextField(
      {Key key,
      this.label,
      this.isTextArea = false,
      this.onChanged,
      this.hintText})
      : super(key: key);

  final String label;
  final String hintText;
  final bool isTextArea;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        maxLines: isTextArea ? null : 1,
        expands: isTextArea,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: isTextArea ? TextInputType.multiline : TextInputType.text,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey[800],
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          labelText: label,
          isDense: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorStyle: TextStyle(color: Colors.pink),
        ),
      ),
    );
  }
}
