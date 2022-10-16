import '../models/app_settings.dart';

class AppSettingsUseCase{
  AppSettings? _appSettings;

  AppSettings? get appSettings => _appSettings;

  AppSettingsUseCase(){
    appSettingsRef.doc('settings').get().then((value) {
      _appSettings = value.data;
    });
  }

  List<String> get tags => _appSettings?.foodTags.map((e) => e['title']!).toList() ?? [];

}