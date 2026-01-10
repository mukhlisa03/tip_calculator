import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double amount;

  const ResultCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.teal.shade700,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          const Text("Total per person:", style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 10),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}