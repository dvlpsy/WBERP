package com.wberp.ibk.web.hr.service;

import java.util.HashMap;
import java.util.List;

public interface IEmpMangService {

	public int getEmpMangCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getEmpMang(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getempMangDetail(HashMap<String, String> params)throws Throwable;

	public int getEmpMangDelete(HashMap<String, String> params)throws Throwable;

	public int getEmpMangUpdate(HashMap<String, String> params)throws Throwable;


}
