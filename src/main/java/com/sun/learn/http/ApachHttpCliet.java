package com.sun.learn.http;

import com.google.common.collect.Lists;
import com.sun.learn.vo.JsonTest;
import org.apache.hc.client5.http.impl.sync.CloseableHttpClient;
import org.apache.hc.client5.http.impl.sync.HttpClients;
import org.apache.hc.client5.http.methods.CloseableHttpResponse;
import org.apache.hc.client5.http.methods.HttpGet;
import org.apache.hc.core5.http.Header;
import org.apache.hc.core5.http.entity.EntityUtils;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.util.List;

/**
 * Created by dongpengfei
 * Date 16/5/23
 * Time 下午3:16
 */

public class ApachHttpCliet {
    public static void main(String[] args){
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpget = new HttpGet("http://localhost:8080/hello-world?name=dongpengfei");
        try {
            CloseableHttpResponse response = httpclient.execute(httpget);
            System.out.println(response.getStatusLine().toString());
            System.out.println(response.getStatusLine().getStatusCode());
            List<Header> headerList = Lists.newArrayList(response.getAllHeaders());
            headerList.stream().forEach((p) -> System.out.println(p.getName()  + "|| " + p.getValue()));
            System.out.println(response.getCode());
            System.out.println(response.getFirstHeader("Date"));
            System.out.println(response.getLocale().getDisplayCountry());
            System.out.println(response.getProtocolVersion().toString());
            System.out.println(response.getStatusLine().getReasonPhrase());
//            System.out.println(EntityUtils.toString(response.getEntity()));
            String responseString =  EntityUtils.toString(response.getEntity());

//            ObjectMapper objectMapper = new CustomObjectMapper();
            ObjectMapper mapper = new ObjectMapper();
            mapper.configure(JsonParser.Feature.ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER, true);

            JsonTest testOne = mapper.readValue(responseString.getBytes(), JsonTest.class);
            System.out.println(testOne.getContent());




        }catch (Exception e1){
            System.out.println("出现错误");
            e1.printStackTrace();
        }

    }
}
