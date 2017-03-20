# ContentProvider

## Introduction

The following annotations are supported:

 - `@BindResource`
 - `@BindComponent`

## Example

```java
public class CustomContentProvider extends ContentProvider {
    
    @BindComponent
    private SomeComponent component;

    @Override
    public boolean onCreate() {
        Spork.bind(this);
        return true;
    }

    // ContentProvider methods
}
```