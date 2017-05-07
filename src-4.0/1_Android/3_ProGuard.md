# ProGuard & DexGuard

When using `spork-android` or `spork-android-support`, your ProGuard configurations are provided by the library.

When using `spork-inject`, you should manually configure ProGuard/DexGuard for the injectable classes. For example:

```java
-keep class com.yourapp.modules.** { *; }
-keep interface com.yourapp.interfaces.** { *; }
```