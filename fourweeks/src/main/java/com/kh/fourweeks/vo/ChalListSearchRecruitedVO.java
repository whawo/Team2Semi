package com.kh.fourweeks.vo;

import lombok.Data;
import lombok.ToString;
@Data
public class ChalListSearchRecruitedVO {
	
	//검색분류와 검색어
	private String type, keyword, alignType;
	
	@ToString.Include
	public int isSearch() {
		if(type == null && keyword == null && alignType == null) { //전체리스트
			return 1;
		} else if(type.equals("chal_title") && keyword.equals("")) { // 타입(전체) 키워드 없이 검색 버튼 누를시
			return 2;
		} else if(type.equals("chal_title")&& !keyword.equals("")) { // 타입(전체)+키워드 검색시
			return 3; 
		} else if(!type.equals("chal_title") && keyword.equals("")){ // 타입(주제) 키워드 없이 검색 버튼 누를시 : 메인페이지 메소드와 겹침
			return 4;
		} else { // 타입(주제) + 키워드 검색시
			return 5; // 
		}
	}
	
	//현재 페이지 번호(없을 경우 1로 설정)
	private int p = 1;
	private int size = 16;

	@ToString.Include
	public int startRow() {
		return endRow() - (size - 1);
	}
	@ToString.Include
	public int endRow() {
		return p * size;
	}
	
	//총 게시글 수
	private int count;

	//화면에 표시할 블럭 개수
	private int blockSize = 16;
	
	@ToString.Include
	public int pageCount() {
		return (count + size - 1) / size;
	}
	@ToString.Include
	public int startBlock() {
		return (p - 1) / blockSize * blockSize + 1;
	}
	@ToString.Include
	public int endBlock() {
		int value = startBlock() + blockSize - 1;
		return Math.min(value, lastBlock());
	}
	@ToString.Include
	public int prevBlock() {
		return startBlock() - 1;
	}
	@ToString.Include
	public int nextBlock() {
		return endBlock() + 1;
	}
	@ToString.Include 
	public int firstBlock() {
		return 1;
	}
	@ToString.Include
	public int lastBlock() {
		return pageCount();
	}
	@ToString.Include
	public boolean isFirst() {
		return p == 1;
	}
	@ToString.Include
	public boolean isLast() {
		return endBlock() == lastBlock();
	}
	@ToString.Include
	public boolean hasPrev() {
		return startBlock() > 1;
	}
	@ToString.Include
	public boolean hasNext() {
		return endBlock() < lastBlock();
	}
	
	@ToString.Include
	public String parameter() {
		if(isSearch() == 5 || isSearch() == 4 || isSearch() == 3) {
			return "size="+size+"&type="+type+"&keyword="+keyword+"&alignType="+alignType;
		}
		else {
			return "size="+size;
		}
	}
}
