package com.kedu.arias.util;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import java.util.Arrays;
import java.util.List;

public class JsonManager {

	private static JsonManager instance = null;
	private JsonManager(){
	}
	public static JsonManager getInstance(){
		if(instance==null)
			instance=new JsonManager();

		return instance;
	}

	//List를 JsonArray로 변환
	public JsonArray listToJsonArray(List list){
		return new Gson().toJsonTree(list, new TypeToken<List>() {}.getType()).getAsJsonArray();
	}



	public <T> List<T> jsonStringToList(String gsonString, Class<T[]> cls) {
		T[] arr = new Gson().fromJson(gsonString, cls);
		return Arrays.asList(arr);
	}


	//인스턴스를 JsonObject로 변환
	public JsonObject instanceToJsonObject(Object object){
		return new JsonParser().parse(new Gson().toJson(object)).getAsJsonObject();
	}
	//인스턴스를 JsonString으로 변환
	public String instanceToJsonString(Object object){
		return new Gson().toJson(object);
	}

	//json을 Instance로 변환
	public Object jsonStringToInstance(String json,Class<?> c){
		return new Gson().fromJson(json, c);
	}

}