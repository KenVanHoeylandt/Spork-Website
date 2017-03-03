# @BindClick

This annotation can be used with classes inheriting/implementing:

- android.app.`Activity`
- android.app.`Fragment`
- android.support.v4.app.`Fragment` (with the `spork-android-support` dependency)
- android.view.`View`
- io.github.sporklibrary.android.interfaces.`ViewProvider`

You can specify the view id as the annotation value:

```java
@BindClick(R.id.download_button)
private void onClickDownload() {
}
```

Alternatively, you can imply the view id by the method name:

```java
@BindClick
private void download_button() {
}
```

You can also pass the any compatible View instance as method argument:

```java
@BindClick(R.id.download_button)
private void onClickDownload(Button button) {
}
```