package com.sun.learn.http;

import com.sun.learn.vo.CallVo;
import org.apache.hc.client5.http.entity.EntityBuilder;
import org.apache.hc.client5.http.impl.sync.CloseableHttpClient;
import org.apache.hc.client5.http.impl.sync.HttpClients;
import org.apache.hc.client5.http.methods.CloseableHttpResponse;
import org.apache.hc.client5.http.methods.HttpUriRequest;
import org.apache.hc.client5.http.methods.RequestBuilder;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.entity.ContentType;
import org.apache.hc.core5.http.entity.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;

/**
 * Created by dongpengfei
 * Date 16/5/24
 * Time 下午2:32
 */

public class ApacheRequest {
    public static void main(String[] args){

        CloseableHttpClient closeableHttpClient = HttpClients.createDefault();

        CallVo callVo = new CallVo();
        callVo.setContent("Apache hc CALL");
        callVo.setId(111);
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            HttpEntity entry = EntityBuilder.create().setBinary(objectMapper.writeValueAsBytes(callVo)).setContentType(ContentType.APPLICATION_JSON).build();
            HttpUriRequest httpUriRequest =  RequestBuilder.post().setUri("http://localhost:8080/hello-world").setEntity(entry).build();
            CloseableHttpResponse closeableHttpResponse = closeableHttpClient.execute(httpUriRequest);
            System.out.println(EntityUtils.toString(closeableHttpResponse.getEntity()));
            closeableHttpResponse.close();
            closeableHttpClient.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }


    }
}
