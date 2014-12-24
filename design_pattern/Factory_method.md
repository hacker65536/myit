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

ConcreteCreateor ____Generalization_____> Creator

|Class| ConcreteCreator |
|-------|--------|
| **Attributes** ||
| **Methods** |+ factoryMethod() : Product|

ConcreteCreateor --<<create>>(dependency)--> Product

|Class| Product |
|-------|--------|
| **Attributes** ||
| **Methods** ||

ConcreteProduct ____Generalization_____> Product

|Class| ConcreteProduct |
|-------|--------|
| **Attributes** ||
| **Methods** ||
