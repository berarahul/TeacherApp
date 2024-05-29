import 'package:get_storage/get_storage.dart';

class OnboardingService {
  static const String _hasSeenOnboardingKey = 'hasSeenOnboarding';
  final GetStorage _storage = GetStorage();

  bool hasSeenOnboarding() {
    return _storage.read(_hasSeenOnboardingKey) ?? false;
  }

  void setHasSeenOnboarding(bool value) {
    _storage.write(_hasSeenOnboardingKey, value);
  }
}
