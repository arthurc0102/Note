# Show Context Menu With Button Short Click

```java
public class MainActivity extends AppCompatActivity {

    Button button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button = (Button) findViewById(R.id.button);
        registerForContextMenu(button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                button.performLongClick();
            }
        });
    }

    @Override
    public boolean onContextItemSelected(MenuItem item) {
        //當使用者點選項目時，所需的動作
        Toast.makeText(this, "您選擇的是"+item.getTitle(), Toast.LENGTH_SHORT).show();
        return super.onContextItemSelected(item);
    }


    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        menu.add(0, 0, 0, "紅茶");
        menu.add(0, 1, 0, "奶茶");
        menu.add(0, 2, 0, "綠茶");
        menu.add(0, 3, 0, "青茶");
    }
}
```
