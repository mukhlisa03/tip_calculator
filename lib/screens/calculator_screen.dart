import 'package:flutter/material.dart';
import '../models/tip_calculation.dart';
import '../widgets/result_card.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TipCalculation _calc = TipCalculation(billAmount: 0.0);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tip Calculator"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ResultCard(amount: _calc.amountPerPerson),
            const SizedBox(height: 30),
            
            // Input Field
            TextField(
              controller: _controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Total Bill (\$)",
                prefixIcon: const Icon(Icons.receipt_long),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
              ),
              onChanged: (val) {
                setState(() => _calc.billAmount = double.tryParse(val) ?? 0.0);
              },
            ),
            
            const SizedBox(height: 30),
            Text("Tip Percentage: ${_calc.tipPercentage.toInt()}%", style: const TextStyle(fontWeight: FontWeight.w600)),
            
            // Slider
            Slider(
              value: _calc.tipPercentage,
              min: 0, max: 30, divisions: 6,
              activeColor: Colors.teal,
              label: "${_calc.tipPercentage.toInt()}%",
              onChanged: (val) => setState(() => _calc.tipPercentage = val),
            ),
            
            const SizedBox(height: 20),
            
            // Split Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Split Between:", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    _buildCircleButton(Icons.remove, () {
                      if (_calc.splitCount > 1) setState(() => _calc.splitCount--);
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("${_calc.splitCount}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    _buildCircleButton(Icons.add, () {
                      setState(() => _calc.splitCount++);
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Button Widget
  Widget _buildCircleButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(color: Colors.teal.shade100, shape: BoxShape.circle),
      child: IconButton(icon: Icon(icon, color: Colors.teal.shade900), onPressed: onPressed),
    );
  }
}