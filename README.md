# To-Do App - AUTOR SHANEXON ORTIZ

Este proyecto es una aplicación de gestión de tareas desarrollada con **Flutter**. Permite a los usuarios agregar, eliminar, actualizar y filtrar tareas basándose en su estado (pendiente o completada). Se utiliza una arquitectura **limpia (Clean Architecture)** para garantizar la escalabilidad y mantenibilidad del código.

## Tabla de Contenidos

- [Características](#características)
- [Arquitectura](#arquitectura)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Instrucciones para Ejecutar el Proyecto](#instrucciones-para-ejecutar-el-proyecto)



---

## Características

- Gestión de tareas:
  - Crear, actualizar, eliminar y filtrar tareas.
- Uso de `SharedPreferences` para almacenamiento local.
- Aplicación basada en el patrón **BLoC** (Business Logic Component) para la gestión del estado.
- Diseño modular y escalable con separación de responsabilidades.

---

## Arquitectura

La aplicación sigue los principios de **Clean Architecture**. Está dividida en tres capas principales:

### 1. Capa de Datos
- Contiene los modelos (`TaskModel`) y las fuentes de datos (`TaskDataSource`).
- `SharedPreferences` se utiliza como almacenamiento local para persistir las tareas.

### 2. Capa de Dominio
- Contiene las **entidades** (`Task`) y los **casos de uso** (`GetTasksUseCase`, `AddTaskUseCase`, `DeleteTaskUseCase`, `UpdateTaskUseCase`).
- Define la lógica central de negocio independiente de cualquier framework o tecnología.

### 3. Capa de Presentación
- Contiene los widgets de UI y la gestión del estado mediante **BLoC**.
- Componentes como eventos (`TaskEvent`) y estados (`TaskState`) se usan para manejar la interacción entre UI y lógica de negocio.

---


## Instrucciones de Instalación

Para instalar y ejecutar este proyecto en tu máquina local, descarga el SDK de Flutter configura tu ambiente y baja el proyecto desde github, cuando lo tengas instala las dependencias con flutter pub get, luego corre tu emulador y flutter run o F5 para correr el proyecto. 
