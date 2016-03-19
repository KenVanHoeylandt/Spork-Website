# RecyclerView

## Introduction

To bind `RecyclerView` views, you need to bind the `RecyclerView.ViewHolder`.

The following annotations are supported:

 - `@BindView`
 - `@BindClick`
 - `@BindResource`
 - `@BindComponent`

## Example

```java
public class MyAdapter extends RecyclerView.Adapter<MyAdapter.MyViewHolder>
{
	private final List<String> mItems;

	public MyAdapter(List<String> items)
	{
		mItems = items;
	}

	public class MyViewHolder extends RecyclerView.ViewHolder
	{
		@BindView(R.id.textview)
		private TextView mTextView;

		public MyViewHolder(View itemView)
		{
			super(itemView);

			Spork.bind(this);
		}

		public void update(String text)
		{
			mTextView.setText(text);
		}

		@BindClick(R.id.textview)
		private void onClick()
		{
			// Your click-handling logic goes here
		}
	}

	@Override
	public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType)
	{
		LayoutInflater inflater = LayoutInflater.from(parent.getContext());
		
		View view = inflater.inflate(R.layout.view_recyclerview_item, parent, false);

		return new MyViewHolder(view);
	}

	@Override
	public void onBindViewHolder(MyViewHolder holder, int position)
	{
		String item = mItems.get(position);

		holder.update(item);
	}

	@Override
	public int getItemCount()
	{
		return mItems.size();
	}
}
```