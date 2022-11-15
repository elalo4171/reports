class ReportModel {
  final String title;
  final String date;
  final String description;
  final String image;
  final String id;

  const ReportModel({
    this.title = '',
    this.date = '',
    this.description = '',
    this.image = '',
    this.id = '',
  });

  bool hasImage() {
    return image.isNotEmpty;
  }

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      title: json['title'],
      date: json['date'],
      description: json['description'],
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['date'] = date;
    data['description'] = description;
    data['image'] = image;
    data['id'] = id;
    return data;
  }

  ReportModel copyWith({
    String? title,
    String? date,
    String? description,
    String? image,
    String? id,
  }) {
    return ReportModel(
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }
}
