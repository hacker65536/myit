
//abstract class
abstract class Template {
  
  abstract String method1();
  abstract String method2();
  final String method3(){
    return "";
  }


}

//inheritance of class (subclass)
class TemplateMethod1 extends Template {
  /* Implementation of necessary concrete methods */
  String method1(){
    return "";
  }
  /* Implementation of necessary concrete methods */
  String method2(){
    return "";
  }

}

//inheritance of class (subclass)
class TemplateMethod2 extends Template {
  /* Implementation of necessary concrete methods */
  String method1(){
    return "";
  }
  /* Implementation of necessary concrete methods */
  String method2(){
    return "";
  }
}
