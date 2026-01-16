class TipCalculation {
  double billAmount;
  double tipPercentage;
  int splitCount;

  TipCalculation({
    required this.billAmount,
    this.tipPercentage = 15.0,
    this.splitCount = 1,
  });

  // Jami usluga
  double get totalTip => billAmount * (tipPercentage / 100);

  // Jami summa
  double get totalBill => billAmount + totalTip;

  // Har bir kishi uchun
  double get amountPerPerson {
    if (splitCount <= 0) return 0.0; // Edge case handling
    return totalBill / splitCount;
  }
}