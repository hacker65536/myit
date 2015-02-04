#express

Fast, unopinionated, minimalist web framework for Node.js  
##link
http://expressjs.com/  
http://hideyukisaito.github.io/expressjs-doc_ja/  

##install
```bash
mkdir myapp
cd myapp
npm init
npm install express --save
```

omit the --save opthion if its not necessary to add to the dependencies list

##express generator
```bash
npm install express-gnerator -g
```
```bash
express -h

  Usage: express [options] [dir]

  Options:

    -h, --help          output usage information
    -V, --version       output the version number
    -e, --ejs           add ejs engine support (defaults to jade)
        --hbs           add handlebars engine support
    -H, --hogan         add hogan.js engine support
    -c, --css <engine>  add stylesheet <engine> support (less|stylus|compass) (defaults to plain css)
        --git           add .gitignore
    -f, --force         force on non-empty directory


```

```bash
express myapp
```
