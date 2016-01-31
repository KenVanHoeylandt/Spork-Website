# Overview

Spork annotations are bound through a `MethodBinder` and/or a `FieldBinder`.

These binders are registered through a `BinderManager` which is accessible through `Spork.getBinderManager()`

# FieldBinder example

```java
public class BindViewBinder implements FieldBinder<BindView>
{
	@Override
	public Class<BindView> getAnnotationClass()
	{
		return BindView.class;
	}

	@Override
	public void bind(final Object object, final AnnotatedField<BindView> annotatedField)
	{
		// Internally retrieves a `View` from the `object`
		// by checking its type (Activity/Fragment/View)
		final @Nullable View view = resolveView(object, annotatedField);

		if (view == null)
		{
			throw new BindException(...);
		}

		// Set the value for the object given the AnnotatedField
		AnnotatedFields.set(annotatedField, object, view);
	}
}
```

Check out the `@BindView` annotation binder: `BindViewBinder`.

It can be found [here](https://github.com/SporkLibrary/Spork-Android/blob/master/src/main/java/io/github/sporklibrary/binders/BindViewBinder.java)

# MethodBinder example

```java
public class BindClickBinder implements MethodBinder<BindClick>
{
	@Override
	public Class<BindClick> getAnnotationClass()
	{
		return BindClick.class;
	}

	@Override
	public void bind(final Object object, AnnotatedMethod<BindClick> annotatedMethod)
	{
		// Internally retrieves a 'View' from the `object`
		// by checking its type (Activity/Fragment/View)
		final @Nullable View view = getView(object, annotatedMethod);

		if (view == null)
		{
			throw new BindException(...);
		}

		// Bind the custom OnClickListener that applies Java reflection
		// This saves CPU-intensive reflection calls until when it's necessary
		view.setOnClickListener(new CustomListener(annotatedMethod, object));
	}
}
```

Check out the `@BindClick` annotation binder: `BindClickBinder`.

It can be found [here](https://github.com/SporkLibrary/Spork-Android/blob/master/src/main/java/io/github/sporklibrary/binders/BindClickBinder.java)
