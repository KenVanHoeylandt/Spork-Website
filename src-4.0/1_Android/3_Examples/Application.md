# Application

## Introduction

The following annotations are supported:

 - `@BindResource`

## Example

```java
public class MyApplication extends android.app.Application {

    @BindResource(R.string.app_name)
    private String appName;

    @Override
    public void onCreate() {
        super.onCreate();
        Spork.bind(this);
    }
}
```