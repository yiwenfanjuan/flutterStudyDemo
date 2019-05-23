package com.example.basicwidgetdemo1;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.flutter.io/battery";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if(methodCall.method.equals("getBatteryLevel")){
                            double batteryLevel = getBatteryLevel();
                            if(batteryLevel != -1){
                                result.success(batteryLevel);
                            }else{
                                result.error("UNAVAILABLE","Battery level not available",null);
                            }
                        }else{
                            result.notImplemented();
                        }
                    }
                }
        );
    }

    //获取手机剩余电量
    private double getBatteryLevel(){
        double battery = -1;
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
            BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            battery = manager.getLongProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        }else{
            Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null,new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            battery = intent.getIntExtra(BatteryManager.EXTRA_LEVEL,-1) / intent.getIntExtra(BatteryManager.EXTRA_SCALE,-1);
        }
        return battery;
    }
}
