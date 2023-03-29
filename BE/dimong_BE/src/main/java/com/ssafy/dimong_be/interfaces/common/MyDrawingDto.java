package com.ssafy.dimong_be.interfaces.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ssafy.dimong_be.domain.model.drwaing.Drawing;
import com.ssafy.dimong_be.domain.model.drwaing.DrawingType;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MyDrawingDto {

	Long drawingId;

	String myDrawingUrl;

	@JsonIgnore
	DrawingType drawingType;

	public static MyDrawingDto fromEntity(Drawing drawing) {
		return MyDrawingDto.builder()
			.drawingId(drawing.getDrawingId())
			.myDrawingUrl(drawing.getDrawingImageUrl())
			.build();
	}

	public static Drawing toEntity(MyDrawingDto drawingDto) {
		return Drawing.builder()
			.drawingImageUrl(drawingDto.getMyDrawingUrl())
			.drawingType(drawingDto.getDrawingType())
			.build();
	}

}
