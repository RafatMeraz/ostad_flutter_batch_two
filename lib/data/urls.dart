class Urls {
  static String baseUrl = 'https://task.teamrabbil.com/api/v1';
  static String loginUrl = '$baseUrl/login';
  static String registrationUrl = '$baseUrl/registration';
  static String createNewTaskUrl = '$baseUrl/createTask';
  static String newTasksUrls = '$baseUrl/listTaskByStatus/New';
  static String completedTasksUrls = '$baseUrl/listTaskByStatus/Completed';

  static String changeTaskStatus(String taskId, String status) =>
      '$baseUrl/updateTaskStatus/$taskId/$status';
}
