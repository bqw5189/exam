package com.school.exam.rest;

import com.school.exam.entity.TeExamPaperResultVO;

public class Comparators {
	public static java.util.Comparator getComparator() {  
	    return new java.util.Comparator() {  
	  
	      public int compare(Object o1, Object o2) {  
	        if (o1 instanceof TeExamPaperResultVO) {  
	          return compare( (TeExamPaperResultVO) o1, (TeExamPaperResultVO) o2);  
	        }else {  
	          System.err.println("未找到合适的比较器");  
	          return 1;  
	  
	        }  
	      }  
	  
	      public int compare(TeExamPaperResultVO o1, TeExamPaperResultVO o2) {  
	    	  TeExamPaperResultVO s1 = (TeExamPaperResultVO) o1;  
	    	  TeExamPaperResultVO s2 = (TeExamPaperResultVO) o2;  
	        Double val1 = s1.getSumScore();  
	        Double val2 = s2.getSumScore();  
	        return (val1 > val2 ? -1 : (val1 == val2 ? 0 : 1));
	      }  
	    };
	}
}
