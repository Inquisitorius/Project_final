package com.zerock.test.dto;

public class ServerInfoDTO 
{
	private String date;
	private String time;
	
	//proces
	private int proces_ProcessCnt;
	private int proces_IOwait;
	
	//memory
	private int swpd; //사용된 가상 메모리의 용량
	private int free; //사용가능한 여유 메모리 용량
	private int buffer;//사용된 버퍼 메모리 총량
	private int cache;//사용된 페이지케시 메모리
	
	//swap
	private int si; //swap-in 메모리의 양 kb
	private int so; //swap-out 메모리양 ! 지속적으로 발생시 메모리 부족 의심
	
	//IO
	private int bi; // 블록 디바이스로부터 입력 블록수
	private int bo; // 블록 디바이스에 쓰기 블록수
	
	//system
	private int in; // 초당 발생한 interrupts
	private int cs; // 초당 발생한 문맥교환수
	
	//cpu
	private int us; //cpu가 사용자 수준 코드를 실행한 시간
	private int sy; // cput 가 시스템 수준 코드를 실행한 시간
	private int id; //idel 시간!
	private int wa; //IO WAIT TIME
	private int st; //?
	
	public int getSt() {
		return st;
	}

	public void setSt(int st) {
		this.st = st;
	}

	public ServerInfoDTO()
	{
		
	}
	
	public void PrintDTO()
	{
		System.out.println("DATE : " + this.date);
		System.out.println("Time : " + this.time);
		
		System.out.println("proces_ProcessCnt : " + this.proces_ProcessCnt);
		System.out.println("proces_IOwait : " + this.proces_IOwait);
		
		System.out.println("swpd : " + this.swpd);
		System.out.println("free : " + this.free);
		System.out.println("buffer : " + this.buffer);
		System.out.println("cache : " + this.cache);
		System.out.println("si : " + this.si);
		System.out.println("so : " + this.so);
		System.out.println("bi : " + this.bi);
		System.out.println("bo : " + this.bo);
		
		System.out.println("in : " + this.in);
		System.out.println("cs : " + this.cs);
		System.out.println("us : " + this.us);
		System.out.println("sy : " + this.sy);
		System.out.println("id : " + this.id);
		System.out.println("wa : " + this.wa);
		System.out.println("st : " + this.st);
		
	}
	
	public ServerInfoDTO(String date, String time, int proces_ProcessCnt, int proces_IOwait, int swpd, int free,
			int buffer, int cache, int si, int so, int bi, int bo, int in, int cs, int us, int sy, int id, int wa, int st) {
		super();
		this.date = date;
		this.time = time;
		this.proces_ProcessCnt = proces_ProcessCnt;
		this.proces_IOwait = proces_IOwait;
		this.swpd = swpd;
		this.free = free;
		this.buffer = buffer;
		this.cache = cache;
		this.si = si;
		this.so = so;
		this.bi = bi;
		this.bo = bo;
		
		this.in = in;
		this.cs = cs;
		this.us = us;
		this.sy = sy;
		this.id = id;
		this.wa = wa;
		this.st = st;
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getProces_ProcessCnt() {
		return proces_ProcessCnt;
	}
	public void setProces_ProcessCnt(int proces_ProcessCnt) {
		this.proces_ProcessCnt = proces_ProcessCnt;
	}
	public int getProces_IOwait() {
		return proces_IOwait;
	}
	public void setProces_IOwait(int proces_IOwait) {
		this.proces_IOwait = proces_IOwait;
	}
	public int getSwpd() {
		return swpd;
	}
	public void setSwpd(int swpd) {
		this.swpd = swpd;
	}
	public int getFree() {
		return free;
	}
	public void setFree(int free) {
		this.free = free;
	}
	public int getBuffer() {
		return buffer;
	}
	public void setBuffer(int buffer) {
		this.buffer = buffer;
	}
	public int getCache() {
		return cache;
	}
	public void setCache(int cache) {
		this.cache = cache;
	}
	public int getSi() {
		return si;
	}
	public void setSi(int si) {
		this.si = si;
	}
	public int getSo() {
		return so;
	}
	public void setSo(int so) {
		this.so = so;
	}
	public int getBi() {
		return bi;
	}
	public void setBi(int bi) {
		this.bi = bi;
	}
	public int getBo() {
		return bo;
	}
	public void setBo(int bo) {
		this.bo = bo;
	}
	public int getIn() {
		return in;
	}
	public void setIn(int in) {
		this.in = in;
	}
	public int getCs() {
		return cs;
	}
	public void setCs(int cs) {
		this.cs = cs;
	}
	public int getUs() {
		return us;
	}
	public void setUs(int us) {
		this.us = us;
	}
	public int getSy() {
		return sy;
	}
	public void setSy(int sy) {
		this.sy = sy;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getWa() {
		return wa;
	}
	public void setWa(int wa) {
		this.wa = wa;
	}
}
