import 'package:demo_social_app/utils/app_auth_helper.dart';
import 'package:demo_social_app/widgets/alert_dialog.dart';
import 'package:demo_social_app/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:demo_social_app/global_controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<UserController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(0.90),
      appBar: AppBar(
        title: Text('profile'),
        actions: [
          InkWell(
              onTap: (){
                showAppAlertDialog(
                    title: "Logout",
                    description: "Are you sure want to logout?")
                    .then((value) {
                  if (value == true) {
                    AuthHelper.logoutUser();
                  }
                });
              },
              child: const Center(child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Logout',style: TextStyle(
                  fontSize: 15
                ),),
              )))
        ],
      ),
      body: controller.obx((state) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/4,
              ),
              GestureDetector(
                onTap: () {
                  controller.chooseProfilePicture();
                },
                child: Center(
                  child: Stack(
                    children: [
                      Material(
                        type: MaterialType.circle,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: UserCircleAvatar(state?.avatar, radius: 50
                              // backgroundImage: NetworkImage("${state?.avatar}"),
                              ),
                        ),
                      ),
                      if (controller.uploadingDp)
                        Positioned.fill(
                            child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor)),
                      const Positioned(
                          right: 0,
                          bottom: 2,
                          child: Material(
                              color: Colors.white,
                              type: MaterialType.circle,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.add),
                              )))
                    ],
                  ),
                ),
              ),
             const SizedBox(
               height: 40,
             ),
             Row(
               children: [
                 const Spacer(),
                 const Text('Name : ',
                   textAlign: TextAlign.end,
                   style: TextStyle(
                       color: Colors.black,
                       fontSize: 16,
                       fontWeight: FontWeight.w500
                   ),
                 ),
                 Expanded(
                   flex: 1,
                   child: Text('    ${state?.name}',
                     textAlign: TextAlign.start,
                   style: const TextStyle(
                     color: Colors.black,
                     fontSize: 16,
                     fontWeight: FontWeight.w500
                   ),
                   ),
                 ),
                 const Spacer(),
               ],
             ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(),
                  const Text('Email : ',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('    ${state?.email}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(),
                  const Text('Dob : ',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('    ${DateFormat('MM.dd.yyyy').format(state!.dob!)}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          )),
    );
  }
}
