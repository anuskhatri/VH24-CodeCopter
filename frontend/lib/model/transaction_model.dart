class Transactions {
  final int id;
  final String type;
  final String date;
  final String description;
  final double amount; // Change this to double for amount

  Transactions({
    required this.id,
    required this.type,
    required this.date,
    required this.description,
    required this.amount,
  });

  // Factory method to create an instance of Transactions from JSON
  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      id: json['id'], // Ensure this key is present in the JSON
      type: json['name'] ?? 'unknown', // Provide a default value if null
      date: json['donation_date'] ?? '', // Ensure the date is not null
      description: json['request_title'] ?? 'No description', // Provide a default value if null
      amount: json['donation_amount'] != null
          ? double.tryParse(json['donation_amount'].toString()) ?? 0.0 // Convert to double safely
          : 0.0, // Default value if donation_amount is null
    );
  }
}
