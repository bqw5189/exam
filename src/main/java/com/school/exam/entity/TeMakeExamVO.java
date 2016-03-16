package com.school.exam.entity;

import com.google.common.collect.Lists;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Entity
@Table(name = "t_te_make_exam")
public class TeMakeExamVO extends IdEntity{
		// fields
		private java.lang.String examName;//试卷名称
		private java.lang.String examRemark;//试卷说明
		private java.lang.Integer examTime;//答题时间
		private Timestamp examBeginDate;//考试开始时间
		private Timestamp examEndDate;//考试结束时间
		private java.lang.Integer state;
		private Integer isHas;//是否已经考试完毕>0就表示已经答过试卷
		private List<TeExamQuestionVO> questionList = Lists.newArrayList();
		private TeProjectVO project;
		@ManyToOne
		@JoinColumn(name="project_id")
		public TeProjectVO getProject() {
			return project;
		}
		public void setProject(TeProjectVO project) {
			this.project = project;
		}
		@OneToMany
		@JoinTable(name = "t_te_question_exampaper", joinColumns = { @JoinColumn(name = "exampaperId") }, inverseJoinColumns = { @JoinColumn(name = "questionId") })
		// Fecth策略定义
		@Fetch(FetchMode.SUBSELECT)
		// 集合按题号排序
		@OrderBy("id ASC")
		public List<TeExamQuestionVO> getQuestionList() {
			return questionList;
		}

		public TeMakeExamVO(Long id,String examName,Integer examTime,String examRemark) {
			this.id = id;
			this.examName = examName;
			this.examRemark = examRemark;
			this.examTime = examTime;
		}
		public void setQuestionList(List<TeExamQuestionVO> questionList) {
			this.questionList = questionList;
		}

        @Transient
        public List<TeExamQuestionVO> getQuestion() {
            List<TeExamQuestionVO> newList = randomList(questionList);
            questionList.addAll(newList);
            return questionList;
        }

        public static <V> List<V> randomList(List<V> sourceList) {
            if (sourceList == null || sourceList.size() == 0) {
                return sourceList;
            }
            List<V> random = new ArrayList<V>(sourceList.size());
            do {
                int index = Math.abs(new Random().nextInt(sourceList.size()));
                random.add(sourceList.remove(index));

            } while (sourceList.size() > 0);

            return random;

        }

    public TeMakeExamVO() {
			// TODO Auto-generated constructor stub
		}
		@Transient
		public Integer getIsHas() {
			return isHas;
		}

		public void setIsHas(Integer isHas) {
			this.isHas = isHas;
		}

		public TeMakeExamVO(String examName, String examRemark,
				Integer examTime,
				Integer state) {
			super();
			this.examName = examName;
			this.examRemark = examRemark;
			this.examTime = examTime;
			this.state = state;
		}
		
		public Timestamp getExamBeginDate() {
			return examBeginDate;
		}
		public void setExamBeginDate(Timestamp examBeginDate) {
			this.examBeginDate = examBeginDate;
		}
		public Timestamp getExamEndDate() {
			return examEndDate;
		}
		public void setExamEndDate(Timestamp examEndDate) {
			this.examEndDate = examEndDate;
		}
		public java.lang.String getExamName() {
			return examName;
		}
		public void setExamName(java.lang.String examName) {
			this.examName = examName;
		}
		public java.lang.String getExamRemark() {
			return examRemark;
		}
		public void setExamRemark(java.lang.String examRemark) {
			this.examRemark = examRemark;
		}
		public java.lang.Integer getExamTime() {
			return examTime;
		}
		public void setExamTime(java.lang.Integer examTime) {
			this.examTime = examTime;
		}
		public java.lang.Integer getState() {
			return state;
		}
		public void setState(java.lang.Integer state) {
			this.state = state;
		}
}
