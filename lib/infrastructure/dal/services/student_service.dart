import 'package:get/get.dart';
import '../../../domain/repositories/student_repository.dart';
import '../../network/dio_client.dart';
import '../enum/auth_enum.dart';
import '../payload/request/create_student_request.dart';

class StudentService {
  StudentRepository studentRepository = Get.put<StudentRepository>(
      StudentRepository(Get.find<DioClient>()));

  //Student--------------------------------------------------------------------------------------------------
  Future<StudentVerification> createStu({required CreateStudentRequest createStudentrequest}) async {
    return await studentRepository.createStudent(createStudentrequest);
  }
}