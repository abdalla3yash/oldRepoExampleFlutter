import 'dart:convert';
import 'dart:async';
import 'package:nursery/models/auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';

import '../models/nursery.dart';
import '../models/user.dart';

mixin ConnectedNurseriesModel on Model {
  List<Nursery> _nurseries = [];
  String _selNurseryId;
  User _authenticatedUser;
  bool _isLoading = false;
}

mixin NurseriesModel on ConnectedNurseriesModel {
  bool _showFavorites = false;

  List<Nursery> get allNurseries {
    return List.from(_nurseries);
  }

  List<Nursery> get displayedNurseries {
    if (_showFavorites) {
      return _nurseries.where((Nursery nursery) => nursery.isFavorite).toList();
    }
    return List.from(_nurseries);
  }

  int get selectedNurseryIndex {
    return _nurseries.indexWhere((Nursery nursery) {
      return nursery.id == _selNurseryId;
    });
  }

  String get selectedNurseryId {
    return _selNurseryId;
  }

  Nursery get selectedNursery {
    if (selectedNurseryId == null) {
      return null;
    }
    return _nurseries.firstWhere((Nursery nursery) {
      return nursery.id == _selNurseryId;
    });
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  Future<bool> addNursery(String title, String description, String image,
      String bloodType, String age, String code) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> nurseryData = {
      'title': title,
      'description': description,
      'image': 'assets/baby.jpg',
      'age': age,
      'code': code,
      'bloodType': bloodType,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id
    };
    try {
      final http.Response response = await http.post(
          'https://baby-8086d.firebaseio.com/nursery.json?auth=${_authenticatedUser.token}',
          body: json.encode(nurseryData));

      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
      final Map<String, dynamic> responseData = json.decode(response.body);
      final Nursery newNursery = Nursery(
          id: responseData['name'],
          title: title,
          description: description,
          image: image,
          age: age,
          bloodType: bloodType,
          code: code,
          userEmail: _authenticatedUser.email,
          userId: _authenticatedUser.id);
      _nurseries.add(newNursery);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateNursery(String title, String description, String image,
      String bloodType, String age, String code) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> updateData = {
      'title': title,
      'description': description,
      'image': 'assets/baby.jpg',
      'age': age,
      'bloodType': bloodType,
      'code': code,
      'userEmail': selectedNursery.userEmail,
      'userId': selectedNursery.userId
    };
    return http
        .put(
            'https://baby-8086d.firebaseio.com/nursery/${selectedNursery.id}.json?auth=${_authenticatedUser.token}',
            body: json.encode(updateData))
        .then((http.Response reponse) {
      _isLoading = false;
      final Nursery updatedNursery = Nursery(
          id: selectedNursery.id,
          title: title,
          description: description,
          image: image,
          age: age,
          bloodType: bloodType,
          code: code,
          userEmail: selectedNursery.userEmail,
          userId: selectedNursery.userId);
      _nurseries[selectedNurseryIndex] = updatedNursery;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  Future<bool> deleteNursery() {
    _isLoading = true;
    final deletedNurseryId = selectedNursery.id;
    _nurseries.removeAt(selectedNurseryIndex);
    _selNurseryId = null;
    notifyListeners();
    return http
        .delete(
            'https://baby-8086d.firebaseio.com/nursery/${deletedNurseryId}.json?auth=${_authenticatedUser.token}')
        .then((http.Response response) {
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  Future<Null> fetchNurseries({onlyForUser = true}) {
    _isLoading = true;
    notifyListeners();
    return http
        .get(
            'https://baby-8086d.firebaseio.com/nursery.json?auth=${_authenticatedUser.token}')
        .then<Null>((http.Response response) {
      final List<Nursery> fetchedNurseryList = [];
      final Map<String, dynamic> nurseryListData = json.decode(response.body);
      if (nurseryListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      nurseryListData.forEach((String nurseryId, dynamic nurseryData) {
        final Nursery nursery = Nursery(
            id: nurseryId,
            title: nurseryData['title'],
            description: nurseryData['description'],
            image: nurseryData['image'],
            heat: nurseryData['heat'],
            motion: nurseryData['motion'],
            age: nurseryData['age'],
            code: nurseryData['code'],
            bloodType: nurseryData['bloodType'],
            userEmail: nurseryData['userEmail'],
            userId: nurseryData['userId'],
            isFavorite: nurseryData['wishlistUsers'] == null
                ? false
                : (nurseryData['wishlistUsers'] as Map<String, dynamic>)
                    .containsKey(_authenticatedUser.id));
        fetchedNurseryList.add(nursery);
      });
      _nurseries = onlyForUser
          ? fetchedNurseryList.where((Nursery nursery) {
              return nursery.userId == _authenticatedUser.id;
            }).toList()
          : fetchedNurseryList;
      _isLoading = false;
      notifyListeners();
      _selNurseryId = null;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }



  void toggleNurseryFavoriteStatus() async {
    final bool isCurrentlyFavorite = selectedNursery.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Nursery updatedNursery = Nursery(
        id: selectedNursery.id,
        title: selectedNursery.title,
        description: selectedNursery.description,
        age: selectedNursery.age,
        code: selectedNursery.code,
        bloodType: selectedNursery.bloodType,
        image: selectedNursery.image,
        userEmail: selectedNursery.userEmail,
        userId: selectedNursery.userId,
        isFavorite: newFavoriteStatus);
    _nurseries[selectedNurseryIndex] = updatedNursery;
    notifyListeners();
    http.Response response;
    if (newFavoriteStatus) {
      response = await http.put(
          'https://baby-8086d.firebaseio.com/nursery/${selectedNursery.id}/wishlistUsers/${_authenticatedUser.id}.json?auth=${_authenticatedUser.token}',
          body: json.encode(true));
    } else {
      response = await http.delete(
          'https://baby-8086d.firebaseio.com/nursery/${selectedNursery.id}/wishlistUsers/${_authenticatedUser.id}.json?auth=${_authenticatedUser.token}');
    }
    if (response.statusCode != 200 && response.statusCode != 201) {
      final Nursery updatedNursery = Nursery(
          id: selectedNursery.id,
          title: selectedNursery.title,
          description: selectedNursery.description,
          age: selectedNursery.age,
          code: selectedNursery.code,
          bloodType: selectedNursery.bloodType,
          image: selectedNursery.image,
          userEmail: selectedNursery.userEmail,
          userId: selectedNursery.userId,
          isFavorite: !newFavoriteStatus);
      _nurseries[selectedNurseryIndex] = updatedNursery;
      notifyListeners();
    }
  }

  void selectNursery(String nurseryId) {
    _selNurseryId = nurseryId;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
    }
}

mixin UserModel on ConnectedNurseriesModel {
  Timer _authTimer;
  PublishSubject<bool> _userSubject = PublishSubject();

  User get user {
    return _authenticatedUser;
  }

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  Future<Map<String, dynamic>> authenticate(String email, String password,
      [AuthMode mode = AuthMode.Login]) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    http.Response response;
    if (mode == AuthMode.Login) {
      response = await http.post(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyA4CWiIQFyVqjJy5vibmKAK3lClb6A5mmc',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      response = await http.post(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyA4CWiIQFyVqjJy5vibmKAK3lClb6A5mmc',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    }

    final Map<String, dynamic> responseData = json.decode(response.body);
    bool hasError = true;
    String message = 'Something went wrong.';
    print(responseData);
    if (responseData.containsKey('idToken')) {
      hasError = false;
      message = 'Authentication succeeded!';
      _authenticatedUser = User(
          id: responseData['localId'],
          email: email,
          token: responseData['idToken']);
      setAuthTimeout(int.parse(responseData['expiresIn']));
      _userSubject.add(true);
      final DateTime now = DateTime.now();
      final DateTime expiryTime =
          now.add(Duration(seconds: int.parse(responseData['expiresIn'])));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', responseData['idToken']);
      prefs.setString('userEmail', email);
      prefs.setString('userId', responseData['localId']);
      prefs.setString('expiryTime', expiryTime.toIso8601String());
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      message = 'This email already exists.';
    } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
      message = 'This email was not found.';
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      message = 'The password is invalid.';
    }
    _isLoading = false;
    notifyListeners();
    return {'success': !hasError, 'message': message};
  }

  void autoAuthenticate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    final String expiryTimeString = prefs.getString('expiryTime');
    if (token != null) {
      final DateTime now = DateTime.now();
      final parsedExpiryTime = DateTime.parse(expiryTimeString);
      if (parsedExpiryTime.isBefore(now)) {
        _authenticatedUser = null;
        notifyListeners();
        return;
      }
      final String userEmail = prefs.getString('userEmail');
      final String userId = prefs.getString('userId');
      final int tokenLifespan = parsedExpiryTime.difference(now).inSeconds;
      _authenticatedUser = User(id: userId, email: userEmail, token: token);
      _userSubject.add(true);
      setAuthTimeout(tokenLifespan);
      notifyListeners();
    }
  }

  void logout() async {
    _authenticatedUser = null;
    _authTimer.cancel();
    _userSubject.add(false);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('userEmail');
    prefs.remove('userId');
  }

  void setAuthTimeout(int time) {
    _authTimer = Timer(Duration(seconds: time), logout);
  }
}

mixin UtilityModel on ConnectedNurseriesModel{
  bool get isLoading {
    return _isLoading;
  }
}
