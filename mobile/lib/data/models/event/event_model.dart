class EventModel {
  final int? id;
  final String? title;
  final String? description;
  final String? eventDate;
  final String? timeFrom;
  final String? timeTo;
  final String? location;
  final String? imagePath;
  final String? qrBase64;

  EventModel({
    this.id,
    this.title,
    this.description,
    this.eventDate,
    this.timeFrom,
    this.timeTo,
    this.location,
    this.imagePath,
    this.qrBase64,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      eventDate: json['eventDate'],
      timeFrom: json['timeFrom'],
      timeTo: json['timeTo'],
      location: json['location'],
      imagePath: json['imagePath'],
      qrBase64: json['qrBase64'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'eventDate': eventDate,
      'timeFrom': timeFrom,
      'timeTo': timeTo,
      'location': location,
      'imagePath': imagePath,
      'qrBase64': qrBase64,
    };
  }

  EventModel copyWith({
    int? id,
    String? title,
    String? description,
    String? eventDate,
    String? timeFrom,
    String? timeTo,
    String? location,
    String? imagePath,
    String? qrBase64,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      eventDate: eventDate ?? this.eventDate,
      timeFrom: timeFrom ?? this.timeFrom,
      timeTo: timeTo ?? this.timeTo,
      location: location ?? this.location,
      imagePath: imagePath ?? this.imagePath,
      qrBase64: qrBase64 ?? this.qrBase64,
    );
  }
}
