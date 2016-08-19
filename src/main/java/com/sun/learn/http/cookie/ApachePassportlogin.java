package com.sun.learn.http.cookie;

import org.apache.hc.client5.http.impl.sync.CloseableHttpClient;
import org.apache.hc.client5.http.impl.sync.HttpClients;
import org.apache.hc.client5.http.methods.CloseableHttpResponse;
import org.apache.hc.client5.http.methods.HttpPost;
import org.apache.hc.client5.http.methods.HttpUriRequest;
import org.apache.hc.client5.http.methods.RequestBuilder;
import org.apache.hc.client5.http.sync.HttpClient;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.entity.EntityUtils;
import org.w3c.dom.Entity;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

/**
 * Created by dongpengfei
 * Date 16/5/25
 * Time 下午5:31
 */

public class ApachePassportlogin {
    public static void main(String[] args){
        CloseableHttpClient closeableHttpClient = HttpClients.createDefault();

//        HttpPost httpPost = new HttpPost("http://ermei-ccms.stage.fenxibao.com/web-portal/credentials?tenantId=ermei&name=admin&password=123QWEqwe");

        try {
            HttpUriRequest login = RequestBuilder.post()
                    .setUri(new URI("http://ermei-ccms.stage.fenxibao.com/web-portal/credentials"))
                    .addParameter("tenantId", "ermei")
                    .addParameter("name", "admin")
                    .addParameter("password", "123QWEqwe1")
                    .build();
          CloseableHttpResponse closeableHttpResponse =  closeableHttpClient.execute(login);
            System.out.println(closeableHttpResponse.getStatusLine());
            System.out.println(EntityUtils.toString(closeableHttpResponse.getEntity()));
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }catch (IOException e1){
            e1.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //do some thing
    }
}
