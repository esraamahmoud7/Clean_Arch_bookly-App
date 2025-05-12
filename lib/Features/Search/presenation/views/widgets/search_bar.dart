import 'package:flutter/material.dart';



class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 10),
          child: IconButton(
            onPressed: (){},
            icon: const Opacity(
                opacity: .8,
                child: Icon(Icons.search_rounded,size: 32)),),
        ),
        labelText: 'Search...',
        hintText: 'hint text',
        enabledBorder: buildOutlinedInputBorder(),
        // focusedBorder: buildOutlinedInputBorder()
      ),

    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          )
      );
  }
}