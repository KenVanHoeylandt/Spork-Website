# Application

## Introduction

The following annotations are supported:

 - `@BindResource`
 - `@BindComponent`

## Example

```java
public class MyApplication extends android.app.Application {

    @BindComponent
    private MyComponent component;

    @BindResource(R.string.app_name)
    private String appName;

    @Override
    public void onCreate() {
        super.onCreate();
        Spork.bind(this);
    }
}

public class MyComponent {
}
```