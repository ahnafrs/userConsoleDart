// creating student class with properties id,name,phone,email,address.

class Student {
  int id;
  String name;
  int phone;
  String email;
  Address address;

  Student(this.id, this.name, this.phone, this.email, this.address);
}

// creating address model class using id,houseNo,thana,district,division.

class Address {
  int id;
  int houseNo;
  String thana;
  String district;
  String division;

  Address(this.id, this.houseNo, this.thana, this.district, this.division);
}

// creating abstract class
abstract class StudentCreation {
  void addStudent(Student student);
}

// Implementation of StudentCreation Class

class StudentCreationImp implements StudentCreation {
  List<Student> studentList = [];
  List<Student> adressList = [];
  @override
  void addStudent(Student student) {
    // TODO: implement addStudent
    studentList.add(student);
    print('Student create done with their details in ${studentList.length}');
  }
}

// Depedency class for StudentCreation

class WorkModel {
  StudentCreation studentCreation;
  WorkModel(this.studentCreation);

  void addStudent(Student model) {
    studentCreation.addStudent(model);
  }
}

void main() {
  final workModel = WorkModel(StudentCreationImp());
  workModel.addStudent(Student(11, 'Ahnaf', 23, 'ahnaf@gmail.com',
      (Address(11, 21, 'Sabujbag', 'Dhaka', 'Dhaka'))));
  workModel.addStudent(Student(12, 'Akash', 24, 'akash@gmail.com',
      (Address(11, 21, 'Sabujbag', 'Dhaka', 'Dhaka'))));
  workModel.addStudent(Student(13, 'Bittu', 32, 'bittu@gmail.com',
      (Address(11, 21, 'Sabujbag', 'Dhaka', 'Dhaka'))));
  workModel.addStudent(Student(14, 'Rajib', 33, 'rajib@gmail.com',
      (Address(11, 21, 'Sabujbag', 'Dhaka', 'Dhaka'))));
  workModel.addStudent(Student(15, 'Sayem', 11, 'sayem@gmail.com',
      (Address(11, 21, 'Sabujbag', 'Dhaka', 'Dhaka'))));
}
