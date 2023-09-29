import 'package:flutter/foundation.dart';
import 'package:iscan/constant.dart';

class SessionModel with ChangeNotifier {
  int sessionid;
  String sessiontitle;
  String sessiondate;
  bool isEnd;
  SessionModel(this.sessiontitle, this.sessiondate, this.isEnd);

  SessionModel.frmJson(Map<String, dynamic> map) {
    this.sessionid = map[sessionId];
    this.sessiontitle = map[sessionTitle];
    this.sessiondate = map[sessionDate];
    this.isEnd = map[sessionIsEnd] == 1;
  }

  toJson() {
    return {
      sessionTitle: this.sessiontitle,
      sessionDate: this.sessiondate,
      sessionIsEnd: this.isEnd,
    };
  }
}
