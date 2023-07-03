package com.kosa.scheduleManagement.kanban;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.amazonaws.util.json.JSONException;
import com.amazonaws.util.json.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kosa.scheduleManagement.global.dto.Emp;
import com.kosa.scheduleManagement.global.dto.Project_Emp;
import com.kosa.scheduleManagement.global.dto.Schedule;
import com.kosa.scheduleManagement.global.dto.ScheduleBoard;
import com.kosa.scheduleManagement.global.dto.Schedule_Board;

import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;

@RestController
public class KanbanAjaxController {
	KanbanAjaxController() {
		/* System.out.println("AjaxController constructor controller"); */
	}

	private ScheduleService service;

	@Autowired
	public void setService(ScheduleService service) {
		this.service = service;
	}

	@ResponseBody
	@RequestMapping("/scheduleUpdate.ajax")
	public void updatePrev(String data) throws JSONException, ParseException, JsonMappingException,
			JsonProcessingException, ClassNotFoundException, SQLException {
		System.out.println("prev  conrtroollerrrrr -----------------------------------");
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(data);
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
			String sched_info = object.get("sched_info").getAsString();
			int sched_seq = Integer.parseInt(object.get("sched_seq").getAsString());
			int sched_num = Integer.parseInt(object.get("sched_num").getAsString());
			System.out.println("controller val: " + sched_info + ", " + sched_seq + ", " + sched_num);
			service.updatePrev(sched_num, sched_seq, sched_info);
		}
	}
	
	
