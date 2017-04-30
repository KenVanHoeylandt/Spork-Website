
Scopes can be custom-made. Firstly you need to define the annotation for your scope:
```java
@Scope
@Retention(RetentionPolicy.RUNTIME)
private @interface SessionScope {
}
```

The root `ObjectGraph` will always automatically define the Singleton scope, as the root
`ObjectGraph` will contain all singleton instances. Let's consider these classes:

- `Application`: Main application instance, injected by `ApplicationModule`
- `Session`: A session started in the application, injected by `SessionModule`
- `Screen`: A view controller that exists in the Session's scope, injected by `ScreenModule`

For this we need to define some modules:

```java
class ApplicationModule {
    ...
}

class SessionModule {
    static final AtomicInteger counter = new AtomicInteger();

    @Provides
    @SessionScope
    public Integer provideSessionId() {
        return counter.incrementAndGet();
    }
}

class ScreenModule {
    ...
}
```

These are some classes that could be injected by the above modules:

```java
private static class Application {
    final ObjectGraph appGraph;

    ...

    public Application() {
        appGraph = ObjectGraphs.builder()
                .module(new ApplicationModule())
                .build();

        appGraph.inject(this);
    }
}

private static class Session {
    final ObjectGraph sessionGraph;
    @Inject Integer sessionId;

    // create an ObjectGraph based on AppGraph, using SessionScope as scope
    public Session(ObjectGraph appGraph) {
        ObjectGraph sessionGraph = ObjectGraphs.builder()
                .scope(SessionScope.class)
                .module(new SessionModule())
                .build();

        sessionGraph.inject(this);
    }
}

private static class Screen {
    final ObjectGraph screenGraph;
    @Inject Integer sessionId;

    public Screen(ObjectGraph sessionGraph) {
        screenGraph = ObjectGraphs.builder()
            .module(new ScreenModule())
            .build();

        screenGraph.inject(this)
    }

    public Integer getSessionId() {
        return sessionId;
    }
}
```

The Screen is now bound to a `Session`. Any newly created `Screen` that is started with the same `ObjectGraph` from the created `Session` will share its `SessionScope` instances.
