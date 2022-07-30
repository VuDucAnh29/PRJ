/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.reCAPTCHA;

import com.google.gson.JsonObject;
import com.google.gson.stream.JsonReader;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.json.Json;


/**
 *
 * @author Admin
 */
public class ReCaptchaUtils {
    public static final String SITE_VERIFY_URL = //
			"https://www.google.com/recaptcha/api/siteverify";

	public static boolean verify(String gRecaptchaResponse) {
		if (gRecaptchaResponse == null || gRecaptchaResponse.length() == 0) {
			return false;
		}

		try {
			URL verifyUrl = new URL(SITE_VERIFY_URL);

			// Mở một kết nối (Connection) tới URL trên.
			HttpsURLConnection conn = (HttpsURLConnection) verifyUrl.openConnection();

			// Thêm các thông tin Header vào Request chuẩn bị gửi tới server.
			conn.setRequestMethod("POST");
			conn.setRequestProperty("User-Agent", "Mozilla/5.0");
			conn.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

			// Dữ liệu sẽ gửi tới Server.
			String postParams = "secret=" + Constants.SECRET_KEY //
					+ "&response=" + gRecaptchaResponse;

			// Send Request
			conn.setDoOutput(true);

			// Lấy Output Stream (Luồng đầu ra) của kết nối tới Server.
			// Ghi dữ liệu vào Output Stream, có nghĩa là gửi thông tin đến Server.
			OutputStream outStream = conn.getOutputStream();
			outStream.write(postParams.getBytes());

			outStream.flush();
			outStream.close();

			// Mã trả lời được trả về từ Server.
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode=" + responseCode);

			// Lấy Input Stream (Luồng đầu vào) của Connection
			// để đọc dữ liệu gửi đến từ Server.
			InputStream is = conn.getInputStream();

			javax.json.JsonReader jsonReader = Json.createReader(is);
			javax.json.JsonObject jsonObject = jsonReader.readObject();
			jsonReader.close();

			// ==> {"success": true}
			System.out.println("Response: " + jsonObject);

			boolean success = jsonObject.getBoolean("success");
			return success;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
