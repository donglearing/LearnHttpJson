package com.sun.learn.http.cookie;

import com.google.common.collect.Lists;
import org.apache.hc.client5.http.HttpRoute;
import org.apache.hc.client5.http.config.CookieSpecs;
import org.apache.hc.client5.http.cookie.*;
import org.apache.hc.client5.http.impl.cookie.BasicClientCookie;
import org.apache.hc.client5.http.impl.cookie.IgnoreSpecProvider;
import org.apache.hc.client5.http.impl.cookie.RFC6265CookieSpecProvider;
import org.apache.hc.client5.http.impl.cookie.RFC6265LaxSpec;
import org.apache.hc.client5.http.impl.sync.CloseableHttpClient;
import org.apache.hc.client5.http.impl.sync.HttpClients;
import org.apache.hc.client5.http.methods.CloseableHttpResponse;
import org.apache.hc.client5.http.methods.HttpGet;
import org.apache.hc.client5.http.protocol.HttpClientContext;
import org.apache.hc.client5.http.protocol.RequestAddCookies;
import org.apache.hc.client5.http.protocol.ResponseProcessCookies;
import org.apache.hc.client5.http.utils.DateUtils;
import org.apache.hc.core5.http.*;
import org.apache.hc.core5.http.config.Lookup;
import org.apache.hc.core5.http.config.RegistryBuilder;
import org.apache.hc.core5.http.entity.EntityUtils;
import org.apache.hc.core5.http.message.BasicHeader;
import org.apache.hc.core5.http.message.BasicHttpRequest;
import org.apache.hc.core5.http.protocol.HttpCoreContext;

import java.io.IOException;
import java.util.List;

/**
 * Created by dongpengfei
 * Date 16/5/24
 * Time 下午4:54
 */

/**
 * Cookie:_ati=6790400974737;
 * JSESSIONID=cf269fba31ebe3610b994fa5b0bfe251c922596f;
 * tenantId=ermei; username=v;
 * userId=10010798;
 * CW_Start=1464080272882

 *
 * */
