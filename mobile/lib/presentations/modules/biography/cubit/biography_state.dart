
part of 'biography_cubit.dart';
class BioProfile {
  final String name;
  final String birthYear;
  final String location;
  final String bio;
  final List<String> tags;

  BioProfile({
    required this.name,
    required this.birthYear,
    required this.location,
    required this.bio,
    required this.tags,
  });
}

class BioEvent {
  final String year;
  final String title;
  final String description;

  BioEvent({
    required this.year,
    required this.title,
    required this.description,
  });
}


@freezed
abstract class BiographyState with _$BiographyState {
  const factory BiographyState({
    @Default(false) bool isLoading,
    @Default('') String messageError,
    BioProfile? profile,
    @Default([]) List<BioEvent> events,
  }) = _BiographyState;
}