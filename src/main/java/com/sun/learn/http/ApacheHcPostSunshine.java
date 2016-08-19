package com.sun.learn.http;

import org.apache.hc.client5.http.cookie.BasicCookieStore;
import org.apache.hc.client5.http.cookie.Cookie;
import org.apache.hc.client5.http.entity.EntityBuilder;
import org.apache.hc.client5.http.impl.sync.CloseableHttpClient;
import org.apache.hc.client5.http.impl.sync.HttpClients;
import org.apache.hc.client5.http.methods.CloseableHttpResponse;
import org.apache.hc.client5.http.methods.HttpGet;
import org.apache.hc.client5.http.methods.HttpPost;
import org.apache.hc.client5.http.protocol.HttpClientContext;
import org.apache.hc.core5.http.Header;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.NameValuePair;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.entity.ContentType;
import org.apache.hc.core5.http.entity.EntityUtils;
import org.apache.hc.core5.http.message.BasicHeader;
import org.apache.hc.core5.http.message.BasicNameValuePair;
import org.apache.hc.core5.http.protocol.HttpCoreContext;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.util.List;

/**
 * Created by dongpengfei
 * Date 16/5/24
 * Time 上午10:14
 */

public class ApacheHcPostSunshine {
    public static void main(String[] args){
        CloseableHttpClient httpClient = HttpClients.createDefault();

        HttpPost httpPost = new HttpPost("http://192.168.1.16:8080/Sunshine/login");



//        final Header[] hdrs = new Header[] {
//
//                new BasicHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8"),
//                new BasicHeader("Referer", "http://ermei-ccms.stage.fenxibao.com/ccms/modules/login/index.html")
//        };

        final NameValuePair parameters[] = new NameValuePair[2];


        parameters[0] = new BasicNameValuePair("username", "孙辉");
        parameters[1] = new BasicNameValuePair("password", "12");


        BasicCookieStore cookieStoreBack = new BasicCookieStore();

        final HttpClientContext contextback = HttpClientContext.create();
        contextback.setCookieStore(cookieStoreBack);

        try {
            HttpEntity entity = EntityBuilder.create().setParameters(parameters).
                    setContentType(ContentType.APPLICATION_FORM_URLENCODED).build();
            httpPost.setEntity(entity);

            CloseableHttpResponse response =  httpClient.execute(httpPost, contextback);


            System.out.println("target_host  " + contextback.getAttribute(HttpCoreContext.HTTP_TARGET_HOST));
            String responseString =  EntityUtils.toString(response.getEntity());
            System.out.println(responseString);

            List<Cookie> cookies = cookieStoreBack.getCookies();
            if (cookies.isEmpty()) {
                System.out.println("None");
            } else {
                for (int i = 0; i < cookies.size(); i++) {
                    System.out.println("- " + cookies.get(i).toString());
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }catch (ParseException e2){
            e2.printStackTrace();
        }



    }
}
