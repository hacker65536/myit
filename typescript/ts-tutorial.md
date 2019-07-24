
```console
$ mkdir typescript
$ cd !$
```

```console
$ npm i -g typescript
```
```console
$ tsc --version
Version 3.5.3
```

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

```console
$ tsc greeter.ts
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
$ docker run --rm -it -d -v $(pwd):/usr/local/apache2/htdocs -p 80:80 httpd
```

