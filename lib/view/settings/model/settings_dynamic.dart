class SettingsDynamicModel {
  final String? url;
  final String title;

  SettingsDynamicModel(this.title, {this.url});

  factory SettingsDynamicModel.fakeArchitecturePR() {
    return SettingsDynamicModel('Project Contributors', url: 'https://github.com/VB10/flutter-architecture-template/pulls');
  }
  factory SettingsDynamicModel.fakeNull() {
    return SettingsDynamicModel('Project Contributors');
  }
}
