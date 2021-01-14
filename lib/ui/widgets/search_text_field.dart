import 'package:flutter/material.dart';
import 'package:neurodb/app/data/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key key,
    @required this.icon,
    @required this.hintText,
    @required this.onChanged,
    @required this.onFilterTapped,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);
  final Icon icon;
  final String hintText;
  final Function(String) onChanged;
  final Function onFilterTapped;
  final bool isPassword;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: isPassword,
              onChanged: onChanged,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                errorStyle: TextStyle(color: Colors.pink),
                prefixIcon: icon,
                hintText: hintText,
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.blue,
            ),
            onPressed: onFilterTapped,
          )
        ],
      ),
    );
  }
}
