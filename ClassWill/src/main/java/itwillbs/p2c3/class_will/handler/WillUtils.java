package itwillbs.p2c3.class_will.handler;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public class WillUtils {
	
	public static String checkDeleteSuccess(boolean isSuccess, Model model, String msg, boolean isClose) {
		String result = "result_process/";
		result += isSuccess ? "success" : "fail";
		model.addAttribute("msg", msg);
		if(isClose) {
			model.addAttribute("isClose", "true");
		}
		return result;
	}
	
	public static String checkDeleteSuccess(boolean isSuccess, Model model, String msg, boolean isClose, String targetURL) {
		String result = "result_process/";
		result += isSuccess ? "success" : "fail";
		model.addAttribute("msg", msg);
		if(isClose) {
			model.addAttribute("isClose", "true");
		}
		model.addAttribute("targetURL", targetURL);
		return result;
	}
}