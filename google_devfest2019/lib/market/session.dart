import 'package:cloud_firestore/cloud_firestore.dart';

class SessionsData {
  List<Session> sessions;

  SessionsData({this.sessions});

  SessionsData.fromJson(Map<String, dynamic> json) {
    if (json['sessions'] != null) {
      sessions = new List<Session>();
      json['sessions'].forEach((v) {
        sessions.add(Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sessions != null) {
      data['sessions'] = this.sessions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Session {
  String sessionId;
  String sessionTitle;
  String sessionStartTime;
  String sessionTotalTime;
  String speakerDesc;
  String speakerName;
  String speakerImage;
  String speakerId;
  String number;

  Session({
    this.sessionId,
    this.sessionTitle,
    this.sessionStartTime,
    this.sessionTotalTime,
    this.speakerName,
    this.speakerDesc,
    this.speakerImage,
    this.speakerId,
    this.number,
  });

  Session.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    sessionTitle = json['session_title'];
    sessionStartTime = json['session_start_time'];
    sessionTotalTime = json['session_total_time'];
    speakerName = json['speaker_name'];
    speakerImage = json['speaker_image'];
    speakerId = json['speaker_id'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['session_title'] = this.sessionTitle;
    data['session_start_time'] = this.sessionStartTime;
    data['session_total_time'] = this.sessionTotalTime;
    data['speaker_name'] = this.speakerName;
    data['speaker_desc'] = this.speakerDesc;
    data['speaker_image'] = this.speakerImage;
    data['speaker_id'] = this.speakerId;
    data['number'] = this.number;
    return data;
  }
}

class FirebaseServices {
  Firestore _fireStoreDataBase = Firestore.instance;
  Stream<List<Session>> getUserList() {
    return _fireStoreDataBase.collection('market').snapshots().map((snapShot) =>
        snapShot.documents
            .map((document) => Session.fromJson(document.data))
            .toList());
  }
}

List<Session> resturants = [
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "سوشي كريب",
    speakerName: "كريب و وافل",
    speakerDesc: "الخانكه شارع المحكمه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "سوشي كريب",
    speakerName: "كريب و وافل",
    speakerDesc: "الخانكه شارع المحكمه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "سوشي كريب",
    speakerName: "كريب و وافل",
    speakerDesc: "الخانكه شارع المحكمه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "سوشي كريب",
    speakerName: "كريب و وافل",
    speakerDesc: "الخانكه شارع المحكمه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "سوشي كريب",
    speakerName: "كريب و وافل",
    speakerDesc: "الخانكه شارع المحكمه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "سوشي كريب",
    speakerName: "كريب و وافل",
    speakerDesc: "الخانكه شارع المحكمه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "سوشي كريب",
    speakerName: "كريب و وافل",
    speakerDesc: "الخانكه شارع المحكمه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "سوشي كريب",
    speakerName: "كريب و وافل",
    speakerDesc: "الخانكه شارع المحكمه",
    number: '01091032414',
  ),
];

List<Session> markets = [
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "الصباحي",
    speakerName: "ماركت",
    speakerDesc: "موقف الخانكه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "الصباحي",
    speakerName: "ماركت",
    speakerDesc: "موقف الخانكه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "الصباحي",
    speakerName: "ماركت",
    speakerDesc: "موقف الخانكه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "الصباحي",
    speakerName: "ماركت",
    speakerDesc: "موقف الخانكه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "الصباحي",
    speakerName: "ماركت",
    speakerDesc: "موقف الخانكه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "الصباحي",
    speakerName: "ماركت",
    speakerDesc: "موقف الخانكه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "الصباحي",
    speakerName: "ماركت",
    speakerDesc: "موقف الخانكه",
    number: '01091032414',
  ),
  Session(
    sessionId: "1",
    sessionStartTime: "1:00 AM",
    sessionTotalTime: "9:00 AM",
    sessionTitle: "الصباحي",
    speakerName: "ماركت",
    speakerDesc: "موقف الخانكه",
    number: '01091032414',
  ),
];
