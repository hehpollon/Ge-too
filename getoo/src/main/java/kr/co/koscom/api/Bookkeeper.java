package kr.co.koscom.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Bookkeeper {
	public String getState(String stockNum){
		try{
			StringBuilder urlBuilder = new StringBuilder("https://sandbox-apigw.koscom.co.kr/v1/bookkeeper/fs/ifrs/{issuecode}".replace("{issuecode}", URLEncoder.encode(stockNum, "UTF-8")));
	        urlBuilder.append("?");
	        urlBuilder.append(URLEncoder.encode("max_depth","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8") + "&");
	        urlBuilder.append(URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode("2017-01-01", "UTF-8") + "&");
	        urlBuilder.append(URLEncoder.encode("apikey","UTF-8") + "=" + URLEncoder.encode("l7xxb8f91f1d0b9545998245636e0e1506c1", "UTF-8"));
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        return sb.toString();
		}catch(Exception e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
}