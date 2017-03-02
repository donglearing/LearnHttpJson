package com.sun.learn.json;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import redis.clients.ccms.ByteJedisCluster;
import redis.clients.jedis.*;

import java.util.*;

/**
 * Created by dongpengfei
 * Date 16/5/20
 * Time 下午4:08
 */

public class LearningJson {
    public static void main(String[] args){

//        String redisHosts = "172.18.21.211, 172.18.21.211,172.18.21.211";
//        String redisPorts = "7001,7002,7003";

        String redisHosts = "127.0.0.1,127.0.0.1,127.0.0.1";
        String redisPorts = "7000,7001,7002";
        String[] hosts=redisHosts.split(",");
        String[] ports=redisPorts.split(",");
        if(hosts.length!=ports.length){
            throw new IllegalArgumentException("配置错误，redisHosts与redisPorts数量不匹配");
        }
        Set<HostAndPort> nodes = new HashSet<HostAndPort>();
        for(int i=0;i<hosts.length;i++){
            nodes.add(new HostAndPort(hosts[i],Integer.parseInt(ports[i])));
        }
        GenericObjectPoolConfig config=new GenericObjectPoolConfig();
        config.setMaxTotal(20);
        config.setMaxIdle(8);
        config.setMinIdle(0);
        config.setBlockWhenExhausted(true);
        config.setMaxWaitMillis(1000*10);
        ByteJedisCluster redisstore= new ByteJedisCluster(nodes,config,"GU94diLR");
        // redis 设置密码
//        redisstore.auth("GU94diLR");
//        redisstore
        for(int i =1; i < 10000; i ++){
            redisstore.set("dongpf" + i,"dongpfXXXXX" + i);

        }
        redisstore.set("dongpf","dongpfXXXXX");
        System.out.println(redisstore.get("dongpf"));

//        List<JedisShardInfo> shards = new ArrayList<JedisShardInfo>();
//        for(HostAndPort hap : nodes){
//            JedisShardInfo jedisShardInfo = new JedisShardInfo(hap.getHost(), hap.getPort());
////            jedisShardInfo.setPassword("GU94diLR");
//            shards.add(jedisShardInfo);
//        }
//
//        ShardedJedisPool pool = new ShardedJedisPool(config, shards);
//
//        ShardedJedis one = pool.getResource();
//
////        JedisCluster jc = new JedisCluster(jedisClusterNodes);
//
//
//        long start = System.currentTimeMillis();
//        for (int i = 0; i < 2; i++) {
//            String result = one.set("spn" + i, "n" + i);
//        }
//        long end = System.currentTimeMillis();
//        pool.returnResource(one);
//        System.out.println("Simple@Pool SET: " + ((end - start)/1000.0) + " seconds");
//
//        pool.destroy();


        // 生成多机连接信息列表
//        List<JedisShardInfo> shards = new ArrayList<JedisShardInfo>();
//        for(HostAndPort hap : nodes){
//            System.out.println(hap.getPort());
//            JedisShardInfo jedisShardInfo = new JedisShardInfo(hap.getHost(), hap.getPort());
//            jedisShardInfo.setPassword("GU94diLR");
//            shards.add(jedisShardInfo);
////            Jedis j = new Jedis(jedisShardInfo);
////            j.connect();
////            j.flushAll();
////            j.disconnect();
//        }

//        shards = new ArrayList<JedisShardInfo>();
//        shards.add(new JedisShardInfo(redis1.getHost(), redis1.getPort()));
//        shards.add(new JedisShardInfo(redis2.getHost(), redis2.getPort()));
//        shards.get(0).setPassword("foobared");
//        shards.get(1).setPassword("foobared");
//        Jedis j = new Jedis(shards.get(0));
//        j.connect();
//        j.flushAll();
//        j.disconnect();
//        j = new Jedis(shards.get(1));
//        j.connect();
//        j.flushAll();
//        j.disconnect();

// 生成连接池配置信息
//        JedisPoolConfig config = new JedisPoolConfig();
//        config.setMaxIdle(10);
//        config.setMaxTotal(30);
//        config.setMaxWaitMillis(3*1000);

// 在应用初始化的时候生成连接池
//        JedisPoolConfig config = new JedisPoolConfig();
//        config.setMaxIdle(10);
//        config.setMaxTotal(30);
//        config.setMaxWaitMillis(3*1000);

//        ShardedJedisPool pool = new ShardedJedisPool(new GenericObjectPoolConfig() , shards);
//
//// 在业务操作时，从连接池获取连接
//        ShardedJedis client = pool.getResource();
//        try {
//            // 执行指令
//            for(int i = 0; i < 1000; i ++){
//                System.out.println(i);
//                String result = client.set("ccms" + i , "pengfei" + i);
//            }
//
////            System.out.println( String.format("set指令执行结果:%s", result) );
//            String value = client.get("ccms1");
//
//            System.out.println( String.format("get指令执行结果:%s", value) );
//        } catch (Exception e) {
//            e.printStackTrace();
//            // TODO: handle exception
//        } finally {
//            // 业务操作完成，将连接返回给连接池
//            if (null != client) {
//                pool.returnResource(client);
//            }
//        } // end of try block
//
//// 应用关闭时，释放连接池资源
//        pool.destroy();



    }

}
