import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/core/view_model/profile_view_model.dart';
import 'package:lc/view/auth/login_screen.dart';
import 'package:lc/view/widgets/custom_list_tile.dart';
import 'package:lc/view/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  image: DecorationImage(
                                      image: controller.userModel == null
                                          ? AssetImage(
                                              'assets/images/profile.jpg')
                                          : controller.userModel.pic == 'de'
                                              ? AssetImage(
                                                  'assets/images/profile.jpg')
                                              : AssetImage(
                                                  'assets/images/profile.jpg'),
                                      // : NetworkImage(
                                      //     controller.userModel.pic),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: controller.userModel.name,
                                    color: Colors.black,
                                    fontSize: 32,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: controller.userModel.email,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        CustomListTile(
                          text: 'Edit Profile',
                          imagepath:
                              'assets/images/menu_icon/Icon_Edit_Profile.png',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          text: 'Shipping Address',
                          imagepath:
                              'assets/images/menu_icon/Icon_Location.png',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          text: 'Order History',
                          imagepath: 'assets/images/menu_icon/Icon_History.png',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          text: 'Cards',
                          imagepath: 'assets/images/menu_icon/Icon_Payment.png',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          text: 'Notifications',
                          imagepath: 'assets/images/menu_icon/Icon_Alert.png',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomListTile(
                          text: 'Log Out',
                          imagepath: 'assets/images/menu_icon/Icon_Exit.png',
                          onPressed: () {
                            controller.signOut();
                            Get.offAll(LoginScreen());
                          },
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }
}
