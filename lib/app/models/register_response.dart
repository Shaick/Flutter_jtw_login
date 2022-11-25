import 'dart:convert';

RegisterResponse registerResponseJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

class RegisterResponse {
  RegisterResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.username,
    required this.email,
    required this.date,
    required this.id,
  });
  late final String username;
  late final String email;
  late final String date;
  late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    date = json['date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['date'] = date;
    data['id'] = id;
    return data;
  }
}
