import 'dart:io';

import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chapter_files_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/media_lis_view.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/add_chapter_cubit/add_chapter_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/upload_file_cubit/upload_file_cubit.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views_model/cubit/drop_down_list_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseEditViewBody extends StatefulWidget {
  const CourseEditViewBody(
      {super.key, required this.subjectId, required this.chaptersN});
  final int subjectId;
  final List<String> chaptersN;
  @override
  State<CourseEditViewBody> createState() => _CourseEditViewBodyState();
}

class _CourseEditViewBodyState extends State<CourseEditViewBody> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    'الدرس ',
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 10.w)),
                SliverToBoxAdapter(
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: BlocProvider(
                      create: (context) => DropDownListCubit(),
                      child: BlocBuilder<DropDownListCubit, String>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PopupMenuButton(
                                  color: Colors.white,
                                  icon: const Icon(
                                    Icons.expand_more,
                                    color: Colors.black,
                                    size: 32,
                                  ),
                                  onSelected: (value) {
                                    BlocProvider.of<DropDownListCubit>(context)
                                        .changeIndexDropDownListChapter(value);
                                  },
                                  itemBuilder: (BuildContext bc) {
                                    return widget.chaptersN.map((String item) {
                                      return PopupMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList();
                                  }),
                              //
                              SizedBox(width: 5.w),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Text(
                                  state,
                                  textDirection: TextDirection.rtl,
                                  style: Styles.textStyle14
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                const SliverToBoxAdapter(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                SliverToBoxAdapter(
                  child: Text(
                    'الميديا',
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const MediaListView(),
                SliverToBoxAdapter(child: SizedBox(height: 2000.h)),
              ],
            ),
          ),
          Row(
            children: [
              BlocProvider(
                create: (context) =>
                    AddChapterCubit(getIt<ChapterFilesRepoImplement>()),
                child: Expanded(
                    child: BlocConsumer<AddChapterCubit, AddChapterState>(
                  listener: (context, state) {
                    if (state is AddChapterSuccess) {
                      successCherryToast(
                        context,
                        "عملية ناجحة",
                        "تم انشاء المادة بنجاح",
                      );
                    } else if (state is AddChapterFailure) {
                      errorCherryToast(context, "حدث خطأ", state.message);
                    }
                  },
                  builder: (context, state) {
                    return state is AddChapterLoading
                        ? const CustomLoadingWidget()
                        : CustomButton(
                            text: 'درس جديد',
                            onpressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text("اضافة درس جديد"),
                                  content: TextField(
                                    decoration: const InputDecoration(
                                      labelText: "اسم الدرس",
                                    ),
                                    controller: controller,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (controller.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "يجب عليك ادخال اسم الدرس"),
                                            ),
                                          );
                                        } else {
                                          BlocProvider.of<AddChapterCubit>(
                                                  context)
                                              .addChapter(
                                                  name: controller.text,
                                                  subjectId: widget.subjectId);
                                          Navigator.pop(context);
                                          controller.clear();
                                        }
                                      },
                                      child: const Text("اضافة"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            backroundcolor: kBackgroundColor,
                            textStyle: Styles.textStyle20.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                            rectangleBorder: RoundedRectangleBorder(
                              side: const BorderSide(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          );
                  },
                )),
              ),
              SizedBox(width: 10.w),
              BlocProvider(
                create: (context) =>
                    UploadFileCubit(getIt<ChapterFilesRepoImplement>()),
                child: Expanded(
                    child: BlocConsumer<UploadFileCubit, UploadFileState>(
                  listener: (context, state) {
                    if (state is UploadFileSuccess) {
                      successCherryToast(
                        context,
                        "عملية ناجحة",
                        "تم انشاء المادة بنجاح",
                      );
                    } else if (state is UploadFileFailure) {
                      errorCherryToast(context, "حدث خطأ", state.message);
                    }
                  },
                  builder: (context, state) {
                    return state is UploadFileLoading
                        ? const CustomLoadingWidget()
                        : CustomButton(
                            text: 'اضافة ميديا',
                            onpressed: () async {
                              final result =
                                  await FilePicker.platform.pickFiles();
                              if (result != null) {
                                BlocProvider.of<UploadFileCubit>(context)
                                    .uploadFile(
                                        chapterId: 1,
                                        file: File(result.files.first.path!));
                              } else {}
                            },
                            backroundcolor: kBackgroundColor,
                            textStyle: Styles.textStyle20.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                            rectangleBorder: RoundedRectangleBorder(
                              side: const BorderSide(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          );
                  },
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
