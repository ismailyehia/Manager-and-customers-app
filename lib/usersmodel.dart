/*

import 'package:flutter/material.dart';
import 'dart:convert';

Manager managerFromJson(String str) => Manager.fromJson(json.decode(str));

String managerToJson(Manager data) => json.encode(data.toJson());

class Manager {
    int id;
    String name;
    String email;
    String password;
    dynamic createdAt;
    dynamic updatedAt;
    List<User> users;

    Manager({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        this.createdAt,
        this.updatedAt,
        required this.users,
    });

    factory Manager.fromJson(Map<String, dynamic> json) => Manager(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    int mangerId;
    dynamic createdAt;
    dynamic updatedAt;

    User({
        required this.id,
        required this.name,
        required this.email,
        this.emailVerifiedAt,
        required this.mangerId,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        mangerId: json["manger_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "manger_id": mangerId,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
*/