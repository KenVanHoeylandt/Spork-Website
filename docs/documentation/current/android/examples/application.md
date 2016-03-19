# Application

## Introduction

The following annotations are supported:

 - `@BindResource`
 - `@BindComponent`

## Example

```java
public class MyApplication extends android.app.Application
{
	@BindResource(R.dimen.some_dimension)
	private Float mDimension;

	@BindComponent
	private SomeComponent mComponent;

	@Override
	public void onCreate()
	{
		super.onCreate();

		Spork.bind(this);
	}
}

public class SomeComponent
{
	// ...	
}
```