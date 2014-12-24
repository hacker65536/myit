#Factory method

##relevant pattern
- Abstract factory
- Template method
- Builder


##UML(Class diagram)
|Class| *Creator* |
|-------|--------|
| **Attributes** ||
| **Methods** |*# factoryMethod() : Product*|



|Class| ConcreteCreator |
|-------|--------|
| **Attributes** ||
| **Methods** |+ factoryMethod() : Product|



|Class| *Product* |
|-------|--------|
| **Attributes** ||
| **Methods** ||



|Class| ConcreteProduct |
|-------|--------|
| **Attributes** ||
| **Methods** ||


Creator(abstract) --«create» (dependency)--> Product(abstract)  
ConcreteCreateor --«create» (dependency)--> ConcreteProduct  
ConcreteCreateor  ____inheritance(Generalization)_____> Creator(abstract)  
ConcreteProduct ____inheritance(Generalization)_____> Product(abstract)  
