# polly example_code

https://docs.aws.amazon.com/sdk-for-javascript/v3/developer-guide/getting-started-browser.html

https://github.com/awsdocs/aws-doc-sdk-examples/blob/master/javascriptv3/example_code/polly/README.md


```
git clone https://github.com/awsdocs/aws-doc-sdk-examples.git
cd !$/avascriptv3/example_code/polly/
```

```
npm i
cd src
npx webpack polly.js --mode development --libraryTarget commonjs2 --target web --devtool false -o main.js
```

edit HTML
```
vim polly.html
```

```html
<script type="text/javascript" src="./main.js"></script>
```

edit main.js
```js
// Create the Polly service client, assigning your credentials
const client = new Polly({
  region: "REGION",
  credentials: fromCognitoIdentityPool({
    client: new CognitoIdentityClient({ region: "REGION" }),
    identityPoolId: "IDENTITY_POOL_ID" // IDENTITY_POOL_ID
  }),
});
// Set the parameters
const speechParams = {
  OutputFormat: "OUTPUT_FORMAT", // For example, 'mp3'
  SampleRate: "SAMPLE_RATE", // For example, '16000
  Text: "", // The 'speakText' function supplies this value
  TextType: "TEXT_TYPE", // For example, "text"
  VoiceId: "POLLY_VOICE" // For example, "Matthew"
};
```
