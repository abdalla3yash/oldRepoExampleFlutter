import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/constants.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/modules/shop_app/categories_model.dart';
import 'package:shop_app/modules/shop_app/change_favorites_model.dart';
import 'package:shop_app/modules/shop_app/favorite_model.dart';
import 'package:shop_app/modules/shop_app/shop_login_model.dart';
import 'package:shop_app/screens/categories/category_screen.dart';
import 'package:shop_app/screens/favorites/favorites_screen.dart';
import 'package:shop_app/screens/products/product_screen.dart';
import 'package:shop_app/screens/settings_screen/settings_screen.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../modules/shop_app/home_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    settingsScreen(),
  ];

  void changeBoottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.FromJson(value.data);
      homeModel!.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });

      // ignore: avoid_print
      print(favorites.toString());
      emit(ShopSuccessHomeState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(ShopErrorHomeState());
    });
  }

  CategoriesModel? categoriesModel;

  void getcategoriesData() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.FromJson(value.data);
      // ignore: avoid_print
      print(categoriesModel!.Status);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  // ignore: non_constant_identifier_names
  void changeFavories(int ProductID) {
    favorites[ProductID] = !favorites[ProductID]!;
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {'product_id': ProductID},
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (!changeFavoritesModel!.status) {
        favorites[ProductID] = !favorites[ProductID]!;
      } else {
        getcatefavoriteData();
      }
      // ignore: avoid_print
      print(value.data);
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[ProductID] = !favorites[ProductID]!;
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoriteModel? favoriteModel;

  void getcatefavoriteData() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      // ignore: avoid_print
      print(favoriteModel!.status);
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data!);
      print('name is ${userModel!.status}');
      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      print('name is ${userModel!.status}');

      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({required name, required phone, required email}) {
    emit(ShopLoadingUpdateUserDataState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data!);
      print('name is ${userModel!.status}');
      emit(ShopSuccessUpdateUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      print('name is ${userModel!.status}');

      emit(ShopErrorUpdateUserDataState());
    });
  }
}
