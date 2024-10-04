class Transactions {
  final String type;
  final String date;
  final String description;
  final String amount; // Change this to double for amount

  Transactions({
    required this.type,
    required this.date,
    required this.description,
    required this.amount,
  });

  // Factory method to create an instance of Transactions from JSON
  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      type: json['type'],
      date: json['transaction_date'], // Ensure the date is formatted as needed
      description: json['details'], // Adjust based on API response
      amount: json['amount'].toString(), // Convert to double
    );
  }
}