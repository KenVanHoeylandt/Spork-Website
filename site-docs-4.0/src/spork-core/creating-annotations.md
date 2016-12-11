# Creating Annotations

## Overview

Spork annotations are bound through one or more of:

- `MethodBinder`
- `FieldBinder`
- `TypeBinder`

These binders are registered through a `BinderRegistery` which is accessible through `Spork.sharedInstance().getBinderRegistry()`

## FieldBinder

FieldBinders are used for annotations that target `ElementType.FIELD`.

### Example
```java
public class BindViewBinder implements FieldBinder<BindView> {
	
	@Override
	public void bind(Object object, BindView annotation, Field field, Object[] modules) {
		if (!View.class.isAssignableFrom(field.getType())) {
			throw new BindException(/* ... */);
		}

		View view = Views.getView(viewResolver, annotation.value(), field.getName(), object);

		Reflection.setFieldValue(annotation, field, object, view);
	}

	@Override
	public Class<BindView> getAnnotationClass() {
		return BindView.class;
	}
}
```

Check out the `@BindView` annotation binder: `BindViewBinder` [here](https://github.com/SporkLibrary/Spork/blob/master/spork-android/src/main/java/io/github/sporklibrary/android/internal/binders/BindViewBinder.java).

## MethodBinder

MethodBinders are used for annotations that target `ElementType.METHOD`.

### Example

```java
public class BindClickBinder implements MethodBinder<BindClick> {

	@Override
	public void bind(Object object, BindClick annotation, Method method, @Nullable Object[] modules) {
		View view = Views.getView(viewResolver, annotation.value(), method.getName(), object);
		view.setOnClickListener(new OnClickListener() {
			/* handle click */
		});
	}

	@Override
	public Class<BindClick> getAnnotationClass() {
		return BindClick.class;
	}
}
```

Check out the `@BindClick` annotation binder: `BindClickBinder` [here](https://github.com/SporkLibrary/Spork/blob/master/spork-android/src/main/java/io/github/sporklibrary/android/internal/binders/BindClickBinder.java).

## TypeBinder

TypeBinders are used for annotations that target `ElementType.TYPE`.

### Example

```java
public interface IntSettable {
	void setValue(int value);
}

public class ValueBinder implements TypeBinder<BindValue> {

	@Override
	void bind(Object object, AnnotationType annotation, Class<?> annotatedType, Object[] modules) {
		// @BindValue only works with IntSettable implementations
		if (!IntSettable.class.isAssignableFrom(object.getClass())) {
			throw new BindException(/* ... */);
		}

		// Safely convert to IntSettable
		IntSettable value_holder = (IntSettable)object;

		// Set the integer value
		int value = annotatedClass.getAnnotation().value();
		value_holder.setValue(value);
	}

	@Override
	public Class<BindValue> getAnnotationClass() {
		return BindValue.class;
	}
}

```

Check out the `@BindLayout` annotation binder: `BindLayoutBinder` [here](https://github.com/SporkLibrary/Spork/blob/master/spork-android/src/main/java/io/github/sporklibrary/android/internal/binders/BindLayoutBinder.java).

## Binder registration

### Single target binders

For binders that only bind to a single annotation target (e.g. `ElementType.FIELD`, `ElementType.METHOD` or `ElementType.TYPE`). The following code demonstrates this.

**YourAnnotation.java**
```java
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface YourAnnotation {
}
```

**YourAnnotationBinder.java**
```java
class YourAnnotationBinder implements MethodBinder<YourAnnotation> {
	// implementation
}
```

**Main.java**
```java
Spork.sharedInstance().getBinderRegistry().register(new YourAnnotationBinder());
```

### Multi-target binders

For binders that only bind to multiple annotation targets (e.g. `ElementType.FIELD`, `ElementType.METHOD` or `ElementType.TYPE`). The following code demonstrates this.

**YourAnnotation.java**
```java
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD, Element.FIELD })
public @interface YourAnnotation {
}
```

**YourAnnotationBinder.java**
```java
class YourAnnotationBinder
	implements MethodBinder<YourAnnotation>, FieldBinder<YourAnnotation> {
	// implementation
}
```

**Main.java**
```java
YourAnnotationBinder binder = new YourAnnotationBinder();

// register as MethodBinder
Spork.sharedInstance().getBinderRegistry().register((MethodBinder<YourAnnotation>)binder);
// register as FieldBinder
Spork.sharedInstance().getBinderRegistry().register((FieldBinder<YourAnnotation>)binder);
```
