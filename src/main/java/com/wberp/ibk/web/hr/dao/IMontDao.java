package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IMontDao {

	public int getMontCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMontList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMont(HashMap<String, String> params) throws Throwable;

	public void montUpdate(HashMap<String, String> params) throws Throwable;

	public void montTest() throws Throwable;

	public String date(HashMap<String, String> params);

	public String sal(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCodeList(HashMap<String, String> params) throws Throwable;

	public int getMontDetailCnt(HashMap<String, String> params) throws Throwable;
}
