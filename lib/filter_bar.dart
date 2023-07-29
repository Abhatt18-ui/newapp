import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({
    Key? key,
    this.onPressed,
    required this.label, required MaterialColor color,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  final Map<String, List<String>> filters;

  const FilterButtons({required this.filters});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (String filterCategory in filters.keys)
          for (String filter in filters[filterCategory]!)
            FilterBar(
              onPressed: () {
                print("Selected Filter: $filter");
              },
              color: Colors.blue, // You can change the button color here
              label: filter,
            ),
      ],
    );
  }
}

void main() {
  Map<String, List<String>> filters = {
    "make": [
      "Apple",
      "OnePlus",
      "Samsung",
      "Xiaomi",
      "Realme",
      "Vivo",
    ],
    "condition": [
      "Like New",
      "Excellent",
      "Good",
      "Fair",
      "Needs Repair",
    ],
    "storage": [
      "32 GB",
      "64 GB",
      "128 GB",
      "256 GB",
      "512 GB",
      "1 TB",
    ],
    "ram": [
      "4 GB",
      "6 GB",
      "8 GB",
      "12 GB",
      "16 GB",
      "32 GB",
      "64 GB",
      "128 GB",
    ],
  };

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Filter Buttons Example")),
      body: FilterButtons(filters: filters),
    ),
  ));
}