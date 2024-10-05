class Need {
  final String name;
  final int id;
  final String title;
  final String description;
  final dynamic currentFundedAmount;
  final dynamic requestedAmount;
  final String? status; // Allow status to be null

  Need({
    required this.name,
    this.id = 0,
    required this.title,
    required this.description,
    required this.currentFundedAmount,
    required this.requestedAmount,
    this.status, // Make status optional
  });

  factory Need.fromJson(Map<String, dynamic> json) {
    return Need(
      name: json['name'] ?? 'Unknown',
      id: json['id'],
      title: json['title'],
      description: json['description'],
      currentFundedAmount: json['current_funded_amount'],
      requestedAmount: json['requested_amount'],
      status: json['status'] ?? 'Unknown', // Provide a default value
    );
  }
}
