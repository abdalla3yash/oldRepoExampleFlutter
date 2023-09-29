import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class SpeakersData {
  List<Speaker> speakers;
  SpeakersData({this.speakers});

  SpeakersData.fromJson(Map<String, dynamic> json) {
    if (json['speakers'] != null) {
      speakers = new List<Speaker>();
      json['speakers'].forEach((v) {
        speakers.add(Speaker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.speakers != null) {
      data['speakers'] = this.speakers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Speaker {
  String speakerName;
  String speakerDesc;
  String speakerImage;
  String speakerInfo;
  String speakerId;
  String fbUrl;
  String twitterUrl;
  String linkedinUrl;
  String githubUrl;
  String speakerSession;
  String sessionId;

  Speaker(
      {this.speakerName,
      this.speakerDesc,
      this.speakerImage,
      this.speakerInfo,
      this.speakerId,
      this.fbUrl,
      this.twitterUrl,
      this.linkedinUrl,
      this.githubUrl,
      this.speakerSession,
      this.sessionId});

  Speaker.fromJson(Map<String, dynamic> json) {
    speakerName = json['speaker_name'];
    speakerDesc = json['speaker_desc'];
    speakerImage = json['speaker_image'];
    speakerInfo = json['speaker_info'];
    speakerId = json['speaker_id'];
    fbUrl = json['fb_url'];
    twitterUrl = json['twitter_url'];
    linkedinUrl = json['linkedin_url'];
    githubUrl = json['github_url'];
    speakerSession = json['speaker_session'];
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speaker_name'] = this.speakerName;
    data['speaker_desc'] = this.speakerDesc;
    data['speaker_image'] = this.speakerImage;
    data['speaker_info'] = this.speakerInfo;
    data['speaker_id'] = this.speakerId;
    data['fb_url'] = this.fbUrl;
    data['twitter_url'] = this.twitterUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['github_url'] = this.githubUrl;
    data['speaker_session'] = this.speakerSession;
    data['session_id'] = this.sessionId;
    return data;
  }
}

List<Speaker> speakers = [
  Speaker(
    speakerImage:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc52556/Profile/150/doctor-hany-ibrahim-zahy-neurosurgery_20200310210634671.jpg",
    speakerName: "هانى ابراهيم زاهي",
    speakerDesc: "استشاري جراحة المخ والأعصاب والعمود الفقري",
    speakerSession: "مركز بنها : ١٩ شارع صلاح الدين",
    fbUrl:
        "https://www.vezeeta.com/ar/dr/%D8%AF%D9%83%D8%AA%D9%88%D8%B1-%D9%87%D8%A7%D9%86%D9%8A-%D8%A5%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85-%D8%B2%D8%A7%D9%87%D9%8A-%D8%AC%D8%B1%D8%A7%D8%AD%D8%A9-%D9%85%D8%AE-%D9%88%D8%A7%D8%B9%D8%B5%D8%A7%D8%A8",
    githubUrl: "01060049389",
    linkedinUrl: "https://linkedin.com/in/imthepk",
    twitterUrl: "https://twitter.com/imthepk",
  ),
  Speaker(
    speakerImage:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc52556/Profile/150/doctor-hany-ibrahim-zahy-neurosurgery_20200310210634671.jpg",
    speakerName: "هانى ابراهيم زاهي",
    speakerDesc: "استشاري جراحة المخ والأعصاب والعمود الفقري",
    speakerSession: "مركز بنها : ١٩ شارع صلاح الدين",
    fbUrl:
        "https://www.vezeeta.com/ar/dr/%D8%AF%D9%83%D8%AA%D9%88%D8%B1-%D9%87%D8%A7%D9%86%D9%8A-%D8%A5%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85-%D8%B2%D8%A7%D9%87%D9%8A-%D8%AC%D8%B1%D8%A7%D8%AD%D8%A9-%D9%85%D8%AE-%D9%88%D8%A7%D8%B9%D8%B5%D8%A7%D8%A8",
    githubUrl: "01060049389",
    linkedinUrl: "https://linkedin.com/in/imthepk",
    twitterUrl: "https://twitter.com/imthepk",
  ),
  Speaker(
    speakerImage:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc52556/Profile/150/doctor-hany-ibrahim-zahy-neurosurgery_20200310210634671.jpg",
    speakerName: "هانى ابراهيم زاهي",
    speakerDesc: "استشاري جراحة المخ والأعصاب والعمود الفقري",
    speakerSession: "مركز بنها : ١٩ شارع صلاح الدين",
    fbUrl:
        "https://www.vezeeta.com/ar/dr/%D8%AF%D9%83%D8%AA%D9%88%D8%B1-%D9%87%D8%A7%D9%86%D9%8A-%D8%A5%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85-%D8%B2%D8%A7%D9%87%D9%8A-%D8%AC%D8%B1%D8%A7%D8%AD%D8%A9-%D9%85%D8%AE-%D9%88%D8%A7%D8%B9%D8%B5%D8%A7%D8%A8",
    githubUrl: "01060049389",
    linkedinUrl: "https://linkedin.com/in/imthepk",
    twitterUrl: "https://twitter.com/imthepk",
  ),
  Speaker(
    speakerImage:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc52556/Profile/150/doctor-hany-ibrahim-zahy-neurosurgery_20200310210634671.jpg",
    speakerName: "هانى ابراهيم زاهي",
    speakerDesc: "استشاري جراحة المخ والأعصاب والعمود الفقري",
    speakerSession: "مركز بنها : ١٩ شارع صلاح الدين",
    fbUrl:
        "https://www.vezeeta.com/ar/dr/%D8%AF%D9%83%D8%AA%D9%88%D8%B1-%D9%87%D8%A7%D9%86%D9%8A-%D8%A5%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85-%D8%B2%D8%A7%D9%87%D9%8A-%D8%AC%D8%B1%D8%A7%D8%AD%D8%A9-%D9%85%D8%AE-%D9%88%D8%A7%D8%B9%D8%B5%D8%A7%D8%A8",
    githubUrl: "01060049389",
    linkedinUrl: "https://linkedin.com/in/imthepk",
    twitterUrl: "https://twitter.com/imthepk",
  ),
  Speaker(
    speakerImage:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc52556/Profile/150/doctor-hany-ibrahim-zahy-neurosurgery_20200310210634671.jpg",
    speakerName: "هانى ابراهيم زاهي",
    speakerDesc: "استشاري جراحة المخ والأعصاب والعمود الفقري",
    speakerSession: "مركز بنها : ١٩ شارع صلاح الدين",
    fbUrl:
        "https://www.vezeeta.com/ar/dr/%D8%AF%D9%83%D8%AA%D9%88%D8%B1-%D9%87%D8%A7%D9%86%D9%8A-%D8%A5%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85-%D8%B2%D8%A7%D9%87%D9%8A-%D8%AC%D8%B1%D8%A7%D8%AD%D8%A9-%D9%85%D8%AE-%D9%88%D8%A7%D8%B9%D8%B5%D8%A7%D8%A8",
    githubUrl: "01060049389",
    linkedinUrl: "https://linkedin.com/in/imthepk",
    twitterUrl: "https://twitter.com/imthepk",
  ),
  Speaker(
    speakerImage:
        "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENTc52556/Profile/150/doctor-hany-ibrahim-zahy-neurosurgery_20200310210634671.jpg",
    speakerName: "هانى ابراهيم زاهي",
    speakerDesc: "استشاري جراحة المخ والأعصاب والعمود الفقري",
    speakerSession: "مركز بنها : ١٩ شارع صلاح الدين",
    fbUrl:
        "https://www.vezeeta.com/ar/dr/%D8%AF%D9%83%D8%AA%D9%88%D8%B1-%D9%87%D8%A7%D9%86%D9%8A-%D8%A5%D8%A8%D8%B1%D8%A7%D9%87%D9%8A%D9%85-%D8%B2%D8%A7%D9%87%D9%8A-%D8%AC%D8%B1%D8%A7%D8%AD%D8%A9-%D9%85%D8%AE-%D9%88%D8%A7%D8%B9%D8%B5%D8%A7%D8%A8",
    githubUrl: "01060049389",
    linkedinUrl: "https://linkedin.com/in/imthepk",
    twitterUrl: "https://twitter.com/imthepk",
  ),
];
