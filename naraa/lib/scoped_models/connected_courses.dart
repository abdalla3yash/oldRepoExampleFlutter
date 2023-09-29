import 'dart:convert';
import 'dart:async';
import 'package:naraa/models/course.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:naraa/models/user.dart';
import 'package:http/http.dart' as http;

class ConnectedCoursesModel extends Model {
  List<Course> _courses = [];
  String _selCourseId;
  User _authenticatedUser;
  bool _isLoading = false;
}

mixin CoursesModel on ConnectedCoursesModel {
  bool _showFavorites = false;

  List<Course> get allCourses {
    return List.from(_courses);
  }

  List<Course> get displayedCourses {
    if (_showFavorites) {
      return _courses.where((Course course) => course.isFavourite).toList();
    }
    return List.from(_courses);
  }

  int get selectedCourseIndex {
    return _courses.indexWhere((Course course) {
      return course.id == _selCourseId;
    });
  }

  String get selectedCourseId {
    return _selCourseId;
  }

  Course get selectedCourse {
    if (selectedCourseId == null) {
      return null;
    }

    return _courses.firstWhere((Course course) {
      return course.id == _selCourseId;
    });
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void toggleCourseFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedCourse.isFavourite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Course updatedCourse = Course(
        id: selectedCourse.id,
        title: selectedCourse.title,
        description: selectedCourse.description,
        price: selectedCourse.price,
        image: selectedCourse.image,
        userEmail: selectedCourse.userEmail,
        userId: selectedCourse.userId,
        isFavourite: newFavoriteStatus);
    _courses[selectedCourseIndex] = updatedCourse;
    notifyListeners();
  }

  Future<bool> addCourse(
      String title, String description, String image, double price) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> courseData = {
      'title': title,
      'description': description,
      'image':
          'https://www.google.com.eg/search?q=courses&source=lnms&tbm=isch&sa=X&ved=0ahUKEwihobvR-MXhAhXcUxUIHah6AhgQ_AUIDigB&biw=1366&bih=635#',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id
    };
    try {
      final http.Response response = await http.post(
          'https://naraa-4453.firebaseio.com/courses.json',
          body: json.encode(courseData));

      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
      final Map<String, dynamic> responseData = json.decode(response.body);
      final Course newcourse = Course(
          id: responseData['name'],
          title: title,
          description: description,
          image: image,
          price: price,
          userEmail: _authenticatedUser.email,
          userId: _authenticatedUser.id);
      _courses.add(newcourse);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateCourse(
      String title, String description, String image, double price) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> updateData = {
      'title': title,
      'description': description,
      'image':
          'https://www.google.com.eg/search?q=courses&source=lnms&tbm=isch&sa=X&ved=0ahUKEwihobvR-MXhAhXcUxUIHah6AhgQ_AUIDigB&biw=1366&bih=635#',
      'price': price,
      'userEmail': selectedCourse.userEmail,
      'userId': selectedCourse.userId
    };
    return http
        .put(
            'https://naraa-4453.firebaseio.com/courses/${selectedCourse.id}.json',
            body: json.encode(updateData))
        .then((http.Response reponse) {
      _isLoading = false;
      final Course updatedcourse = Course(
          id: selectedCourse.id,
          title: title,
          description: description,
          image: image,
          price: price,
          userEmail: selectedCourse.userEmail,
          userId: selectedCourse.userId);
      _courses[selectedCourseIndex] = updatedcourse;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  Future<Null> fetchCourses() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://naraa-4453.firebaseio.com/courses.json')
        .then<Null>((http.Response response) {
      final List<Course> fetchedCourseList = [];
      final Map<String, dynamic> CourseListData = json.decode(response.body);
      if (CourseListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      CourseListData.forEach((String courseId, dynamic courseData) {
        final Course course = Course(
            id: courseId,
            title: courseData['title'],
            description: courseData['description'],
            image: courseData['image'],
            price: courseData['price'],
            userEmail: courseData['userEmail'],
            userId: courseData['userId']);
        fetchedCourseList.add(course);
      });
      _courses = fetchedCourseList;
      _isLoading = false;
      notifyListeners();
      _selCourseId = null;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }

  Future<bool> deletecourse() {
    _isLoading = true;
    final deletedcourseId = selectedCourse.id;
    _courses.removeAt(selectedCourseIndex);
    _selCourseId = null;
    notifyListeners();
    return http
        .delete(
            'https://naraa-4453.firebaseio.com/courses/${deletedcourseId}.json')
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

  void selectCourse(String courseId) {
    _selCourseId = courseId;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

mixin UserModel on ConnectedCoursesModel {
  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'abdalla4453', email: email, password: password);
  }
}

mixin UtilityModel on ConnectedCoursesModel {
  bool get isLoading {
    return _isLoading;
  }
}
