
class FormValidator{

  static String? validateName(String? value){
    if(value == null || value.isEmpty){
      return 'Please enter your name';
    }
    return null;
  }

  static String? validateEmpty(String? value, String txt_name){
    if(value == null || value.isEmpty){
      return '${txt_name} cannot be empty';
    }
    return null;
  }

  static String? validateEmail(String? value){
    if(value == null || value.isEmpty){
      return 'Please enter your email';
    }
    
    final emailRex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    
    if(!emailRex.hasMatch(value)){
      return 'Invalid Email';
    }
    return null;
  }

  static String? validatepass(String? value){
    if(value == null || value.isEmpty){
      return 'Please enter a password';
    }

    final passRex = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,}$');

    if(!passRex.hasMatch(value)){
      return 'Password should more strong';
    }
    return null;
  }

  static String? validatephone(String? value){
    if(value == null || value.isEmpty){
      return 'Please enter phone number';
    }

    final phoneRex = RegExp(r'^01[3-9]\d{8}$');

    if(!phoneRex.hasMatch(value)){
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateconpass(String? value){
    if(value == null || value.isEmpty){
      return 'Please confirm your password';
    }

    if(value != value){
      return 'Password does not match';
    }
    return null;
  }

}