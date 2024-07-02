class LostItem {
  final int? id;
  final int userId;
  final String itemName;
  final String description;
  final String category;
  final String lastSeenLocation;
  final String date;
  final String reward;
  final String image;
  final String postDate;

  LostItem({
    this.id,
    required this.userId,
    required this.itemName,
    required this.description,
    required this.category,
    required this.lastSeenLocation,
    required this.date,
    required this.reward,
    required this.image,
    required this.postDate,
  });

  factory LostItem.fromJson(Map<String, dynamic> json) {
    return LostItem(
      id: json['id'],
      userId: json['user_id'],
      itemName: json['item_name'],
      description: json['description'],
      category: json['category'],
      lastSeenLocation: json['last_seen_location'],
      date: json['date'],
      reward: json['reward'],
      image: json['image'],
      postDate: json['post_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'item_name': itemName,
      'description': description,
      'category': category,
      'last_seen_location': lastSeenLocation,
      'date': date,
      'reward': reward,
      'image': image,
      'post_date': postDate,
    };
  }
}
