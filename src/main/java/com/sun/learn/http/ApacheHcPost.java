package com.sun.learn.http;

import com.sun.learn.vo.CallVo;
import org.apache.hc.client5.http.entity.EntityBuilder;
import org.apache.hc.client5.http.impl.sync.CloseableHttpClient;
import org.apache.hc.client5.http.impl.sync.HttpClients;
import org.apache.hc.client5.http.methods.CloseableHttpResponse;
import org.apache.hc.client5.http.methods.HttpPost;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.entity.ContentType;
import org.apache.hc.core5.http.entity.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;

/**
 * Created by dongpengfei
 * Date 16/5/24
 * Time 上午10:14
 */

public class ApacheHcPost {
    public static void main(String[] args){
        CloseableHttpClient httpClient = HttpClients.createDefault();

        HttpPost httpPost = new HttpPost("http://localhost:8080/hello-world");

        CallVo callVo = new CallVo();
        callVo.setContent("Apache hc CALL");
        callVo.setId(111);

        ObjectMapper objectMapper = new ObjectMapper();

        try {
            HttpEntity entity = EntityBuilder.create().setBinary(objectMapper.writeValueAsBytes(callVo)).
                    setContentType(ContentType.APPLICATION_JSON).build();
            httpPost.setEntity(entity);
            CloseableHttpResponse response =  httpClient.execute(httpPost);

            String responseString =  EntityUtils.toString(response.getEntity());
            System.out.println("字符串 --> " + responseString);
            CallVo cc = objectMapper.readValue(responseString.getBytes(), CallVo.class);
            System.out.println(cc.getContent());

        } catch (IOException e) {
            e.printStackTrace();
        }catch (ParseException e2){
            e2.printStackTrace();
        }


    }
}
