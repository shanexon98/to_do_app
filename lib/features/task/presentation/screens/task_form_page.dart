import 'package:animate_do/animate_do.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/utils.dart';
import 'package:to_do/features/task/data/models/task_model.dart';
import 'package:to_do/features/task/presentation/widgets/text_Form_Field_default.dart';
import 'package:to_do/features/task/presentation/widgets/text_defaut.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';

class TaskFormPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();
  final _descriptionController = TextEditingController();

  TaskFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: FadeInLeft(
            child: const TextDefault(sizeText: 25, text: "Nueva tarea")),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/f8.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BounceInLeft(
                    child: Image.asset('assets/img/book.png',
                        width: 150, height: 150)),
                const SizedBox(height: 24),
                TextFormFieldDefault(
                  textEditingController: _taskController,
                  title: '¿Qué debes hacer?',
                  textValidation: 'Por favor, ingresa una tarea',
                ),
                const SizedBox(height: 24),
                TextFormFieldDefault(
                  textEditingController: _descriptionController,
                  title: 'Describe tu tarea',
                  textValidation: 'Por favor, ingresa una descripción',
                ),
                const SizedBox(height: 24),
                BounceInDown(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 40,
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final newTask = TaskModel(
                            id: DateTime.now().toString(),
                            title: _taskController.text,
                            description: _descriptionController.text,
                            isCompleted: false,
                          );
                          BlocProvider.of<TaskBloc>(context)
                              .add(AddTaskEvent(task: newTask));
                          Navigator.pop(context);
                          const snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: '¡Grandioso!',
                              message:
                                  '¡Agregaste una nueva tarea, no lo olvides!',
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        }
                      },
                      child: const TextDefault(
                          sizeText: 15,
                          text: 'Crear tarea',
                          colorText: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
