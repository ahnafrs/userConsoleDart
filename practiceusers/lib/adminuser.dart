// Craeting userModel class for username & password

class UserModel {
  String userName;
  String password;

  UserModel(this.userName, this.password);
}

// creating abstract class Usercreation
abstract class UserCreation {
  void addUser(UserModel userModel);
  void checkPasswordValid(String password);
  void findUser(UserModel userModel);
}

// Implementation of UserCreation class for usermodel
class UserCreationImp implements UserCreation {
  List<UserModel> userList = [];

  @override
  void addUser(UserModel userModel) {
    userList.add(userModel);
    print('User created. Total users: ${userList.length}');
  }

  @override
  void checkPasswordValid(String password) {
    bool isCap = false;
    bool isLow = false;

    for (int i = 0; i < password.length; i++) {
      if (password[i].codeUnits.first >= 65 &&
          password[i].codeUnits.first <= 90) {
        isCap = true;
      }
      if (password[i].codeUnits.first >= 97 &&
          password[i].codeUnits.first <= 122) {
        isLow = true;
      }
    }

    if (isCap && isLow) {
      print('Accepted');
    } else {
      print('Not Accepted');
    }
  }

  @override
  void findUser(UserModel userModel) {
    final checkUser = userList.indexWhere((element) =>
        element.userName == userModel.userName &&
        element.password == userModel.password);
    if (checkUser == -1) {
      print("Wrong Info");
    } else {
      print('User Authenticated');
    }
  }
}

// Implementation for AdmincreationImp using usercreation
class AdminCreationImp implements UserCreation {
  List<UserModel> userList = [];

  @override
  void addUser(UserModel userModel) {
    userList.add(userModel);
    print('User created. Total users: ${userList.length}');
  }

  @override
  void checkPasswordValid(String password) {
    bool isCap = false;
    bool isLow = false;

    for (int i = 0; i < password.length; i++) {
      if (password[i].codeUnits.first >= 65 &&
          password[i].codeUnits.first <= 90) {
        isCap = true;
      }
      if (password[i].codeUnits.first >= 97 &&
          password[i].codeUnits.first <= 122) {
        isLow = true;
      }
    }

    if (isCap && isLow) {
      print('Accepted');
    } else {
      print('Not Accepted');
    }
  }

  @override
  void findUser(UserModel userModel) {
    final checkUser = userList.indexWhere((element) =>
        element.userName == userModel.userName &&
        element.password == userModel.password);
    if (checkUser == -1) {
      print("Wrong Info");
    } else {
      print('User Authenticated');
    }
  }
}

// Dependency class for userCreation
class WorkDone {
  UserCreation user;
  UserCreation admin;

  WorkDone(this.user, this.admin);

  void addUser(UserModel userModel) {
    user.addUser(userModel);
  }

  void addAdmin(UserModel userModel) {
    admin.addUser(userModel);
  }

  void checkPassword(String value) {
    user.checkPasswordValid(value);
  }

  void checkAdminPassword(String value) {
    admin.checkPasswordValid(value);
  }

  void checkUser(UserModel userModel) {
    user.findUser(userModel);
  }

  void checkAdmin(UserModel userModel) {
    admin.findUser(userModel);
  }
}

void main() {
  final userCreation = UserCreationImp();
  final adminCreation = AdminCreationImp();
  final workDone = WorkDone(userCreation, adminCreation);

  workDone.addUser(UserModel('alom', '123456'));
  workDone.addUser(UserModel('Thor', 'thundeR1'));
  workDone.addAdmin(UserModel('Ironman', '123456'));
  workDone.addAdmin(UserModel('Dr Strange', 'multiverse'));

  workDone.checkUser(UserModel('Loki', 'Odin'));
  workDone.checkUser(UserModel('alom', '123456'));
  workDone.checkUser(UserModel('Thor', 'thundeR1'));
  workDone.checkAdmin(UserModel('Ironman', '123456'));
  workDone.checkAdmin(UserModel('Dr Strange', 'Multiverse'));
}
