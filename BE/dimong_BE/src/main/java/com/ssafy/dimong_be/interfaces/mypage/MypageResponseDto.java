package com.ssafy.dimong_be.interfaces.mypage;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.dimong_be.interfaces.common.DrawingListDto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MypageResponseDto implements Serializable {

	private Long userId;
	private String userNickname;
	private String userProfileImage;
	// private final List<MyDrawingDto> myDrawingList = new ArrayList<>();

	// public void addMyDrawingDto(MyDrawingDto myDrawingDto) {
	// 	myDrawingList.add(myDrawingDto);
	// }

	private final List<DrawingListDto> myDrawingList = new ArrayList<>();

	public void addMyDrawingDto(DrawingListDto myDrawingDto) {
		myDrawingList.add(myDrawingDto);
	}

}
