import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goo_rent/helper/api_helper.dart';
import 'package:goo_rent/helper/loading_helper.dart';
import 'package:goo_rent/src/profile/data/user_model.dart';

class ProfileController extends GetxController {
  final firstValue = TextEditingController(text: '').obs;
  final secondtValue = TextEditingController(text: '').obs;

  final apiHelper = ApiHelper();
  final userModel = UserModel().obs;
  final isLoadingProfile = true.obs;

  ///
  final editUserModel = UserModel().obs;

  ///

  ///Medthod
  Future<void> onSaveProfileInfo({
    String? firstValue,
    String? secondValue,
  }) async {
    BaseDialogLoading.show();
    Map<String, dynamic> body = secondValue != null
        ? {
            'value1': firstValue,
            'value2': secondtValue,
          }
        : {
            'value': firstValue,
          };
    try {
      await apiHelper.onRequest(
        url: '/user_update',
        methode: METHODE.post,
        isAuthorize: false,
        body: body,
      );
    } catch (e) {
      // BaseToast.showErorrBaseToast(e.toString());
    } finally {
      BaseDialogLoading.dismiss();
    }
  }

  Future<void> getUserInfo() async {
    try {
      await apiHelper
          .onRequest(
        url: '/user_info',
        methode: METHODE.get,
        isAuthorize: true,
      )
          .then((response) async {
        userModel.value = UserModel.fromJson(response['data']);
        editUserModel.value = UserModel.fromJson(response['data']);
      });
    } catch (_) {
    } finally {
      isLoadingProfile(false);
    }
  }

  Future logout() async {
    // BaseDialogLoading.show();
    try {
      BaseDialogLoading.show();
      return await apiHelper.onRequest(
        url: '/logout',
        methode: METHODE.post,
        isAuthorize: true,
      );
    } catch (_) {
      BaseDialogLoading.dismiss();
    } finally {
      BaseDialogLoading.dismiss();
    }
  }
}
