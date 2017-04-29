package com.example.arthur.httprequest;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.FormBody;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class MainActivity extends AppCompatActivity {

    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    private static final MediaType JPG = MediaType.parse("image/jpeg");
    private static final int RESULT_LOAD_IMAGE = 1;
    private static final String WRITE_EXTERNAL_STORAGE = "android.permission.WRITE_EXTERNAL_STORAGE";
    private static final String HOST = "http://192.168.1.220:8000/";

    Context context;
    TextView txtShow;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtShow = (TextView) findViewById(R.id.txtShow);
    }

    protected void onResume() {
        super.onResume();

        // save now status
        context = this;

        Button btnGet = (Button) findViewById(R.id.btnGet);
        btnGet.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                connect2Server(getRequest());
            }
        });

        Button btnPost = (Button) findViewById(R.id.btnPost);
        btnPost.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                connect2Server(postRequest());
            }
        });

        Button btnJson = (Button) findViewById(R.id.btnJson);
        btnJson.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                connect2Server(jsonRequest());
            }
        });

        Button btnFile = (Button) findViewById(R.id.btnFile);
        btnFile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!checkPermission(view.getContext(), WRITE_EXTERNAL_STORAGE)) {
                    ActivityCompat.requestPermissions(
                            MainActivity.this,
                            new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                            1);
                    return;
                }

                Intent i = new Intent(
                        Intent.ACTION_PICK,
                        android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);

                startActivityForResult(i, RESULT_LOAD_IMAGE);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == RESULT_LOAD_IMAGE && resultCode == RESULT_OK && null != data) {
            Uri selectedImage = data.getData();
            String[] filePathColumn = {MediaStore.Images.Media.DATA};

            Cursor cursor = getContentResolver().query(
                    selectedImage,
                    filePathColumn,
                    null,
                    null,
                    null);

            if (cursor == null) {
                return;
            }

            cursor.moveToFirst();

            int columnIndex = cursor.getColumnIndex(filePathColumn[0]);
            String picturePath = cursor.getString(columnIndex);
            cursor.close();

            File file = new File(picturePath);
            String filename = picturePath.substring(picturePath.lastIndexOf("/") + 1);
            connect2Server(fileRequest(file, filename));
        }
    }

    private boolean checkPermission(Context context, String permission) {
        int res = context.checkCallingOrSelfPermission(permission);
        return (res == PackageManager.PERMISSION_GRANTED);
    }

    protected Request getRequest() {
        HttpUrl.Builder url = HttpUrl.parse(HOST + "get")
                .newBuilder()
                .addQueryParameter("a", "1")
                .addQueryParameter("b", "2");

        return new Request.Builder()
                .url(url.toString())
                .build();
    }

    protected Request postRequest() {
        RequestBody body = new FormBody.Builder()
                .add("c", "3")
                .add("d", "4")
                .build();

        return new Request.Builder()
                .url(HOST + "post")
                .post(body)
                .build();
    }

    protected Request jsonRequest() {
        String json = "";

        try {
            json = new JSONObject()
                    .put("e", "5")
                    .put("f", "6")
                    .toString();
        } catch (JSONException e) {
            e.printStackTrace();
        }

        RequestBody body = RequestBody.create(JSON, json);

        return new Request.Builder()
                .url(HOST + "json")
                .post(body)
                .build();

    }

    protected Request fileRequest(File file, String filename) {
        RequestBody body = new MultipartBody.Builder()
                .setType(MultipartBody.FORM)
                .addFormDataPart("file", filename, RequestBody.create(JPG, file))
                .build();

        return new Request.Builder()
                .url(HOST + "file")
                .post(body)
                .build();
    }

    protected void connect2Server(Request request) {
        OkHttpClient okHttpClient = new OkHttpClient();

        okHttpClient.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        txtShow.setText("Connect to server fail.");
                    }
                });
                Log.e("connect", "connection error");
                e.printStackTrace();
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
                final String rStr = response.body().string();
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        txtShow.setText(rStr);
                    }
                });
            }
        });
    }


}

