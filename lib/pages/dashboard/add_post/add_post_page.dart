import 'package:demo_social_app/app_configs/app_decorations.dart';
import 'package:demo_social_app/app_configs/app_validators.dart';
import 'package:demo_social_app/pages/dashboard/add_post/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostPage extends StatefulWidget {
  static const routeName = '/addPost';
  const AddPostPage({Key? key}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> with SingleTickerProviderStateMixin {
  late AddPostController controller;
  @override
  void initState() {
    super.initState();
    controller = AddPostController()..onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create post'),
      ),
      body:
       Obx(
         ()=> Form(
           key: controller.formKey,
           autovalidateMode:
           controller.autoValidateMode.value,
           child: ListView(
             padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [

                const SizedBox(
                  height: 20,
                ),

                      TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: controller.capSaved,
                  onFieldSubmitted: (s) =>
                      controller.createPost(),
                  // validator: (value) =>
                  //     AppFormValidators.validateEmpty(
                  //         value, context),
                  decoration:
                  AppDecorations.textFieldDecoration(
                      context)
                      .copyWith(
                    labelText: 'Caption*',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('-------------or-------------',textAlign: TextAlign.center,),
              ],
            ),
         ),
       ),
    );
  }
}
