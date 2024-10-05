class Profile {
  final int fundsRaised;
  final int requests;
  final int purchasedAmount;
  final int review;
  final List<Review> reviews;

  Profile({
    required this.fundsRaised,
    required this.requests,
    required this.purchasedAmount,
    required this.review,
    required this.reviews,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      fundsRaised: json['fundsRaised'],
      requests: json['requests'],
      purchasedAmount: json['purchasedAmount'],
      review: json['review'],
      reviews: (json['reviews'] as List)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }
}

class Review {
  final String userName;
  final String reviewText;

  Review({required this.userName, required this.reviewText});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userName: json['userName'],
      reviewText: json['reviewText'],
    );
  }
}
