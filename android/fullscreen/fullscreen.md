

##タイトルバーの非表示  

AndroidManifest.xml
```xml
<application
android:allowBackup="true"
android:icon="@drawable/ic_launcher"
android:label="@string/app_name"
android:theme="@android:style/Theme.NoTitleBar">
```
`@android:style/Theme.NoTitleBar`  
`@android:style/Theme.Black.NoTitleBar`  
`@android:style/Theme.Light.NoTitleBar`

##フルスクリーン 

https://developer.android.com/training/system-ui/immersive.html

没入型フルスクリーン  (4.4kitcat以上)

`View.SYSTEM_UI_FLAG_HIDE_NAVIGATION`  
`View.SYSTEM_UI_FLAG_FULLSCREEN`  
`View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY` or `View.SYSTEM_UI_FLAG_IMMERSIVE`

IMMERSIVE_STICKYは自動で消える IMMERSIVEは表示非表示をコントロールしたい場合


```java
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    View decor = this.getWindow().getDecorView();
        decor.setSystemUiVisibility(
            View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
          | View.SYSTEM_UI_FLAG_FULLSCREEN
          | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
```
