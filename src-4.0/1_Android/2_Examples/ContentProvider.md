# ContentProvider

## Introduction

The following annotations are supported:

 - `@BindResource`

## Example

```java
public class CustomContentProvider extends ContentProvider {
    
    @BindResource(R.string.helloworld)
    private String helloWorld;

    @Override
    public boolean onCreate() {
        Spork.bind(this);
        return true;
    }

    // ContentProvider methods
}
```