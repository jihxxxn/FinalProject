package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.QnaVO;

public interface QnaMapper {
	public int reply(Long qnaIndex, String answer);
	public int update(QnaVO qna);
	public int delete(Long qnaIndex);
	public QnaVO read(Long qnaIndex);
	public Integer insertSelectKey(QnaVO qna);
	public int getTotalCount(Criteria cri);
	public List<QnaVO> getMyListWithPaging(Criteria cri, String id); //id는 나중에수정
	public List<QnaVO> getList(Criteria cri);
	public List<QnaVO> getListWithPaging(Criteria cri);
}
