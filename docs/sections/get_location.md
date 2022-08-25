
## Dependencies and versions

The following dependencies and versions are known to work to run Spear:

``` groovy
    implementation 'androidx.appcompat:appcompat:1.0.2'
    implementation 'com.google.android.material:material:1.2.1'
    implementation 'com.google.android.gms:play-services-maps:18.0.2'
    implementation 'com.google.android.gms:play-services-location:17.0.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.4'
    implementation 'com.google.guava:guava:28.1-jre'
    implementation 'joda-time:joda-time:2.9.4'
    implementation 'commons-net:commons-net:3.6'
    implementation 'org.apache.commons:commons-compress:1.19'
    implementation 'com.squareup.retrofit2:retrofit:2.4.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.4.0'
    implementation 'com.squareup.okhttp3:logging-interceptor:3.10.0'
    implementation 'io.reactivex.rxjava2:rxjava:2.1.9'
    implementation 'io.reactivex.rxjava2:rxandroid:2.0.2'
    implementation 'com.jakewharton.retrofit:retrofit2-rxjava2-adapter:1.0.0'
    implementation group: 'commons-io', name: 'commons-io', version: '2.6'
    implementation 'cat.rokubun.wals:wals:6.+'
    implementation 'cat.rokubun.core:core:6.+'
    implementation fileTree(dir: 'libs', include: ['*.aar', '*.jar'], exclude: [])
```

## Permissions

The required permissions for running Spear now are:

- Manifest.permission.INTERNET: Download Navigation data from Internet
- Manifest.permission.READ_PHONE_STATE: 
- Manifest.permission.ACCESS_NETWORK_STATE:
- Manifest.permission.ACCESS_WIFI_STATE: WIFI RTT Hybridisation
- Manifest.permission.CHANGE_WIFI_STATE: WIFI RTT Hybridisation
- Manifest.permission.ACCESS_COARSE_LOCATION: Access to Navigation data
- Manifest.permission.ACCESS_FINE_LOCATION: Get Android Location as fallback
- Manifest.permission.WRITE_EXTERNAL_STORAGE: Store navigation files
- Manifest.permission.READ_EXTERNAL_STORAGE: Store navigation files
- Manifest.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS: Development

The WIFI permissions are related to the usage of WIFI AP inside the location engine, but they are 
currently disabled so they may be not needed in the future.

Depending on the Android version, the user will need to manually set a higher level of permissions 
for location and media files from the Application Information Settings. in order to know if this is the problem, 
check the Logcat if a Permission denied to write to a folder is returned.


## How to use it

The use of Spear as Location Engine follows the same approach than the FusedLocationClient in Android SDK.

Get an instance of Spear Engine

``` java
SpearLocationClient locationClient = SpearLocationClient.getSpearLocationProvider(this);
locationClient.addProvider(SpearLocationClient.Provider.WIFI);
locationClient.addProvider(SpearLocationClient.Provider.GNSS);
```


Create a callback where a Location object will be returned

``` java
SpearLocationCallback mLocationCallback = new SpearLocationCallback() {
    @Override
    public void onLocationResult(Location location) {
        Log.i("DEBUG", "New location: " + location.toString());
    }
};
```


Request Location updates with the callback

``` java
locationClient.requestLocationUpdates(mLocationCallback);
```

The instance of the Engine should be retrieved after the permissions are granted or an exception will 
be thrown.


