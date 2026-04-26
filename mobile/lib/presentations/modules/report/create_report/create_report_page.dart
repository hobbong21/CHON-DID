import 'dart:io';

import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentations/modules/report/cubit/report_cubit.dart';
import 'package:base_flutter/presentations/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateReportPage extends StatefulWidget {
  const CreateReportPage({super.key});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  late final ReportCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      bloc: cubit,
      builder: (context, state) {
        return Form(
          key: cubit.keyForm,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 88.r, child: Text(S.current.name)),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextFormField(
                              controller: cubit.nameController,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          SizedBox(width: 88.r, child: Text(S.current.emailLabel)),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextFormField(
                              controller: cubit.emailController,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  value?.trim().isNotEmpty == true
                                      ? null
                                      : S.current.requiredField,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          SizedBox(width: 88.r, child: Text(S.current.subjectLabel)),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextFormField(
                              controller: cubit.titleController,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  value?.trim().isNotEmpty == true
                                      ? null
                                      : S.current.requiredField,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 88.r, child: Text(S.current.reportContentLabel)),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextFormField(
                              controller: cubit.contentController,
                              maxLines: 5,
                              validator: (value) =>
                                  value?.trim().isNotEmpty == true
                                      ? null
                                      : S.current.requiredField,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 88.r, child: Text(S.current.attachmentLabel)),
                          SizedBox(width: 12.w),
                          ImagePickerCustom(
                            width: 114.h,
                            height: 114.h,
                            onImageSelected: (File file) {
                              cubit.onImageSelected(file);
                            },
                          ),
                          SizedBox(width: 12.w),
                          Expanded(child: Text(S.current.uploadSizeLimitWarning)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              ElevatedButton(
                  onPressed: () {
                    cubit.create();
                  },
                  child: Text(S.current.sendButton)),
            ],
          ),
        );
      },
    );
  }
}
