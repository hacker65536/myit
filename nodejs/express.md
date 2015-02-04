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
###create sample-app
```bash
express myapp

   create : myapp
   create : myapp/package.json
   create : myapp/app.js
   create : myapp/public
   create : myapp/public/javascripts
   create : myapp/public/images
   create : myapp/public/stylesheets
   create : myapp/public/stylesheets/style.css
   create : myapp/routes
   create : myapp/routes/index.js
   create : myapp/routes/users.js
   create : myapp/views
   create : myapp/views/index.jade
   create : myapp/views/layout.jade
   create : myapp/views/error.jade
   create : myapp/bin
   create : myapp/bin/www

   install dependencies:
     $ cd myapp && npm install

   run the app:
     $ DEBUG=myapp:* ./bin/www
```
```bash
cd myapp
npm install
```
