# View

## Introduction

When creating a custom view, it's best to extend a `FrameLayout`, because `@BindLayout` will inflate the specified layout into it.

The following annotations are supported:

 - `@BindClick`
 - `@BindView`
 - `@BindLayout`
 - `@BindResource`

## Example

```java
@BindLayout(R.layout.view_layout_binding)
public class MyView extends FrameLayout {

    (R.id.textview)
    private TextView textView;

    public MyView(Context context) {
        super(context);
        // Note: Spork.bind() must be called in 
        // all constructors that are implemented!
        Spork.bind(this);
    }

    @BindClick(R.id.button_one)
    private void onClickDownload() {
        // ...
    }

    // BindClick can also pass the button that was clicked
    @BindClick(R.id.button_two)
    private void onClickOtherButton(Button otherButton) {
        // ...
    }
}
```