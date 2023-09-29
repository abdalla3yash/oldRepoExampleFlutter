import 'package:scoped_model/scoped_model.dart';

import './connected_courses.dart';

class MainModel extends Model
    with ConnectedCoursesModel, UserModel, CoursesModel, UtilityModel {

}
