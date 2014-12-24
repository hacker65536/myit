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

ConcreteCreateor --Generalization--> Creator

|Class| ConcreteCreator |
|-------|--------|
| **Attributes** ||
| **Methods** |+ factoryMethod() : Product|

ConcreteCreateor --dependency--> Product

|Class| Product |
|-------|--------|
| **Attributes** ||
| **Methods** ||
