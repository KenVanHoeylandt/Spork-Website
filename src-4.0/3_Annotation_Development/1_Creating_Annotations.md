# Creating Annotations

## Overview

Spork annotations are bound through one or more of:

- `MethodBinder`
- `FieldBinder`
- `TypeBinder`

These binders are registered with `Spork.register()`

## FieldBinder

FieldBinders are used for annotations that target `ElementType.FIELD`.

### Example
```java
public class BindViewBinder implements FieldBinder<BindView> {
    
    @Override
    public void bind(Object object, BindView annotation, Field field, Object... parameters) {
        if (!View.class.isAssignableFrom(field.getType())) {
            throw new BindFailed(...);
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

## MethodBinder

MethodBinders are used for annotations that target `ElementType.METHOD`.

### Example

```java
public class BindClickBinder implements MethodBinder<BindClick> {

    @Override
    public void bind(Object object, BindClick annotation, Method method, Object... parameters) {
        View view = Views.getView(viewResolver, annotation.value(), method.getName(), object);
        view.setOnClickListener(new OnClickListener() {
            // ...
        });
    }

    @Override
    public Class<BindClick> getAnnotationClass() {
        return BindClick.class;
    }
}
```

## TypeBinder

TypeBinders are used for annotations that target `ElementType.TYPE`.

### Example

```java

@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
public @interface SetValue {
    int value();
}

public interface ValueSetter {
    void setValue(int value);
}

public class ValueBinder implements TypeBinder<SetValue> {

    @Override
    void bind(Object object, ValueSetter annotation, Class<?> annotatedType, Object... parameters) {
        // @SetValue only works with ValueSetter implementations
        if (object instanceof ValueSetter) {
            // Safely convert to ValueSetter
            ValueSetter value_holder = (ValueSetter)object;

            // Set the integer value
            int value = annotatedClass.getAnnotation().value();
            value_holder.setValue(value);
        } else {
            throw new BindFailed(...);
        }
    }

    @Override
    public Class<SetValue> getAnnotationClass() {
        return SetValue.class;
    }
}

```

Usage:

```java

@SetValue(123)
class Example implements ValueSetter {
    private int value;

    public Example() {
        Spork.bind(this); // ensures "123" is set through setValue()
    }

    @Override
    public void setValue(int value) {
        this.value = value;
    }
}
```

## Binder registration

Registering new binders must be done before the first call to `bind()`.

Registration is done as follows:

```java
Spork.register(new YourAnnotationBinder());
```
