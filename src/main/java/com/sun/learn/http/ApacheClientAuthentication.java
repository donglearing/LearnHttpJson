package com.sun.learn.http;

import org.apache.hc.client5.http.auth.AuthScope;
import org.apache.hc.client5.http.auth.UsernamePasswordCredentials;
import org.apache.hc.client5.http.impl.sync.BasicCredentialsProvider;
import org.apache.hc.client5.http.impl.sync.CloseableHttpClient;
import org.apache.hc.client5.http.impl.sync.HttpClients;
import org.apache.hc.client5.http.methods.CloseableHttpResponse;
import org.apache.hc.client5.http.methods.HttpGet;
import org.apache.hc.core5.http.entity.EntityUtils;

import java.net.URI;

/**
 * Created by dongpengfei
 * Date 16/5/24
 * Time 上午11:43
 */

public class ApacheClientAuthentication {
    public static void main(String[] args){
        BasicCredentialsProvider credsProvider = new BasicCredentialsProvider();
        credsProvider.setCredentials(
                new AuthScope("marathon.stage.fenxibao.com", 80),
                new UsernamePasswordCredentials("shuyunmrt", "Data123321".toCharArray()));
        CloseableHttpClient httpClient = HttpClients.custom().setDefaultCredentialsProvider(credsProvider).build();
        HttpGet httpGet = new HttpGet();
        try {
        httpGet.setURI(new URI("http://marathon.stage.fenxibao.com/ui/#/apps"));
        System.out.println("Executing request " + httpGet.getRequestLine());

            CloseableHttpResponse response = httpClient.execute(httpGet);
            System.out.println("----------------------------------------");
            System.out.println(response.getStatusLine());
            System.out.println(EntityUtils.toString(response.getEntity()));
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
