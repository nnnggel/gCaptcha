## Flutter g_captcha 
A flutter plugin for [reCAPTCHA](https://developers.google.com/recaptcha/intro) [v2 - android](https://developer.android.com/training/safetynet/recaptcha.html). The FREE anti-abuse service.

## What is reCAPTCHA?
reCAPTCHA is a free service that protects your site from spam and abuse. It uses advanced risk analysis engine to tell humans and bots apart. With the new API, a significant number of your valid human users will pass the reCAPTCHA challenge without having to solve a CAPTCHA (See blog for more details). reCAPTCHA comes in the form of a widget that you can easily add to your blog, forum, registration form, etc.

Please check [docs](https://developers.google.com/recaptcha/intro) for further details.

## Sign up for an API key pair
To use reCAPTCHA, you need to [sign up for an API key pair](https://www.google.com/recaptcha/admin) for your site. The key pair consists of a site key and secret. The site key is used to display the widget on your site. The secret authorizes communication between your application backend and the reCAPTCHA server to verify the user's response. The secret needs to be kept safe for security purposes.

Config 'android package name' to reCaptcha's admin console
> You need to add 'android package name' to reCaptcha's [admin console](https://www.google.com/recaptcha/admin/create), or you will always get error: RECAPTCHA_INVALID_PACKAGE_NAME

## Usage

### 1. Add dependency to [pubspec.yaml](https://dart.dev/tools/pub/dependencies)
> dependencies:  
> ....g_captcha: ^1.0.0

Don't forget this
> flutter pub get
    
### 2. Import in dart file
> import 'package:g_captcha/g_captcha.dart';

### 3. Config CAPTCHA_SITE_KEY and Call out 
> const String CAPTCHA_SITE_KEY = "CAPTCHA_SITE_KEY_HERE";  
> ...  
> String tokenResult = await GCaptcha.reCaptcha(CAPTCHA_SITE_KEY);  
> print('tokenResult: $tokenResult');

![avatar](https://github.com/nnnggel/gCaptcha/blob/master/snapshot.png)

## Verify token (java with okhttp demo)
> https://developers.google.com/recaptcha/docs/verify
```
package com.yuanchongyu.recapcha;

import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.json.JSONObject;

public class Main {

    // TODO
    private static final String RECAPTCHA_SECRET_KEY = "RECAPTCHA_SECRET_KEY_HERE";

    private static final String RECAPTCHA_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify";

    public static void main(String[] args) throws Exception {
        // TODO
        boolean success = verify("03AGdBq25vYY080h0Wvk-XpCkhvEoBxS2YK-EbGqWq5Ru_hWxCt2XfGr7S8LMB9z3aU411MGXRoTSIQ_OvBeFSIqLNsxLyOUDCFOXzh1DYGMbaMvnc0FfqnfFc1yWu3fK6fYNSb09QVbUKeuifpYo6GBX6GiqOEu-AjIbZMz8TxkBUbBw9VpQG2PmfREPNwV6dWVpEQe4-oy-SP3IL94DFdTrkRoYQoCfZsSpTuGXh1gepxuqn-VJOBbxeFy_Qsha1BFYRvp2reifIX9Fd18jcToYI1OVLhQmRgM1shYNoszAnRjVSGFNfE6M");
        System.out.println("verify result: " + success);
    }

    private static boolean verify(String token) throws Exception {
        RequestBody formBody = new FormBody.Builder().add("secret", RECAPTCHA_SECRET_KEY).add("response", token)
            .build();
        Response response = post(RECAPTCHA_VERIFY_URL, formBody);
        String resp = response.body().string();
        return new JSONObject(resp).getBoolean("success");
    }

    private Response post(String url, RequestBody body) throws IOException {
        Request request = new Request.Builder().url(url).post(body).build();
        Response response = httpClient.newCall(request).execute();
        if (!response.isSuccessful()) {
            throw new IOException("request error: " + response);
        }
        return response;
    }
}

```
