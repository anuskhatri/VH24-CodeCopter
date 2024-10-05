class Donation {
  final int id;
  final int requestId;
  final String donationAmount;
  final String donationDate;
  final int? receiverId;
  final String reqTitle;

  Donation({
    required this.id,
    required this.requestId,
    required this.donationAmount,
    required this.donationDate,
    this.receiverId,
    this.reqTitle = '',
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      id: json['id'],
      requestId: json['request_id'],
      donationAmount: json['donation_amount'],
      donationDate: json['donation_date'],
      receiverId: json['receiver_id'],
      reqTitle: json['request_title'],
    );
  }
}
