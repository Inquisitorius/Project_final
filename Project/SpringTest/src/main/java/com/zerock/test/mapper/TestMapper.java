package com.zerock.test.mapper;

import java.util.List;

import com.zerock.test.dto.TestDTO;

public interface TestMapper {
	List<TestDTO> selectAll();
}
