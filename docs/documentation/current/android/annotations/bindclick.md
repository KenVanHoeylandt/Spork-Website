# @BindClick

This annotation can be used with classes derived from:

- android.app.`Activity`
- android.app.`Fragment`
- android.support.v4.app.`Fragment`
- android.support.v7.widget.`RecyclerView.ViewHolder`
- android.view.`View`

You can specify the view id as the annotation value:

```java
@BindClick(R.id.download_button)
private void onClickDownload()
{
}
```

Alternatively, you can imply the view id by the method name:

```java
@BindClick
private void download_button()
{
}
```

You can also pass the any compatible View instance as method argument:

```java
@BindClick(R.id.download_button)
private void onClickDownload(Button button)
{
}
```