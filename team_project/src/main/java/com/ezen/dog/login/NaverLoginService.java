package com.ezen.dog.login;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NaverLoginService {
	
	public String getAccessToken(String authorize_code) throws Throwable {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://nid.naver.com/oauth2.0/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=ubDhsR6U_ZDLZ2KMrD59");
			sb.append("&client_secret=_mLjqONPd9");
			sb.append("&redirect_uri=http://localhost:8333/dog/naverlogin");

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	
	
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://openapi.naver.com/v1/nid/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);//정보다 넘어옴
			System.out.println("result type" + result.getClass().getName()); // java.lang.String

			try {
				ObjectMapper objectMapper = new ObjectMapper();
			    // JSON String -> Map
			    Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {});
			    
			    // 응답 내부의 'response' 객체를 가져옴
			    Map<String, Object> response = (Map<String, Object>) jsonMap.get("response");
			    
			    // 'response' 객체 내부의 'nickname' 값을 가져옴
			    String name = response.get("name").toString();
			    String email = response.get("email").toString();
			    
			    // nickname 값을 확인
			    System.out.println("name: " + name);
			    System.out.println("email: " + email);
			    
			    userInfo.put("name", name);
			    userInfo.put("email", email);
			} catch (Exception e) {
			    e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
}
