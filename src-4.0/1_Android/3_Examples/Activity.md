# Activity

## Introduction

The following annotations are supported:

 - `@BindClick`
 - `@BindView`
 - `@BindLayout`
 - `@BindResource`
 - `@BindFragment`

## Example

```java
@BindLayout(R.layout.activity_download)
public class DownloadActivity extends Activity {

    @BindView(R.id.download_button)
    private Button downloadButton;

    @BindFragment(R.id.details_fragment)
    private DetailsFragment fragment;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Spork.bind(this);
    }

    @BindClick(R.id.other_button)
    private void onClickButton(Button someButton) {
        downloadManager.startDownload();
    }
}
```