# @BindView

This annotation can be used with classes inheriting/implementing:

- android.app.`Activity`
- android.app.`Fragment`
- android.support.v4.app.`Fragment` (with the `spork-android-support` dependency)
- android.view.`View`
- spork.android.`ViewProvider`

You can bind a view by specifying its id:

```java
@BindView(R.id.my_button)
private Button button;
```

Alternatively, you can imply the view id by the field name:

```java
@BindView
private Button my_button;
```