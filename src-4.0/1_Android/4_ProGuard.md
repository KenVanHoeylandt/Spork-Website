# ProGuard & DexGuard

ProGuard's shrinking process _might_ remove your dependencies, because they are indirectly instantiated by means of reflection.
To avoid this, you need to specify the classes and interfaces to keep in your proguard configuration.

## Example

You can ensure that your classes and interfaces are kept in an Android ProGuard/DexGuard configuration file:

```java
-keep class com.yourapp.modules.** { *; }
-keep interface com.yourapp.interfaces.** { *; }
```