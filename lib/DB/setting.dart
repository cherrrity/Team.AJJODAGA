class Setting {
  final String theme;
  final String font;

  Setting(this.theme, this.font);

  Setting.fromJson(Map<String, dynamic> json)
      : theme = json['theme'],
        font = json['font'];

  Map<String, dynamic> toJson() =>
      {
        'theme': theme,
        'font': font,
      };
}