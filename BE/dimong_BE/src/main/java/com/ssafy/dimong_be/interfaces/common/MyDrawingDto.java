package com.ssafy.dimong_be.interfaces.common;

import com.ssafy.dimong_be.domain.model.drawing.Drawing;
import com.ssafy.dimong_be.domain.model.drawing.DrawingType;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Builder(toBuilder = true)
public class MyDrawingDto {

	private Long drawingId;
	private String myDrawingUrl;
	private Long userId;

	@Setter
	private Long similarDinosaurId1;

	@Setter
	private Long similarDinosaurId2;

	@Setter
	private Long similarDinosaurId3;

	@Setter
	private Long badgeId;

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
			.similarDinosaurId1(drawingDto.getSimilarDinosaurId1())
			.similarDinosaurId2(drawingDto.getSimilarDinosaurId2())
			.similarDinosaurId3(drawingDto.getSimilarDinosaurId3())
			.badgeId(drawingDto.getBadgeId())
			.build();
	}

}
