import 'dart:convert';

List<ResumeModel> resumeModelFromJson(String str) => List<ResumeModel>.from(json.decode(str).map((x) => ResumeModel.fromJson(x)));

String resumeModelToJson(List<ResumeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResumeModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? address;
  String? qualification;
  String? higherQualification;
  String? university;
  String? skills;
  String? previousCompanyName;
  String? currentLocation;
  String? experience;
  String? project;
  String? hobbies;

  ResumeModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.address,
    this.qualification,
    this.higherQualification,
    this.university,
    this.skills,
    this.previousCompanyName,
    this.currentLocation,
    this.experience,
    this.project,
    this.hobbies,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> json) => ResumeModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    address: json["address"],
    qualification: json["qualification"],
    higherQualification: json["higherQualification"],
    university: json["university"],
    skills: json["skills"],
    previousCompanyName: json["previousCompanyName"],
    currentLocation: json["currentLocation"],
    experience: json["experience"],
    project: json["project"],
    hobbies: json["hobbies"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "address": address,
    "qualification": qualification,
    "higherQualification": higherQualification,
    "university": university,
    "skills": skills,
    "previousCompanyName": previousCompanyName,
    "currentLocation": currentLocation,
    "experience": experience,
    "project": project,
    "hobbies": hobbies,
  };
}
