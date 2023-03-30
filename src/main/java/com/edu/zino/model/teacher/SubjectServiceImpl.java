package com.edu.zino.model.teacher;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.zino.domain.Goal;
import com.edu.zino.domain.Movie;
import com.edu.zino.domain.Requirement;
import com.edu.zino.domain.Section;
import com.edu.zino.domain.Subject;
import com.edu.zino.exception.GoalException;
import com.edu.zino.exception.RequirementException;
import com.edu.zino.exception.SubjectException;
import com.edu.zino.util.FileManager;


@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Autowired
	private SubjectDAO subjectDAO;
	@Autowired
	private GoalDAO goalDAO;
	@Autowired
	private RequirementDAO requirementDAO;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private SectionDAO sectionDAO;
	@Autowired
	private MovieDAO movieDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public List selectAllByTeacher(int teacher_idx) {
		return subjectDAO.selectAllByTeacher(teacher_idx);
	}
	@Transactional
	@Override
	public void insert(Subject subject) throws SubjectException{
		subjectDAO.insert(subject);
	}
	
	/*  학습목표 및 요구사항 관련   */
	@Override
	public Map<String,List> selectGoalAndRequirement(int subject_idx) {//subject에 일치하는 goal, requirement들을 가져오는 메서드
		List<Goal> goalList = goalDAO.selectAllBySubject(subject_idx);
		List<Requirement> requirementList = requirementDAO.selectAllBySubject(subject_idx);
		Map<String,List> objMap = new HashMap<>();
		objMap.put("goalList", goalList);
		objMap.put("requirementList",requirementList);
		
		return objMap;
	}
	@Transactional
	@Override
	public void regist(Subject subject) throws GoalException, RequirementException{//goal과 requirement 저장 요청시 기존 goal,requirement를 삭제하고 insert하는 메서드
		//delete 선 insert 후
		//delete 때 필요한 정보 subject_idx
		goalDAO.deleteBySubject(subject.getSubject_idx());
		requirementDAO.deleteBySubject(subject.getSubject_idx());
		
		//insert시 필요한 정보 : subject_idx , 여러건의 값들 2개끝
		List<Goal> goals = subject.getGoals();
		List<Requirement> requirements = subject.getRequirements();
		for(Goal goal : goals) {
			goalDAO.insert(goal);
		}
		for(Requirement requirement : requirements) {
			requirementDAO.insert(requirement);
		}
	}
	/*  학습목표 및 요구사항 관련  end */
	
	/* 강의 detail 관련 */
	@Transactional
	@Override
	public void update(Subject subject,String filePath) {//사용자가 입력한 내용 저장
			String origin = subjectDAO.selectFilename(subject.getSubject_idx());
		if(subject.getSubject_file() == null) {
			subject.setSubject_pic(origin);
			subjectDAO.updateAddFile(subject);
		}else {
			fileManager.deleteFile(origin, filePath);
			String subject_pic = fileManager.fileUpload(subject.getSubject_file(), filePath);
			subject.setSubject_pic(subject_pic);
			subjectDAO.updateAddFile(subject);
		}
	}
	
	@Override
	public Subject selectToDetail(int subject_idx) {//detail내용 가져오기
		return subjectDAO.selectToDetail(subject_idx);
	}
	/* 강의 detail 관련 end */
	
	/* 강의 movie 관련 */
	
	@Transactional
	@Override
	public void registSectionList(List<Section> sectionList) {
		logger.info("매개변수 sectionList : "+sectionList);
		int subject_idx = sectionList.get(0).getSubject().getSubject_idx();
		//기존 section 및 movie delete 하기
		//movie 먼저 delete 후 section delete
		List<Section> originList= sectionDAO.selectIndexBySubject(subject_idx);
		movieDAO.deleteBySection(originList);
		sectionDAO.deleteBySubject(subject_idx);
		
		//새로운 section 및 movie insert하기
		for(Section section : sectionList) {
			sectionDAO.insert(section);// 섹션저장
			List<Movie> movieList = section.getMovieList();//섹션에있는 movieList
			for(Movie movie : movieList) {//movie insert
				movie.setSection(section);
				movieDAO.insert(movie);
			}
		}
	}
	@Override	
	public List<Section> selectSection(int subject_idx) {
		return sectionDAO.selectBySubject(subject_idx);
	}
	/* 강의 movie end관련 */
	
	/*강사의 강의 목록 가져오기*/
	@Override
	public List<Subject> selectAllByTeacherAccess(int teacher_idx) {
		return subjectDAO.selectAllByTeacherAccess(teacher_idx);
	}
	
	//강의 디테일 페이지
	@Override
	public Subject select(int subject_idx) {
		return subjectDAO.select(subject_idx);
	}
	@Override
	public Subject selectSummary(int subject_idx) {
		return subjectDAO.selectSummary(subject_idx);
	}
	@Override
	public void delete(int subject_idx) {
		subjectDAO.delete(subject_idx);
	}
	@Override
	public void subjectRequest(int subject_idx) {
		subjectDAO.subjectRequest(subject_idx);
	}
	@Override
	public void updateAccess(Subject subject) {
		subjectDAO.updateAccess(subject);
	}
	@Override
	public Map<String, Object> selectAllAccessList(int page) {
		int pageSize=10;
		int blockSize=10;
		int startRow = (page-1)*pageSize+1;
		int lastRow = startRow+pageSize-1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		
		List<Subject> subjectList = subjectDAO.selectAllAccessList(map);
		int totalRecoard = subjectDAO.selectAllAccessRecoard();
		
		int totalPage = (int)Math.ceil((float)totalRecoard/pageSize);
		int firstPage = page - (page - 1) % blockSize;
		int lastPage = totalPage;
		if(totalPage>firstPage+blockSize-1) lastPage = firstPage+blockSize-1;
		
		
		map.put("subjectList", subjectList);
		map.put("totalRecoard",totalRecoard);
		map.put("totalPage",totalPage);
		map.put("firstPage",firstPage);
		map.put("lastPage",lastPage);
		return map;
	}
	@Override
	public Map<String, Object> selectAllPermissionRequestList(int page) {
		int pageSize=10;
		int blockSize=10;
		int startRow = (page-1)*pageSize+1;
		int lastRow = startRow+pageSize-1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		
		List<Subject> subjectList = subjectDAO.selectAllPermissionRequestList(map);
		logger.info("subjectList : "+subjectList);
		int totalRecoard = subjectDAO.selectAllAccessRecoard();
		
		int totalPage = (int)Math.ceil((float)totalRecoard/pageSize);
		int firstPage = page - (page - 1) % blockSize;
		int lastPage = totalPage;
		if(totalPage>firstPage+blockSize-1) lastPage = firstPage+blockSize-1;
		
		
		map.put("subjectList", subjectList);
		map.put("totalRecoard",totalRecoard);
		map.put("totalPage",totalPage);
		map.put("firstPage",firstPage);
		map.put("lastPage",lastPage);
		return map;
	}
	@Override
	public void updatePermission(int subject_idx) {
		subjectDAO.updatePermission(subject_idx);
	}
	@Override
	public List<Subject> selectAllByTopCategory(int top_category_idx) {
		return subjectDAO.selectAllByTopCategory(top_category_idx);
	}
	
	
	


}
