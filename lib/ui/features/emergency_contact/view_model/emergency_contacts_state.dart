// emergency_contacts_state.dart
import 'package:Nexus/domain/models/responses/gen_models.dart';

class EmergencyContactsState {
  final bool isLoading;
  final List<EmergencyContactResponse> contacts;
  final String? errorMessage;

  final int currentPage;
  final bool hasMorePages;

  EmergencyContactsState({
    this.isLoading = false,
    this.contacts = const [],
    this.errorMessage,
    this.currentPage = 0,
    this.hasMorePages = true,
  });
  EmergencyContactsState copyWith({
    bool? isLoading,
    List<EmergencyContactResponse>? contacts,
    String? errorMessage,
    int? currentPage,
    bool? hasMorePages,
  }) {
    return EmergencyContactsState(
      isLoading: isLoading ?? this.isLoading,
      contacts: contacts ?? this.contacts,
      errorMessage: errorMessage,
      currentPage: currentPage ?? this.currentPage,
      hasMorePages: hasMorePages ?? this.hasMorePages,
    );
  }
}