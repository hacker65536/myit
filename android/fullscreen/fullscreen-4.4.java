//https://developer.android.com/training/system-ui/immersive.html

@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);
        View decor = this.getWindow().getDecorView();
        decor.setSystemUiVisibility(View.SYSTEM_UI_FLAG_HIDE_NAVIGATION  
        | View.SYSTEM_UI_FLAG_FULLSCREEN 
        | View.SYSTEM_UI_FLAG_IMMERSIVE);
    }
