class BannerModel {
  int? statusCode;
  List<SingleBannerModel>? data;
  String? message;

  BannerModel({this.statusCode, this.data, this.message});

  BannerModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = <SingleBannerModel>[];
      json['data'].forEach((v) {
        data!.add(new SingleBannerModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class SingleBannerModel {
  int? id;
  String? title;
  String? description;
  String? image;
  String? link;
  bool? isActive;
  String? position;
  int? priority;
  String? startDate;
  String? endDate;
  String? createdAt;

  SingleBannerModel(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.link,
      this.isActive,
      this.position,
      this.priority,
      this.startDate,
      this.endDate,
      this.createdAt});

  SingleBannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    link = json['link'];
    isActive = json['isActive'];
    position = json['position'];
    priority = json['priority'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['link'] = this.link;
    data['isActive'] = this.isActive;
    data['position'] = this.position;
    data['priority'] = this.priority;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
