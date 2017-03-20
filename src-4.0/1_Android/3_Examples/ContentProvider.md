# ContentProvider

## Introduction

The following annotations are supported:

 - `@BindResource`
 - `@Inject`

## Example

```java
public class CustomContentProvider extends ContentProvider {
    
    @BindResource(R.string.helloworld)
    private String helloWorld;

    @Override
    public boolean onCreate() {
        Spork.bind(this, new Module());
        return true;
    }

    // ContentProvider methods
}
```