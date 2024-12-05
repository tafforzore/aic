
import 'dart:io';

import '../../infrastructure/dal/enum/auth_enum.dart';
import '../../infrastructure/dal/payload/request/create_student_request.dart';
import '../../infrastructure/network/dio_client.dart';
class StudentRepository{
  final DioClient dioClient;
  StudentRepository(this.dioClient);


  Future<StudentVerification> createStudent(CreateStudentRequest createStudentRequest) async {
    print(dioClient.dio.options.baseUrl);
    final response = await dioClient.dio.post('/account/register/', data: createStudentRequest.toMap());

    print("createStudent ${response.data}");
    if (response.statusCode == HttpStatus.ok) {
      return StudentVerification.OK;
    } else if(response.statusCode == HttpStatus.badRequest){
      return StudentVerification.WRONG_DATA;
    } else if(response.statusCode == HttpStatus.unauthorized){
      return StudentVerification.USER_EXIST;
    }else{
      return StudentVerification.API_ERROR;
    }
  }

}
