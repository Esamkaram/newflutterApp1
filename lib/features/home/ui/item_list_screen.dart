import 'package:flutter/material.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key, this.onTap, this.name, this.iconedata});
  final VoidCallback? onTap;
  final String? name;
  final IconData? iconedata;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
               Icon(iconedata),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
    const SizedBox(
      height: 15.0,
    );
  }
}
