
//abstract class
abstract class Template {
  
  abstract String method1();
  abstract String method2();
  final String method3(){
    return "";
  }


}

//inheritance of class (subclass)
class Template1 extends Template {
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
class Template2 extends Template {
  /* Implementation of necessary concrete methods */
  String method1(){
    return "";
  }
  /* Implementation of necessary concrete methods */
  String method2(){
    return "";
  }
}

public class TemplateMethod {
  public static void main(String[] argv){
    Template tmp1 = new Template1();
    Template tmp2 = new Template2();
    
    System.out.println(tmp1.method3());
    System.out.println(tmp2.method3());
  }
}
