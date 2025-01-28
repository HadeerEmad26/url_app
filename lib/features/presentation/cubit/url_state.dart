sealed class UrlState {}

final class UrlInitial extends UrlState {}

final class EnterBaseUrlLoadingState extends UrlState {}

final class EnterBaseUrlSuccessState extends UrlState {}

final class EnterBaseUrlErrorState extends UrlState {
  final String message;

  EnterBaseUrlErrorState(this.message);
}