public class ApachehcCookie {
    public static void main(String[] args){


        HttpGet httpGet = new HttpGet("http://ermei-ccms.stage.fenxibao.com/web-dashboard/dashboard/assemble/shopinfo/?_=1464162039716");

//        final HttpRequest request = new BasicHttpRequest("GET", "/");

        CookieStore cookieStore = new BasicCookieStore();
        BasicClientCookie one = new BasicClientCookie("JSESSIONID", "cf269fba284ca0676a6b454c93522cbfdc84b8d2");
        one.setDomain("ermei-ccms.stage.fenxibao.com");
        one.setPath("/");
        cookieStore.addCookie(one);

        BasicClientCookie two = new BasicClientCookie("_ati", "6790400974737");
        two.setDomain("ermei-ccms.stage.fenxibao.com");
        two.setPath("/");
        cookieStore.addCookie(two);

        BasicClientCookie three = new BasicClientCookie("tenantId", "ermei");
        three.setDomain("ermei-ccms.stage.fenxibao.com");
        three.setPath("/");
        cookieStore.addCookie(three);

        BasicClientCookie foure = new BasicClientCookie("username", "admin");
        foure.setDomain("ermei-ccms.stage.fenxibao.com");
        foure.setPath("/");
        cookieStore.addCookie(foure);

        BasicClientCookie five = new BasicClientCookie("userId", "10010798");
        five.setDomain("ermei-ccms.stage.fenxibao.com");
        five.setPath("/");
        cookieStore.addCookie(five);

        BasicClientCookie six = new BasicClientCookie("CW_Start", "1464162039241");
        six.setDomain("ermei-ccms.stage.fenxibao.com");
        six.setPath("/");
        cookieStore.addCookie(six);

         HttpHost target = new HttpHost("ermei-ccms.stage.fenxibao.com", 80);
        final HttpRoute route = new HttpRoute(target, null, false);


         CookieSpecProvider laxCookiePolicyPRovider = new RFC6265CookieSpecProvider(
                RFC6265CookieSpecProvider.CompatibilityLevel.RELAXED, null);
        CookieSpecProvider strictCookiePolicyPRovider = new RFC6265CookieSpecProvider(
                RFC6265CookieSpecProvider.CompatibilityLevel.STRICT, null);
        Lookup<CookieSpecProvider> cookieSpecRegistry = RegistryBuilder.<CookieSpecProvider>create()
                .register(CookieSpecs.DEFAULT, laxCookiePolicyPRovider)
                .register(CookieSpecs.STANDARD, laxCookiePolicyPRovider)
                .register(CookieSpecs.STANDARD_STRICT, strictCookiePolicyPRovider)
                .register(CookieSpecs.IGNORE_COOKIES, new IgnoreSpecProvider())
                .build();


        HttpClientContext localContext = HttpClientContext.create();

        final HttpClientContext context = HttpClientContext.create();
        context.setAttribute(HttpCoreContext.HTTP_TARGET_HOST, target);
        context.setAttribute(HttpClientContext.HTTP_ROUTE, route);
        context.setAttribute(HttpClientContext.COOKIE_STORE, cookieStore);
        context.setAttribute(HttpClientContext.COOKIESPEC_REGISTRY, cookieSpecRegistry);
//        localContext.setCookieStore(cookieStore);
//        final Header[] hdrs = new Header[] {
//                new BasicHeader("Accept", "application/json, text/plain, */*"),
//                new BasicHeader("Accept-Encoding", "gzip, deflate, sdch"),
//                new BasicHeader("Accept-Language", "h-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4"),
//                new BasicHeader("Connection", "keep-alive"),
//                new BasicHeader("Cookie", "_ati=6790400974737"),
//                new BasicHeader("Cookie", "JSESSIONID=cf269fba217e7dbf86714032963c990facdc66d5"),
//                new BasicHeader("Cookie", "tenantId=ermei"),
//                new BasicHeader("Cookie", "username=admin"),
//                new BasicHeader("Cookie", "userId=10010798"),
//                new BasicHeader("Cookie", "isLogin=admin"),
//                new BasicHeader("Cookie", "CW_Start=1464158279621"),
//                new BasicHeader("Host ", "ermei-ccms.stage.fenxibao.com"),
//                new BasicHeader("User-Agent ", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36"),
//                new BasicHeader("Referer", "http://ermei-ccms.stage.fenxibao.com/ccms/modules/dashboard/index.html")
//        };

        final HttpRequestInterceptor interceptor = new RequestAddCookies();
        try {
            interceptor.process(httpGet, context);
            final Header[] headers = httpGet.getHeaders("Cookie");

            List<Header>  listHead = Lists.newArrayList(headers);
            listHead.stream().forEach((p) -> System.out.println(p.getName() + "    " + p.getValue()));
        } catch (HttpException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


        BasicCookieStore cookieStoreBack = new BasicCookieStore();
        cookieStoreBack.getCookies().stream().forEach((p) -> System.out.println(p.getName() + " ==   BAKC  ==  " + p.getValue()));

        CloseableHttpClient closeableHttpClient = HttpClients.createDefault();


//        /**
//         *
//         *
//         * Accept:application/json, text/plain, */*
//        Accept-Encoding:gzip, deflate, sdch
//        Accept-Language:zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4
//        Connection:keep-alive
//        Cookie:_ati=6790400974737; JSESSIONID=cf269fba217e7dbf86714032963c990facdc66d5; tenantId=ermei; username=admin; userId=10010798; isLogin=admin; CW_Start=1464158279621
//        Host:ermei-ccms.stage.fenxibao.com
//        Referer:http://ermei-ccms.stage.fenxibao.com/ccms/modules/dashboard/index.html
//        User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36
//         * */



//        httpGet.setHeaders(hdrs);
//        closeableHttpClient

        final HttpClientContext contextback = HttpClientContext.create();
        contextback.setCookieStore(cookieStoreBack);

//        CookieOrigin cookieOrigin = new CookieOrigin("ermei-ccms.stage.fenxibao.com", 80, "/", false);
//        CookieSpec cookieSpec = new RFC6265LaxSpec();
//        contextback.setAttribute(HttpClientContext.COOKIE_ORIGIN, cookieOrigin);
//        contextback.setAttribute(HttpClientContext.COOKIE_SPEC, cookieSpec);
//        contextback.setAttribute(HttpClientContext.COOKIE_STORE, cookieStoreBack);

        System.out.println("Executing request " + httpGet.getRequestLine());
//        final HttpClientContext contextback = HttpClientContext.create();

        try {
            HttpResponse Response = closeableHttpClient.execute(httpGet, contextback);
            final HttpResponseInterceptor responseProcessCookies = new ResponseProcessCookies();
//            try {
//                responseProcessCookies.process(closeableHttpResponse, contextback);
//            } catch (HttpException e) {
//                e.printStackTrace();
//            }

            cookieStoreBack.getCookies().stream().forEach((p) -> System.out.println(p.getName() + " ==   BAKC111  ==  " + p.getValue()));
            System.out.println("---------------------------------------------");
            System.out.println(Response.getStatusLine());
            System.out.println(EntityUtils.toString(Response.getEntity()));

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
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }
}
