package com.zerock.test.dto;

public class ServerInfoDTO 
{
	private String server_date;
	private String server_time;
	
	//proces
	private int proces_ProcessCnt;
	private int proces_IOwait;
	
	//memory
	private int memory_swpd; //사용된 가상 메모리의 용량
	private int memory_free; //사용가능한 여유 메모리 용량
	private int memory_buffer;//사용된 버퍼 메모리 총량
	private int memory_cache;//사용된 페이지케시 메모리
	
	//swap
	private int swap_si; //swap-in 메모리의 양 kb
	private int swap_so; //swap-out 메모리양 ! 지속적으로 발생시 메모리 부족 의심
	
	//IO
	private int io_bi; // 블록 디바이스로부터 입력 블록수
	private int io_bo; // 블록 디바이스에 쓰기 블록수
	
	//system
	private int system_in; // 초당 발생한 interrupts
	private int system_cs; // 초당 발생한 문맥교환수
	
	//cpu
	private int cpu_us; //cpu가 사용자 수준 코드를 실행한 시간
	private int cpu_sy; // cput 가 시스템 수준 코드를 실행한 시간
	private int cpu_id; //idel 시간!
	private int cpu_wa; //IO WAIT TIME
	private int cpu_st; //?
	
	private boolean hitDate;
	
	

	public ServerInfoDTO()
	{
		hitDate = false;
	}
	
	public void PrintDTO()
	{
		System.out.println("DATE : " + this.server_date);
		System.out.println("Time : " + this.server_time);
		
		System.out.println("proces_ProcessCnt : " + this.proces_ProcessCnt);
		System.out.println("proces_IOwait : " + this.proces_IOwait);
		
		System.out.println("swpd : " + this.memory_swpd);
		System.out.println("free : " + this.memory_free);
		System.out.println("buffer : " + this.memory_buffer);
		System.out.println("cache : " + this.memory_cache);
		System.out.println("si : " + this.swap_si);
		System.out.println("so : " + this.swap_so);
		System.out.println("bi : " + this.io_bi);
		System.out.println("bo : " + this.io_bo);
		
		System.out.println("in : " + this.system_in);
		System.out.println("cs : " + this.system_cs);
		System.out.println("us : " + this.cpu_us);
		System.out.println("sy : " + this.cpu_sy);
		System.out.println("id : " + this.cpu_id);
		System.out.println("wa : " + this.cpu_wa);
		System.out.println("st : " + this.cpu_st);
		
	}
	
	
	
	public ServerInfoDTO(String server_date, String server_time, int proces_ProcessCnt, int proces_IOwait,
			int memory_swpd, int memory_free, int memory_buffer, int memory_cache, int swap_si, int swap_so, int io_bi,
			int io_bo, int system_in, int system_cs, int cpu_us, int cpu_sy, int cpu_id, int cpu_wa, int cpu_st) 
	{
		this.server_date = server_date;
		this.server_time = server_time;
		this.proces_ProcessCnt = proces_ProcessCnt;
		this.proces_IOwait = proces_IOwait;
		this.memory_swpd = memory_swpd;
		this.memory_free = memory_free;
		this.memory_buffer = memory_buffer;
		this.memory_cache = memory_cache;
		this.swap_si = swap_si;
		this.swap_so = swap_so;
		this.io_bi = io_bi;
		this.io_bo = io_bo;
		this.system_in = system_in;
		this.system_cs = system_cs;
		this.cpu_us = cpu_us;
		this.cpu_sy = cpu_sy;
		this.cpu_id = cpu_id;
		this.cpu_wa = cpu_wa;
		this.cpu_st = cpu_st;
		
		hitDate = false;
	}
	
	public String getServer_date() {
		return server_date;
	}

	public void setServer_date(String server_date) {
		this.server_date = server_date;
	}

	public String getServer_time() {
		return server_time;
	}

	public void setServer_time(String server_time) {
		this.server_time = server_time;
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

	public int getMemory_swpd() {
		return memory_swpd;
	}

	public void setMemory_swpd(int memory_swpd) {
		this.memory_swpd = memory_swpd;
	}

	public int getMemory_free() {
		return memory_free;
	}

	public void setMemory_free(int memory_free) {
		this.memory_free = memory_free;
	}

	public int getMemory_buffer() {
		return memory_buffer;
	}

	public void setMemory_buffer(int memory_buffer) {
		this.memory_buffer = memory_buffer;
	}

	public int getMemory_cache() {
		return memory_cache;
	}

	public void setMemory_cache(int memory_cache) {
		this.memory_cache = memory_cache;
	}

	public int getSwap_si() {
		return swap_si;
	}

	public void setSwap_si(int swap_si) {
		this.swap_si = swap_si;
	}

	public int getSwap_so() {
		return swap_so;
	}

	public void setSwap_so(int swap_so) {
		this.swap_so = swap_so;
	}

	public int getIo_bi() {
		return io_bi;
	}

	public void setIo_bi(int io_bi) {
		this.io_bi = io_bi;
	}

	public int getIo_bo() {
		return io_bo;
	}

	public void setIo_bo(int io_bo) {
		this.io_bo = io_bo;
	}

	public int getSystem_in() {
		return system_in;
	}

	public void setSystem_in(int system_in) {
		this.system_in = system_in;
	}

	public int getSystem_cs() {
		return system_cs;
	}

	public void setSystem_cs(int system_cs) {
		this.system_cs = system_cs;
	}

	public int getCpu_us() {
		return cpu_us;
	}

	public void setCpu_us(int cpu_us) {
		this.cpu_us = cpu_us;
	}

	public int getCpu_sy() {
		return cpu_sy;
	}

	public void setCpu_sy(int cpu_sy) {
		this.cpu_sy = cpu_sy;
	}

	public int getCpu_id() {
		return cpu_id;
	}

	public void setCpu_id(int cpu_id) {
		this.cpu_id = cpu_id;
	}

	public int getCpu_wa() {
		return cpu_wa;
	}

	public void setCpu_wa(int cpu_wa) {
		this.cpu_wa = cpu_wa;
	}

	public int getCpu_st() {
		return cpu_st;
	}

	public void setCpu_st(int cpu_st) {
		this.cpu_st = cpu_st;
	}

	public boolean isHitDate() {
		return hitDate;
	}

	public void setHitDate(boolean hitDate) {
		this.hitDate = hitDate;
	}
	
	

}
