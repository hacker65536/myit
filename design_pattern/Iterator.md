#Iterator

##UML(Class diagram)

![iterator class diagram](https://raw.githubusercontent.com/hacker65536/myit-img-src/master/design_pattern/iterator2.png "iterator class diagram")


|Class| *Aggregate* |
|-------|--------|
| **Attributes** ||
| **Methods** | *+ iterator()* |

|Class| ConcreteAggregate |
|-------|--------|
| **Attributes** ||
| **Methods** |+ iterator()|

|Class| *Iterator* |
|-------|--------|
| **Attributes** ||
| **Methods** | *+ next() <br /> + hasNext()* |

|Class| ConcreteIterator |
|-------|--------|
| **Attributes** ||
| **Methods** |+ next() <br /> + hasNext()|

Aggregate(abstract) --«create» (dependency)--> Iterator(abstract)  
ConcreteAggregate ____inheritance(Generalization)_____> Aggregate(abstract)  
ConcreteAggregate --«create» (dependency)--> ConcreteIterator  
ConcreteIterator ____inheritance(Generalization)_____> Iterator(abstract)  
