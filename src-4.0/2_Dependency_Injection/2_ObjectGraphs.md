## objectGraphFrom()

Linking `ObjectGraph` instances can seem tricky at first. Let's assume these Android objects:

```java
public class YourApplication extends Application {
    ...
}

public class YourActivity extends Activity {
    ...
}
```

Firstly you want to enrich `YourAppication` class with an `ObjectGraph`:

```java
public class YourApplication extends Application {
    private ObjectGraph objectGraph;

    @Override
    public void onCreate() {
        super.onCreate();

        objectGraph = ObjectGraphs.builder()
                .module(new ExampleApplicationModule())
                .build();
    }

    // Expose it to Activities, Fragments, etc.
    public ObjectGraph getObjectGraph() {
        return objectGraph;
    }
}
```

The next step is to also inject `YourActivity`.
Many people would (wrongly) chose to do this:

```java
public class YourActivity extends Activity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        ((YourApplication) getApplication).getObjectGraph().inject(this);
    }
}
```

It is better to make `YourAppication` implement `ObjectGraphProvider` as follows:

```java
public class YourApplication extends Application implements ObjectGraphProvider {
    private ObjectGraph objectGraph;

    @Override
    public void onCreate() {
        super.onCreate();

        objectGraph = ObjectGraphs.builder()
                .module(new ExampleApplicationModule())
                .build();
    }

    @Override <-- is now part of the ObjectGraphProvider interface
    public ObjectGraph getObjectGraph() {
        return objectGraph;
    }
}
```

With a handy utility from `spork-inject`, you can now easily access the `ObjectGraph` from `YourActivity`:

```java
public class YourActivity extends Activity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        objectGraphFrom(getApplication()).inject(this);
    }
}
```

`objectGraphFrom()` does a type check to see if `YourApplication` implements the right interface. If not, it will throw a `RuntimeException`.
