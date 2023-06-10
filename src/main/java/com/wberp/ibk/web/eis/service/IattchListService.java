package com.wberp.ibk.web.eis.service;

import java.util.HashMap;
import java.util.List;

public interface IattchListService {


	public List<HashMap<String, String>> getattchList(HashMap<String, String> params) throws Throwable;

	public int getAttchCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getattchDetail(HashMap<String, String> params) throws Throwable;

	public void attchAdd(HashMap<String, String> params) throws Throwable;

	public int attchDelete(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, Object>> getattchQuery(HashMap<String, String> params) throws Throwable;

	public int attchUpdate(HashMap<String, String> params) throws Throwable;

	public void addEisCate(HashMap<String, String> params) throws Throwable;

	public int getcatgCnt2(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getcatgList2(HashMap<String, String> params) throws Throwable;

	public int catgDelete(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAttSelecList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAttSelecDetailList(HashMap<String, String> params) throws Throwable;
	   
	public List<HashMap<String, Object>> getTestQuery(HashMap<String, String> params) throws Throwable;
	// select만 돌아오는 결과값이 있음
	// insert update delete 는 돌아오는 결과 데이터가 없음

	public List<HashMap<String, Object>> getQuery1(HashMap<String, String> params)  throws Throwable;
	public List<HashMap<String, Object>> getQuery2(HashMap<String, String> params)  throws Throwable;
	public List<HashMap<String, Object>> getQuery3(HashMap<String, String> params)  throws Throwable;
	public List<HashMap<String, Object>> getQuery4(HashMap<String, String> params)  throws Throwable;
	public List<HashMap<String, Object>> getQuery5(HashMap<String, String> params)  throws Throwable;
	public List<HashMap<String, Object>> getQuery6(HashMap<String, String> params)  throws Throwable;
	public List<HashMap<String, Object>> getQuery7(HashMap<String, String> params)  throws Throwable;
	public List<HashMap<String, Object>> getQuery8(HashMap<String, String> params)  throws Throwable;
 
}
