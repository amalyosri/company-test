// ignore_for_file: non_constant_identifier_names

class LoginModel {
  bool? status;
  String? apiToken;
  ProfileData? profile;

  LoginModel.fromjson(Map<String, dynamic> json) {
    status = json["status"];
    apiToken = json["api_token"];
    profile =
        json["profile"] != null ? ProfileData.fromjson(json["profile"]) : null;
  }
}

class ProfileData {
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  String? created_at;
  String? updated_at;
  String? code;
  String? company_name;
  String? address;
  String? phone;
  String? commercial_record;
  String? company_administrator;
  String? administrator_phone;
  String? administrator_email;
  String? company_email;
  String? employee_id;
  String? type;

  ProfileData.fromjson(json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    email_verified_at = json["email_verified_at"];
    created_at = json["created_at"];
    updated_at = json["updated_at"];
    code = json["code"];
    company_name = json["company_name"];
    address = json["address"];
    phone = json["phone"];
    commercial_record = json["commercial_record"];
    company_administrator = json["company_administrator"];
    administrator_phone = json["administrator_phone"];
    administrator_email = json["administrator_email"];

    company_email = json["company_email"];
    employee_id = json["employee_id"];
    type = json["type"];
  }
}
