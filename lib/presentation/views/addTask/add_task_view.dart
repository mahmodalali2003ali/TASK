import 'package:flutter/material.dart';

import '../../../core/constants/utils/colors.dart';
import '../../../data/models/task_model.dart';
import 'widgets/custom_text_form_field.dart';

class AddTaskView extends StatelessWidget {
  final Function(TaskModel) onAddTask;

  const AddTaskView({super.key, required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.kWhiteColor),
        backgroundColor: AppColors.kScaffoldColor,
        title: Center(
          child: Text(
            "Add Task",
            style: TextStyle(
              color: AppColors.kWhiteColor,
              fontSize: screenWidth * 0.05, // Dynamic font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02), // Responsive spacing
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              child: Text(
                "Task Name",
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: screenWidth * 0.045, // Dynamic font size
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              color: AppColors.kWhiteColor,
              child: CustomTextFormField(
                controller: nameController,
                hintText: 'Add new task',
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              child: Text(
                "Task Description",
                style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: screenWidth * 0.045, // Dynamic font size
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              color: AppColors.kWhiteColor,
              child: CustomTextFormField(
                controller: descriptionController,
                maxLines: 7,
                hintText: 'Task Description',
              ),
            ),
            Spacer(), // Push the button to the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {
                  final task = TaskModel(
                    id: DateTime.now().toString(),
                    name: nameController.text,
                    description: descriptionController.text,
                  );
                  onAddTask(task); // Add task using the callback
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
                        fontSize: screenWidth * 0.05, // Dynamic font size
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
