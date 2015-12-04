package com.school.exam.rest;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int [] numbers={1,10,2,8,15,30,3,3,6,8,4,9,5,12,10};
		bubsort(numbers);
	}
	public static void bubsort(int number[]){  
        int i, j, k, temp, flag = 1;  
        long start,end;  
          
        start=System.nanoTime();  
        int MAX = number.length;
        System.out.println(MAX);
        for(i = 0; i < MAX-1 && flag == 1; i++) {  
            flag = 0;  
            for(j = 0; j < MAX-i-1; j++) {  
                if(number[j+1] > number[j]) {  
                    temp=number[j+1];  
                    number[j+1]=number[j];  
                    number[j]=temp;  
                    flag = 1;  
                }  
            }  
        }  
        end=System.nanoTime();  
          
        System.out.println("-----------------冒泡排序法------------------");  
        System.out.print("排序后是:");  
        for(i=0;i<=MAX-1;i++){  
            System.out.print(number[i]+" ");  
        }  
        System.out.println();  
        System.out.println("排序使用时间："+(end-start)+" ns");  
   }
}
