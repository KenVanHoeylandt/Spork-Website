# Application

## Introduction

The following annotations are supported:

 - `@BindResource`
 - `@BindComponent`

## Example

```java
public class MyApplication extends android.app.Application
{
	@BindComponent
	private MyComponent mComponent;

	@BindResource(R.string.app_name)
	private String mAppName;

	@Override
	public void onCreate()
	{
		super.onCreate();

		Spork.bind(this);
	}
}

public class MyComponent
{
}
```