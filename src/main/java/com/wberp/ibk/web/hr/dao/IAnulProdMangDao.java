package com.wberp.ibk.web.hr.dao;

import java.util.HashMap;
import java.util.List;

public interface IAnulProdMangDao {

	public int getAnulProdCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAnulProdList(HashMap<String, String> params) throws Throwable;

	public int anulProdUpdate(HashMap<String, String> params) throws Throwable;


}
