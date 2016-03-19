# Component

## Introduction

`Spork.bind()` can be used on any `Object` to bind components to its fields.

A component can be bound directly:

```java
@BindComponent
private UserDatabaseService mUserService;
```

Or it can be bound by specifying its interface and implementation:
```java
@BindComponent(UserDatabaseService.class)
private UserService mUserService;
```

Check out the [component documentation](../annotations/#bindcomponent) for more details.

## Example

**Services**
```java
public interface UserService
{
	User getUser(long id);
}

@ComponentScope(ComponentScope.Scope.SINGLETON) // optional annotation
public class UserDatabaseService implements UserService
{
	public User getUser(long id)
	{
		// return user from database
	}
}

@ComponentScope(ComponentScope.Scope.SINGLETON) // optional annotation
public class UserCacheService implements UserService
{
	public User getUser(long id)
	{
		// return user from cache
	}
}

```

**Application**
```java
public class Application implements Runnable
{
	@BindComponent(UserDatabaseService.class)
	private UserService mUserDatabaseService;

	@BindComponent(UserCacheService.class)
	private UserService mUserCacheService;

	public Application()
	{
		Spork.bind(this);
	}

	@Override
	public void run()
	{
		// use mUserCacheService and mUserDatabaseService
	}
}
```