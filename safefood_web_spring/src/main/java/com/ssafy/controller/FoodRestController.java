//package com.ssafy.controller;
//
//import java.util.Arrays;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.ssafy.model.dto.Food;
//import com.ssafy.model.service.FoodService;
//
//import io.swagger.annotations.ApiOperation;
//
///**
// * 
// * @RestController
// * REST Ful 서비스를 위한 컨트롤러로 @ResponseBody 어노테이션을 추가하지 않아도
// * 기본적으로 직접 출력 해 준다.
// * 
// */
//@RestController
//public class FoodRestController {
//	@Autowired
//	private FoodService service;
//	
//	@ExceptionHandler
//	public ResponseEntity<Map<String, Object>> handle(Exception e){
//		return handleFail(e.getMessage(), HttpStatus.OK);
//	}
//	
//	@ApiOperation("전체 Product목록을 조회하는 기능")
//	@GetMapping("/product/productList")
//	public ResponseEntity<Map<String, Object>> products(){
//		List<Food> list = service.selectAll();
//		return handleSuccess(list);
//	}
//	
//	@ApiOperation("모델 번호에 해당하는 핸드폰 정보 조회하는 기능")
//	@GetMapping("/product/{id}")
//	public ResponseEntity<Map<String, Object>> product(@PathVariable String id){
//		return handleSuccess(service.select(id));
// 	}
//	
//	@PostMapping("/product")
//	@ApiOperation("product 정보 등록")
//	public ResponseEntity<Map<String, Object>> insert(@RequestBody Product product){
//		service.insert(product);
//		return handleSuccess("등록완료");
//	}
//	
//	@DeleteMapping("/product/{id}")
//	@ApiOperation("product 정보 삭제")
//	public ResponseEntity<Map<String, Object>> delete(@PathVariable String id){
//		service.delete(id);
//		return handleSuccess("삭제 완료");
//	}
//	
//	@PutMapping("/product/{id}")
//	@ApiOperation("product 정보 수정")
//	public ResponseEntity<Map<String, Object>> update(@PathVariable Product product){
//		service.update(product);
//		return handleSuccess("수정 완료");
//	}
//	
//	public ResponseEntity<Map<String, Object>> handleFail(Object data, HttpStatus state){
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("state",  "fail");
//		resultMap.put("data", data);
//		return new ResponseEntity<Map<String, Object>>(resultMap, state);
//	}
//	
//	public ResponseEntity<Map<String, Object>> handleSuccess(Object data){
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("state",  "ok");
//		resultMap.put("data", data);
//		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
//	}
//}
