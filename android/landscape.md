http://developer.android.com/guide/topics/manifest/activity-element.html#screen
```xml
<activity
            android:name=".MainActivity"
            android:label="@string/app_name"
            android:screenOrientation="sensorLandscape">
```

`landscape` `sensorLandscape`

http://developer.android.com/reference/android/content/pm/ActivityInfo.html#SCREEN_ORIENTATION_USER_LANDSCAPE

```java
setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_USER_LANDSCAPE);
```
