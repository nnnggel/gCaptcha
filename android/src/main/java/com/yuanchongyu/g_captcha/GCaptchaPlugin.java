package com.yuanchongyu.g_captcha;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.safetynet.SafetyNet;
import com.google.android.gms.safetynet.SafetyNetApi;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/**
 * GCaptchaPlugin
 */
public class GCaptchaPlugin implements PluginRegistry.ActivityResultListener, MethodCallHandler {

    private static final String LOG_TAG = "g_captcha";

    private static final String CHANNEL = "com.yuanchongyu.g_captcha";

    private Activity activity;

    private GCaptchaPlugin(Activity activity) {
        this.activity = activity;
    }

    /**
     * Plugin registration.
     */
    public static void registerWith(PluginRegistry.Registrar registrar) {
        final GCaptchaPlugin plugin = new GCaptchaPlugin(registrar.activity());
        final MethodChannel channel = new MethodChannel(registrar.messenger(), CHANNEL);
        channel.setMethodCallHandler(plugin);
        registrar.addActivityResultListener(plugin);
    }


    @Override
    public void onMethodCall(@NonNull final MethodCall call, @NonNull final Result result) {
        if (call.method.equals("reCaptcha")) {
            String siteKey = call.argument("key");
            SafetyNet.getClient(activity).verifyWithRecaptcha(siteKey)
                    .addOnSuccessListener(new OnSuccessListener<SafetyNetApi.RecaptchaTokenResponse>() {
                        @Override
                        public void onSuccess(SafetyNetApi.RecaptchaTokenResponse response) {
                            result.success(response.getTokenResult());
                        }
                    })
                    .addOnFailureListener(new OnFailureListener() {
                        @Override
                        public void onFailure(@NonNull Exception e) {
                            Log.i(LOG_TAG, "reCaptcha failured", e);
                            result.error("403",
                                    "Verification using reCaptcha has failed", null);
                        }
                    });
        } else {
            result.notImplemented();
        }
    }

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        return false;
    }
}
