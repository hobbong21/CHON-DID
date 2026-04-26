part of 'contact_picker_cubit.dart';

@freezed
abstract class ContactPickerState with _$ContactPickerState {
  const factory ContactPickerState({
    @Default(false) bool isLoading,
    
    @Default('') String errorMessage,
        // @Default([]) List<Contact> contacts, 
  }) = _ContactPickerState;
}