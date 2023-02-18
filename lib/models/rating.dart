import 'dart:convert';

class Rating {
  final String userId;
  final double rating;
  final String? reviewTitle;
  final String? reviewContent;
  final String? reviewerName;

  Rating({
    required this.userId,
    required this.rating,
    required this.reviewTitle,
    required this.reviewContent,
    required this.reviewerName,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'rating': rating,
      'review': reviewTitle,
      'reviewContent': reviewContent,
      'reviewerName': reviewerName,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['userId'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      reviewTitle: map['reviewTitle'] ?? '',
      reviewContent: map['reviewContent'] ?? '',
      reviewerName: map['reviewerName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}
