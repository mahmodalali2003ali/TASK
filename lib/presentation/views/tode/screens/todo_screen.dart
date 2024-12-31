import 'package:flutter/material.dart';

import '../../../../core/constants/utils/colors.dart';
import '../../../../data/models/task_model.dart';
import '../../addTask/add_task_view.dart';
import '../../editTask/edit_task_view.dart';
import 'widgets/custom_text_buttom.dart';

class TodoScreenView extends StatefulWidget {
  const TodoScreenView({super.key});

  @override
  _TodoScreenViewState createState() => _TodoScreenViewState();
}

class _TodoScreenViewState extends State<TodoScreenView> {
  // Task list for demonstration
  List<TaskModel> tasks = [
    TaskModel(id: '1', name: 'Going to Syria', description: 'A task to travel to Syria'),
    // You can add more tasks here for testing
  ];

  // Method to delete a task
  void deleteTask(String taskId) {
    setState(() {
      tasks.removeWhere((task) => task.id == taskId);
    });
  }

  // Method to add a new task
  void addTask(TaskModel task) {
    setState(() {
      tasks.add(task);
    });
  }

  // Method to edit an existing task
  void editTask(TaskModel updatedTask) {
    setState(() {
      final index = tasks.indexWhere((task) => task.id == updatedTask.id);
      if (index != -1) {
        tasks[index] = updatedTask;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.kBordersideColor,
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.18,
        backgroundColor: AppColors.kScaffoldColor,
        title: Padding(
          padding: EdgeInsets.only(
              bottom: screenHeight * 0.03,
              left: screenWidth * 0.02,
              right: screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Text(
                      "Name",
                      style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  CircleAvatar(
                    radius: screenWidth * 0.08,
                    backgroundImage: AssetImage('assets/images/Ellipse2.png'),
                  ),
                ],
              ),
              Text(
                "Same@gmail.com",
                style: TextStyle(
                  color: AppColors.kWhiteColor,
                  fontSize: screenWidth * 0.045,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTaskView(
              onAddTask: addTask, // Pass the addTask method here
            ),
          ));
        },
        child: CircleAvatar(
          radius: screenWidth * 0.08,
          backgroundColor: AppColors.kScaffoldColor,
          child: Icon(
            Icons.add,
            color: AppColors.kWhiteColor,
            size: screenWidth * 0.07,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kCardColor,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.kBordersideColor,
                        offset: Offset(0.5, 0.5)),
                  ],
                ),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: ListTile(
                    minLeadingWidth: screenWidth * 0.15,
                    leading: Image.asset("assets/images/Group27.png"),
                    title: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.01),
                      child: Text(
                        "Go Pro (No Ads)",
                        style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Text(
                      "No fuss, no ads, for only 5 TL a year",
                      style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.75,
                child: Container(
                  width: screenWidth * 0.18,
                  height: screenHeight * 0.08,
                  color: AppColors.kScaffoldColor,
                  child: Center(
                    child: Text(
                      "5 TL",
                      style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: screenHeight * 0.12,
                    color: AppColors.kWhiteColor,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.kBoxColor,
                          radius: screenWidth * 0.04,
                          child: Checkbox(
                            checkColor: AppColors.kWhiteColor,
                            activeColor: AppColors.kBoxColor,
                            value: false,
                            onChanged: (_) {},
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tasks[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.kBlackColor,
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                            Row(
                              children: [
                                TextButtom(
                                  text: "Delete",
                                  onTap: () {
                                    deleteTask(tasks[index].id);
                                  },
                                ),
                                TextButtom(
                                  text: "Edit",
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EditTaskView(
                                          task: tasks[index], // Pass task to edit view
                                          onEditTask: editTask, // Pass the edit method
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: screenHeight * 0.02,
                  );
                },
                itemCount: tasks.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
