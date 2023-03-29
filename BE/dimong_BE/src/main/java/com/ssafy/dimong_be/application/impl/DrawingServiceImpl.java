package com.ssafy.dimong_be.application.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dimong_be.application.DrawingService;
import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.domain.model.drwaing.DrawingRepository;
import com.ssafy.dimong_be.interfaces.common.MyDrawingDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class DrawingServiceImpl implements DrawingService {

	private final DrawingRepository drawingRepository;

	@Override
	public List<Drawing> getDrawingList(Long userId) {
		return drawingRepository.findAllByUser_UserId(userId);
	}

	@Override
	public void saveDrawing(MyDrawingDto drawing) {
		drawingRepository.save(MyDrawingDto.toEntity(drawing));
	}

}
