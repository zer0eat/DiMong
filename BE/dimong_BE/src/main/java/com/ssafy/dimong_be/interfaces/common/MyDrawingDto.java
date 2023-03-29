package com.ssafy.dimong_be.interfaces.common;

import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.domain.model.drwaing.DrawingType;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MyDrawingDto {

	private Long drawingId;
	private String myDrawingUrl;
	private Long userId;

	// @JsonIgnore
	private DrawingType drawingType;

	public static MyDrawingDto fromEntity(Drawing drawing) {
		return MyDrawingDto.builder()
			.drawingId(drawing.getDrawingId())
			.myDrawingUrl(drawing.getDrawingImageUrl())
			.build();
	}

	public static Drawing toEntity(MyDrawingDto drawingDto) {
		return Drawing.builder()
			.userId(drawingDto.getUserId())
			.drawingImageUrl(drawingDto.getMyDrawingUrl())
			.drawingType(drawingDto.getDrawingType())
			.build();
	}

}
