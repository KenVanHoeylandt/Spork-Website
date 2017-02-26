# Component

## Introduction

`Spork.bind()` can be used on any `Object` to bind components to its fields.

A component can be bound directly:

```java
@BindComponent
private RegularUserManager regularUserManager;
```

Or it can be bound by specifying its interface and implementation:
```java
@BindComponent(RegularUserManager.class)
private UserManager userManager;
```

Check out the [component documentation](../annotations/#bindcomponent) for more details.

## Example

**Services**
```java
public interface UserManager {
	User getUser(long id);
}

@ComponentScope(ComponentScope.Scope.SINGLETON) // optional annotation
public class RegularUserManager implements UserManager
{
	public User getUser(long id) {
		// return user from database
	}
}

@ComponentScope(ComponentScope.Scope.SINGLETON) // optional annotation
public class CachedUserManager implements UserManager {
	public User getUser(long id) {
		// return user from cache
	}
}

```

**Application**
```java
public class Application implements Runnable {
	
	@BindComponent(RegularUserManager.class)
	private UserManager regularUserManager;

	@BindComponent(CachedUserManager.class)
	private UserManager cachedUserManager;

	public Application() {
		Spork.bind(this);
	}

	@Override
	public void run() {
		// use regularUserManager and cachedUserManager
	}
}
```