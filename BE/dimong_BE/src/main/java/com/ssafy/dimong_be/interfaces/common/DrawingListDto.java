package com.ssafy.dimong_be.interfaces.common;

import com.ssafy.dimong_be.domain.model.drwaing.Drawing;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class DrawingListDto {

	private Long drawingId;
	private String myDrawingUrl;

	public static DrawingListDto fromEntity(Drawing drawing) {
		return DrawingListDto.builder()
			.drawingId(drawing.getDrawingId())
			.myDrawingUrl(drawing.getDrawingImageUrl())
			.build();
	}

}
