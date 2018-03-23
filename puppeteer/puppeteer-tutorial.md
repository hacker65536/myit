

env = ubuntu

install chrome
------------
```
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable
```

```
sudo apt-get install -y nodejs npm
npm cache clean
sudo npm cache clean
sudo npm install n -g
sudo n stable
sudo ln -sf /usr/local/bin/node /usr/bin/node
node -v
sudo apt-get purge -y nodejs npm
```

```
mkdir puppeteer
cd !$
npm -i save puppeteer
```

example.js
```js
onst puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://id.heroku.com/login');
  await page.screenshot({path: 'login.png'});

  await page.focus('input[name="email"]');
  await page.type('#email','myemail@address');
  await page.focus('input[name="password"]');
  await page.type('#password','mypassword');

  const buttonElement = await page.$('button[type=submit]');

  await buttonElement.click();
  await page.waitFor(5000);
  await page.screenshot({path: 'logined.png'});

  await browser.close();
})();
```

```
node example.js
ls
example.js  example.png  logined.png  login.png  node_modules  package-lock.json
```