////////////////////////////////////////////////
 

	@ResponseBody
	@RequestMapping("/scheduleCurrUpdate.ajax")
	public void updateCurr(String data) throws JSONException, ParseException, JsonMappingException,
			JsonProcessingException, ClassNotFoundException, SQLException {
		System.out.println("currrrr    conrtroollerrrrr -----------------------------------");
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(data);
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
			String sched_info = object.get("sched_info").getAsString();
			int sched_seq = Integer.parseInt(object.get("sched_seq").getAsString());
			int sched_num = Integer.parseInt(object.get("sched_num").getAsString());
			System.out.println("controller val: " + sched_info + ", " + sched_seq + ", " + sched_num);
			service.updateCurr(sched_num, sched_seq, sched_info);
		}
	}
	@ResponseBody
	@RequestMapping("/scheduleNextUpdate.ajax")
	public void updateNext(String data) throws JSONException, ParseException, JsonMappingException,
	JsonProcessingException, ClassNotFoundException, SQLException {
		System.out.println("next   conrtroollerrrrr -----------------------------------");
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(data);
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
			String sched_info = object.get("sched_info").getAsString();
			int sched_seq = Integer.parseInt(object.get("sched_seq").getAsString());
			int sched_num = Integer.parseInt(object.get("sched_num").getAsString());
			System.out.println("next --------------------------------controller val: " + sched_info + ", " + sched_seq + ", " + sched_num);
			service.updateNext(sched_num, sched_seq, sched_info);
		}
	}

 
	/*
	 * JSONArray jsonArr = new JSONArray(); ObjectMapper mapper = new
	 * ObjectMapper(); jsonArr = mapper.readValue(data, JSONArray.class);
	 * 
	 * for (int i = 0; i < jsonArr.size(); i++) {
	 * System.out.println(jsonArr.get(i)); } JsonParser jsonParser = new
	 * JsonParser(); JsonArray jsonArray = (JsonArray) jsonParser.parse(data); for
	 * (int i = 0; i < jsonArray.size(); i++) { JsonObject object = (JsonObject)
	 * jsonArray.get(i); // int NO = object.get("sched_seq").getAsInt(); String
	 * sched_info = object.get("sched_info").getAsString(); String sched_seq =
	 * object.get("sched_seq").getAsString();
	 * System.out.println("sched_info:"+sched_info);
	 * System.out.println("sched_seq:"+sched_seq);
	 */

	/*
	 * JSONObject jObject = new JSONObject(jsonArr.get(0)); String title2 =
	 * jObject.getString("sched_info"); System.out.println(title2);
	 */

	/*
	 * JSONParser jsonParser = new JSONParser((String) jsonArr.get(0)); // 3. To
	 * Object Object obj = jsonParser.parse(); // 4. To JsonObject JSONObject
	 * jsonObj = (JSONObject) obj;
	 * 
	 * System.out.println(jsonParser); System.out.println(jsonObj);
	 * 
	 * try { // JSONArray 타입으로 파싱 jsonArr = mapper.readValue(data, JSONArray.class);
	 * } catch (JsonProcessingException e) { e.printStackTrace(); }
	 * 
	 * System.out.println("jsonArra"); for(int i=0; i<jsonArr.size();i++) {
	 * System.out.println(jsonArr.get(i)); }
	 */

	/*
	 * @RequestMapping(method = RequestMethod.POST, produces = "application/json")
	 * public void updaterInfo(@RequestParam Map<String, Object> paramMap) throws
	 * Exception { String jsonData = paramMap.get("list").toString(); JSONParser
	 * parser = new JSONParser(jsonData); System.out.println(parser); // Object obj
	 * = parser.parse(jsonData);
	 * 
	 * // paramMap.put("list", obj); }
	 */

	/*
	 * @RequestMapping(path = "/scheduleUpdate.ajax") public @ResponseBody Object
	 * callCenterResend(@RequestParam String jsonData) {
	 * 
	 * Map<String, Object> result = new HashMap<String, Object>(); Map<String,
	 * Object> paramMap = new HashMap<String, Object>();
	 * 
	 * // 직렬화 시켜 가져온 오브젝트 배열을 JSONArray 형식으로 바꿔준다. JSONArray array =
	 * JSONArray.fromObject(jsonData);
	 * 
	 * List<Map<String, Object>> resendList = new ArrayList<Map<String, Object>>();
	 * 
	 * for (int i = 0; i < array.size(); i++) { // JSONArray 형태의 값을 가져와 JSONObject 로
	 * 풀어준다. JSONObject obj = (JSONObject) array.get(i);
	 * 
	 * Map<String, Object> resendMap = new HashMap<String, Object>();
	 * System.out.println(obj);
	 * 
	 * resendMap.put("sched_seq", obj.get("sched_seq")); resendMap.put("sched_info",
	 * obj.get("sched_info"));
	 * 
	 * resendList.add(resendMap); } // paramMap.put("resendList", resendList);
	 * 
	 * // int cnt = callCenterService.callCenterResend(paramMap);
	 * 
	 * result.put("result", "success"); // result.put("cnt", cnt);
	 * 
	 * return result; }
	 */

	/*
	 * @RequestMapping(path = "/scheduleUpdate.ajax")
	 * 
	 * @ResponseBody public Map<String, Object> progUpdate(@RequestParam String
	 * data){
	 * System.out.println("controlleerrrrr connneecctttionn--------------------");
	 * Map<String, Object> result = new HashMap<>(); try { JSONArray jsonArray =
	 * JSONArray.fromObject(paramData); List<Map<String,Object>> info = new
	 * ArrayList<Map<String,Object>>(); System.err.println(data); for (Map<String,
	 * Object> memberInfo : info) { System.out.println(memberInfo.get("memberNo") +
	 * " : " + memberInfo.get("name")); } result.put("result", true); } catch
	 * (Exception e) { result.put("result", false); } return result;
	 * 
	 * }
	 */
	/*
	 * @RequestMapping(value = "/scheduleUpdate.ajax", method = { RequestMethod.POST
	 * }) public void progUpdate(@RequestParam("sched_seq") int
	 * sched_seq, @RequestParam("sched_info") String sched_info) throws
	 * ClassNotFoundException, SQLException { System.out.println(sched_seq);
	 * System.out.println(sched_info);
	 * 
	 * //service.progUpdate(sched_seq, sched_info ); }
	 */
	

	@RequestMapping(value = "/scheduleDel.ajax", method = { RequestMethod.POST })
	public void deleteBoard(@RequestParam("sched_num") String sched_num) throws ClassNotFoundException, SQLException {
		service.deleteBoard(Integer.parseInt(sched_num));
	}

	@RequestMapping(value = "/scheduleAdd.ajax", method = { RequestMethod.POST })
	public void scheduleAdd(@RequestParam("ename") String ename, @RequestParam("project_num") String project_num,
			@RequestParam("sched_info") String sched_info) throws ClassNotFoundException, SQLException {
		/*
		 * System.out.println(ename); System.out.println(project_num);
		 * System.out.println(sched_info);
		 */

		int user_id = service.getUseridByEname(ename);
//		System.out.println(user_id);

		ScheduleBoard board = new ScheduleBoard(0, sched_info, 0, 0, 8);
		Schedule schedule = new Schedule(user_id, 8);

		service.insertBoard(board);
		service.insertSchedule(schedule);

		// System.out.println("controller schedule val: "+schedule);

//		service.insertBoard(sched_info);
// 		service.insertSchedule(userId);
	}

	// string 으로 임시 변환 상태 --> emp ;service mapper interface
	@RequestMapping(value = "/projectEnamelist.ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getEmpListByProject() throws ClassNotFoundException, SQLException {
		System.out.println("projectemplist controller connection");
		List<String> list = service.getEmpListByProject();
		System.out.println("list: " + list);
		return list;
	}

	@RequestMapping(value = "/allList.ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<ScheduleBoard> getAllList() throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist connection");
		List<ScheduleBoard> list = service.getAllList();
		System.out.println("list: " + list.toString());
		return list;
	}

	/*
	 * @RequestMapping(value = "/ajadd.ajax") public ResponseEntity<String> insert()
	 * { try { // service.insert(emp); return new
	 * ResponseEntity<String>("insert sucess", HttpStatus.OK); } catch (Exception e)
	 * { return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST); }
	 * }
	 */

	/*
	 * @RequestMapping(value = "/add.ajax") public ResponseEntity<String>
	 * insert(@RequestBody ScheduleBoard board, HttpServletRequest request) {
	 * System.out.println("board:" + board);
	 * 
	 * // userid에 대한 값 같이 받아와서 // schedule로 전달필요 try { //
	 * service.insertBoard(board); // service.insertSchedule(null); return new
	 * ResponseEntity<String>("insert sucess", HttpStatus.OK); } catch (Exception e)
	 * { return new ResponseEntity<String>("insert fail", HttpStatus.BAD_REQUEST); }
	 * }
	 */

	/*
	 * @RequestMapping(value = "/addtest.ajax", method = { RequestMethod.POST })
	 * public void test(@RequestBody ScheduleBoard board) throws Exception {
	 * System.out.println("board print : " + board); }
	 */

	/*
	 * @RequestMapping(value = "/projectemplist.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<String> getEmpAndProjectEmpList() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("empproalllist---- controller connection"); List<String>
	 * list = service.getEmpAndProjectEmpList(); System.out.println("list: " +
	 * list); return list; }
	 */

	/*
	 * @RequestMapping(value = "/projectemplist.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<Emp> getEmpListByProject() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("projectemplist controller connection"); List<Emp> list =
	 * service.getEmpListByProject(); System.out.println("list: " + list); return
	 * list; }
	 */

	/*
	 * @RequestMapping(value = "/tt.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<Project_Emp> getEmpList() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("ajax EMPPPPPPPPPPPPPP list connection");
	 * List<Project_Emp> list = service.getAllProjectEmpList(); return list; }
	 */

	/*
	 * @RequestMapping(value = "/emplist.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public List<Project_Emp> empList() throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("ajaxlist connection"); List<Project_Emp> list =
	 * service.getAllProjectEmpList(); return list; }
	 */

	/*
	 * @RequestMapping(value = "/add.ajax", method = RequestMethod.POST, consumes =
	 * "application/json;") public void insertBoard(@RequestBody ScheduleBoard
	 * board) throws ClassNotFoundException, SQLException {
	 * System.out.println("------------ajaxlist insert connection-----------");
	 * System.out.println("service board print" + board);
	 * service.insertBoard(board); }
	 */
	/*
	 * @RequestMapping(value = "/insert.ajax", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public void insertBoard(ScheduleBoard board) throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("ajaxlist insert connection"); service.insertBoard(board);
	 * }
	 */

	public List<Map<String, Object>> getScheduleMap(@RequestBody List<Map<String, Object>> param) {

		return param;
	}

	@RequestMapping(value = "/listPrev.ajax", method = RequestMethod.POST)
	@ResponseBody
	public List<ScheduleBoard> getAllPrev() throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist connection");
		List<ScheduleBoard> list = service.getAllPrev();
		System.out.println("list: " + list);
		return list;
	}

	@RequestMapping(value = "/listCurr.ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<ScheduleBoard> getAllCurr() throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist connection");
		List<ScheduleBoard> list = service.getAllNext();
		System.out.println("list: " + list);
		return list;
	}

	@RequestMapping(value = "/listNext.ajax", method = RequestMethod.GET)
	@ResponseBody
	public List<ScheduleBoard> getAllNext() throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist connection");
		List<ScheduleBoard> list = service.getAllNext();
		System.out.println("list: " + list);
		return list;
	}

	@RequestMapping(value = "/update.ajax", method = RequestMethod.POST)
	@ResponseBody
	public void updateSave(ScheduleBoard board) throws ClassNotFoundException, SQLException {
		System.out.println("ajaxlist update connection");
		service.updateSave(board);
	}

	/*
	 * @RequestMapping(value = "/delete.ajax", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public void deleteBoard(ScheduleBoard board) throws
	 * ClassNotFoundException, SQLException {
	 * System.out.println("delete connection"); service.deleteBoard(board); }
	 */
}
