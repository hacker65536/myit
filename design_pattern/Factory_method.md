#Factory method

##relevant pattern
- Abstract factory
- Template method
- Builder


##UML(Class diagram)
|Class| Creator |
|-------|--------|
| **Attributes** ||
| **Methods** |# factoryMethod() : Product|



|Class| ConcreteCreator |
|-------|--------|
| **Attributes** ||
| **Methods** |+ factoryMethod() : Product|



|Class| Product |
|-------|--------|
| **Attributes** ||
| **Methods** ||



|Class| ConcreteProduct |
|-------|--------|
| **Attributes** ||
| **Methods** ||


Createor --«create» (dependency)--> Product  
ConcreteCreateor --«create» (dependency)--> ConcreteProduct  
ConcreteCreateor ____Generalization_____> Creator  
ConcreteProduct ____Generalization_____> Product  
