import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
              cursorColor: const Color(0xff53B175),
              onTapOutside: (v) {
                FocusScope.of(context).unfocus();
              },
              decoration: const InputDecoration(
                hintText: "Search Store",
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            );
  }
}