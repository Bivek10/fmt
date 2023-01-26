import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/app/services/questions/question_request_response.dart';
import 'package:fmt/app/widgets/atoms/buttons.dart';
import 'package:fmt/app/widgets/components/custom_app_bar.dart';
import 'package:fmt/utils/theme/colors.dart';

import 'package:get/get.dart';

import '../controllers/questions_controller.dart';

class QuestionsView extends GetView<QuestionsController> {
  const QuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    controller.context = context;
    return Scaffold(
      appBar: CustomAppBar(
        title: "${controller.data!.quiz} related Questions",
        // title: "",
        statusBarColor: AppColors.backgroundColor3,
        titleStyle: Get.theme.textTheme.headline3!,
        leadingIcon: Icons.chevron_left,
        onleadingPress: () {
          Get.back();
        },
      ),
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
          gradient: AppColors.gradient2,
        ),
        //child: Container(),
        child: GetBuilder<QuestionsController>(builder: (con) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.questionData.length,
                    itemBuilder: (BuildContext, index) {
                      var response = controller.questionData[index];
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${index + 1}). ${controller.questionData[index].question!}",
                                style: Get.theme.textTheme.headline4!
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .questionData[index].choices!.length,
                                itemBuilder: (context, i) {
                                  var choicedata = controller
                                      .questionData[index].choices![i];
                                  return Obx(
                                    () => RadioListTile(
                                      title: Text("${choicedata.choice}"),
                                      value: choicedata.id,
                                      groupValue:
                                          controller.selectedChoice[index],
                                      onChanged: (value) {
                                        controller.onSelectedChoice(
                                            index: index,
                                            selectedChoiceID: value);
                                      },
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                controller.questionData.isEmpty
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 14.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Button(
                            onPressed: () {
                              controller.submitQuiz();
                            },
                            borderRadius: BorderRadius.circular(8.r),
                            size: ButtonSize.large,
                            fillColor: AppColors.orangeColor,
                            splashColor: AppColors.whiteDimColor,
                            child: Text(
                              " Submit ",
                              style: Get.theme.textTheme.button,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
