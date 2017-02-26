# @BindView

This annotation can be used with classes derived from:

- android.app.`Activity`
- android.app.`Fragment`
- android.support.v4.app.`Fragment`
- android.support.v7.widget.`RecyclerView.ViewHolder`
- android.view.`View`

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