import 'dart:developer';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SearchWidget extends StatefulWidget {
  final List<dynamic> filteredList;
  final Function(String) onChange;
  const SearchWidget({
    Key? key,
    required this.filteredList,
    required this.onChange,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColor.containerColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.tune_sharp,
              color: AppColor.whiteColor,
              size: 30,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColor.whiteColor,
              size: 30,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColor.containerColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColor.containerColor,
                )),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: "Search here...",
            hintStyle:
                const TextStyle(color: Color.fromARGB(137, 255, 255, 255))),
        onChanged: widget.onChange,
      ),
    );
  }
}
