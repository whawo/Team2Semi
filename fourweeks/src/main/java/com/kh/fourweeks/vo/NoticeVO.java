package com.kh.fourweeks.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeVO {
	private int noticeNo;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeTime;
	private Date noticeModified;
	private String keyword;
	
	//페이징
		private int p = 1;
		private int size = 10;
		
		@ToString.Include
		public int endRow(){
			return p * size;
		}
		@ToString.Include
		public int startRow(){
			return endRow() - (size - 1);
		}
		//목록 결과 개수
		@ToString.Include
		private int count;
		
		//화면에 표시할 page block 수(default=10)
		private int blockSize = 10;
		
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
	
}
