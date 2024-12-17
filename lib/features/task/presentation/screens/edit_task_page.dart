import 'package:animate_do/animate_do.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/utils.dart';
import 'package:to_do/features/task/data/models/task_model.dart';
import 'package:to_do/features/task/domain/entities/task.dart';
import 'package:to_do/features/task/presentation/bloc/task_bloc.dart';
import 'package:to_do/features/task/presentation/bloc/task_event.dart';
import 'package:to_do/features/task/presentation/widgets/text_form_field_default.dart';
import 'package:to_do/features/task/presentation/widgets/text_defaut.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;

  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    // Inicializar los valores con la tarea existente
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
    _isCompleted = widget.task.isCompleted;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _updateTask() {
    // Disparar el evento para actualizar la tarea
    final updatedTask = TaskModel(
      id: widget.task.id,
      title: _titleController.text,
      description: _descriptionController.text,
      isCompleted: _isCompleted,
    );

    BlocProvider.of<TaskBloc>(context).add(UpdateTaskEvent(task: updatedTask));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: FadeInLeft(
            child: const TextDefault(sizeText: 25, text: "Editar tarea")),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/f8.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FadeInUp(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BounceInLeft(
                    child: Image.asset('assets/img/bk1.png',
                        width: 150, height: 150)),
                const SizedBox(height: 24),
                TextFormFieldDefault(
                  textEditingController: _titleController,
                  title: 'Describe tu tarea',
                  textValidation: 'Por favor, ingresa una descripción',
                ),
                const SizedBox(height: 24),
                TextFormFieldDefault(
                  textEditingController: _descriptionController,
                  title: 'Describe tu tarea',
                  textValidation: 'Por favor, ingresa una descripción',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextDefault(
                      text: '¿Completada?',
                      sizeText: 18,
                      colorText: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    Switch(
                      activeColor: Colors.orange,
                      value: _isCompleted,
                      onChanged: (value) {
                        setState(() {
                          _isCompleted = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
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
                      _updateTask();
                      const snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: '¡Grandioso!',
                          message: 'Editaste la tarea!',
                          contentType: ContentType.warning,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    },
                    child: const TextDefault(
                      text: 'Actualizar',
                      sizeText: 15,
                      colorText: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
