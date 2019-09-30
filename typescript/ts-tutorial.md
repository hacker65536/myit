# TypeScript in 5 minutes

http://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html


mkdir dir
--
```console
$ mkdir typescript
$ cd !$
```


install typescript
--
```console
$ npm i -g typescript
```
```console
$ tsc --version
Version 3.5.3
```


typescript file
--

`greeter.ts`
```typescript
interface Person {
    firstName: string;
    lastName: string;
}
function greeter(person: Person) {
    return "hello, " + person.firstName + " " + person.lastName;
}

let user = { firstName: "Jane", lastName: "user" };
document.body.innerHTML = greeter(user);
```

compiling the code
--
```console
$ tsc greeter.ts
```

`greeter.js`
```js
function greeter(person) {
    return 'Hello, ' + person.firstName + ' ' + person.lastName;
}
var user = { firstName: 'Jane', lastName: 'User' };
document.body.textContent = greeter(user);
```

`index.html`
```html
<!DOCTYPE html>
<html>
    <head><title>TypeScript Greeter</title></head>
    <body>
        <script src="greeter.js"></script>
    </body>
</html>
```

```console
$ docker run --rm -it -d -v $(pwd):/usr/local/apache2/htdocs -p 80:80 --name tstest httpd
```

classes
--

```ts
class Student {
    fullName: string;
    constructor(public firstName: string, public middleInitial: string, public lastName: string) {
        this.fullName = firstName + " " + middleInitial + " " + lastName;
    }
}

interface Person {
    firstName: string;
    lastName: string;
}

function greeter(person: Person) {
    return "Hello, " + person.firstName + " " + person.lastName;
}

let user = new Student("Jane", "M.", "User");

document.body.textContent = greeter(user);
```

```js
var Student = /** @class */ (function () {
    function Student(firstName, middleInitial, lastName) {
        this.firstName = firstName;
        this.middleInitial = middleInitial;
        this.lastName = lastName;
        this.fullName = firstName + ' ' + middleInitial + ' ' + lastName;
    }
    return Student;
}());
function greeter(person) {
    return 'Hello, ' + person.firstName + ' ' + person.lastName;
}
var user = new Student('Jane', 'M.', 'User');
document.body.textContent = greeter(user);
```
