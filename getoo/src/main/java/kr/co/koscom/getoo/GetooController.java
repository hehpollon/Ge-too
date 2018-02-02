package kr.co.koscom.getoo;

import kr.co.koscom.api.*;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GetooController {
	
	@RequestMapping("/account")
	public String hello(Model model) {
		model.addAttribute("name", "getoo");
		return "account";
	}
	
	@RequestMapping("/index")
	public String index(Model model,@RequestParam("stockname") String stockname,@RequestParam("iprice") String iprice) {
		Haystack heystack = new Haystack();
		String data = heystack.getRecommend(stockname);
		model.addAttribute("stockname",stockname);
		model.addAttribute("iprice",iprice);
		
		
		if(data == "") {
			
		}else{
			JSONObject json = null;
			try {
				json = new JSONObject(data);
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String result="";
			try {
				result = json.get("data").toString();
				String[] splitted = result.split("name");
				String[] splittedNum = result.split("symbol");
				String cmpnylstSTR = "";
				
				for(int i = 0; i < 3; i++) {
					
					if(i+1 > splitted.length){
						break;
					}
					
					String singleStock = splitted[i+1].substring(3).split("\"")[0];
					String singleNum = splittedNum[i+1].substring(3, 9);
					
					String state = getFState(singleNum);
					String oprofit = state.split(",")[0];
					String nprofit = state.split(",")[1];
					String liabilities = state.split(",")[2];
					
					cmpnylstSTR+=singleStock+",";
					
					if(i==0){
						model.addAttribute("stock1", singleNum+" "+singleStock);
						model.addAttribute("stock1price", getPrice(singleNum));
						model.addAttribute("stock1date",getDate(singleNum));
						model.addAttribute("stock1oprofit", oprofit);
						model.addAttribute("stock1nprofit", nprofit);
						model.addAttribute("stock1liabilities", liabilities);
						
					}else if(i==1){
						model.addAttribute("stock2", singleNum+" "+singleStock);
						model.addAttribute("stock2price", getPrice(singleNum));
						model.addAttribute("stock2oprofit", oprofit);
						model.addAttribute("stock2nprofit", nprofit);
						model.addAttribute("stock2liabilities", liabilities);
					}else if(i==2){
						model.addAttribute("stock3", singleNum+" "+singleStock);
						model.addAttribute("stock3price", getPrice(singleNum));
						model.addAttribute("stock3oprofit", oprofit);
						model.addAttribute("stock3nprofit", nprofit);
						model.addAttribute("stock3liabilities", liabilities);
					}
				}

				model.addAttribute("cmpnylstSTR",cmpnylstSTR);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "index";
	}
	
	public String getPrice(String stockNum){
		String prices = "";

		try{
			Wavelet wev = new Wavelet();
			String priceData = wev.getPrices(stockNum);
			JSONObject jsonPrice = new JSONObject(priceData);
			
			String priceResult = jsonPrice.get("data").toString();
			String[] splittedPrice = priceResult.split("adj_close");
			
			for(int i = 0; i < splittedPrice.length-2; i++){
				String singlePrice = splittedPrice[i+2].substring(2).split(",")[0];
				prices += singlePrice+",";
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return prices;
	}
	
	public String getDate(String stockNum){
		String prices = "";

		try{
			Wavelet wev = new Wavelet();
			String priceData = wev.getPrices(stockNum);
			JSONObject jsonPrice = new JSONObject(priceData);
			
			String priceResult = jsonPrice.get("data").toString();
			String[] splittedPrice = priceResult.split("adj_close");
			String[] splittedDate = priceResult.split("timestamp");
			
			for(int i = 0; i < splittedPrice.length-2; i++){
				String singleDate = splittedDate[i+2].substring(3).split("T")[0];
				prices += "\""+singleDate+"\",";
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return prices;
		
	}
	
	public String getFState(String stockNum){
		String state = "";
		
		try{
			Bookkeeper bk = new Bookkeeper();
			String stateData = bk.getState(stockNum);
			JSONObject jsonState = new JSONObject(stateData);
			
			String stateResult = jsonState.get("data").toString();
			
			// 영업이익
			String[] splittedOProfit = stateResult.split("B800000000");
			String oProfit = splittedOProfit[1].split("value")[1].substring(2).split("}")[0];
			
			// 순이익
			String[] splittedNProfit = stateResult.split("C500011300");
			String nProfit = splittedNProfit[1].split("value")[1].substring(2).split("}")[0];
			
			// 부채
			String[] splittedLiabilities = stateResult.split("A800000000");
			String liabilitiesProfit = splittedLiabilities[1].split("value")[1].substring(2).split("}")[0];
			
			state = oProfit+","+nProfit+","+liabilitiesProfit;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return state;
	}
    
}