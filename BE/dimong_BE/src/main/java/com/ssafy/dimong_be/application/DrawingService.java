package com.ssafy.dimong_be.application;

import java.util.List;

import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.interfaces.common.MyDrawingDto;
import com.ssafy.dimong_be.interfaces.drawing.DrawingResponseDto;

public interface DrawingService {

	List<Drawing> getDrawingList(Long userId);

	void saveDrawing(MyDrawingDto drawing);

	DrawingResponseDto getDrawing(Long drawingId);

}
