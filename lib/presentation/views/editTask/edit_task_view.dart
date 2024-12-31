import 'package:flutter/material.dart';

import '../../../core/constants/utils/colors.dart';
import '../../../data/models/task_model.dart';
import '../addTask/widgets/custom_text_form_field.dart';

class EditTaskView extends StatelessWidget {
  final TaskModel task;
  final Function(TaskModel) onEditTask;

  const EditTaskView({
    super.key,
    required this.task,
    required this.onEditTask,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final nameController = TextEditingController(text: task.name);
    final descriptionController = TextEditingController(text: task.description);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.kWhiteColor),
        backgroundColor: AppColors.kScaffoldColor,
        title: Center(
          child: Text(
            "Edit Task ${nameController.text}",
            style: TextStyle(
              color: AppColors.kWhiteColor,
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              child: Text(
                "Task Name",
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              color: AppColors.kWhiteColor,
              child: CustomTextFormField(
                controller: nameController,
                hintText: 'Edit task name',
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              child: Text(
                "Task Description",
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              color: AppColors.kWhiteColor,
              child: CustomTextFormField(
                controller: descriptionController,
                maxLines: 7,
                hintText: 'Edit task description',
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {
                  final updatedTask = TaskModel(
                    id: task.id,
                    name: nameController.text,
                    description: descriptionController.text,
                  );
                  onEditTask(updatedTask); // Edit the task using the callback
                  Navigator.pop(context);
                },
                child: Container(
                  height: screenHeight * 0.07,
                  decoration: BoxDecoration(
                    color: AppColors.kScaffoldColor,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
