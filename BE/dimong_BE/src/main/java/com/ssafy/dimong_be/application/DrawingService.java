package com.ssafy.dimong_be.application;

import java.util.List;

import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.interfaces.common.MyDrawingDto;

public interface DrawingService {

	public List<Drawing> getDrawingList(Long userId);

	public void saveDrawing(MyDrawingDto drawing);

}
