```java
public class Student {
        private String name;
        private int sex;

        public Student(String name,int sex){
                this.name = name;
                this.sex =sex; 
        } // `[M` jump to here 
        
        public String getName(){ //`[m` jump to here
                return name; // your cursor is here
        }//`]M` jump to here

        public int getSex(){// `]m` jump to here 
                return sex;
        }

}
```

`]m` jump to next method beginning  
`]M` jump to next method end  
`[m` jump to before method beginngin
`[M` jump to before method end
