package com.school.exam.web.interceptor;

import java.lang.reflect.Method;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.school.exam.repository.Token;


public class TokenInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            Token annotation = method.getAnnotation(Token.class);
            if (annotation != null) {
                boolean needSaveSession = annotation.save();
                if (needSaveSession) {
                    request.getSession(false).setAttribute("token", UUID.randomUUID().toString());
                }
                boolean needRemoveSession = annotation.remove();
                if (needRemoveSession) {
                    if (isRepeatSubmit(request)) {
                        return false;
                    }
                    request.getSession(false).removeAttribute("token");
                }
            }
            return true;
        } else {
            return super.preHandle(request, response, handler);
        }
    }
    private boolean isRepeatSubmit(HttpServletRequest request) {
        String serverToken = (String) request.getSession(false).getAttribute("token");
        if (serverToken == null) {
            return true;
        }
        String clinetToken = request.getParameter("token");
        if (clinetToken == null) {
            return true;
        }
        if (!serverToken.equals(clinetToken)) {
            return true;
        }
        return false;
    }
   /* @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
    	    throws Exception
	  {
    	if(!isRepeatSubmit(request)){
    		modelAndView.setViewName("redirect:/examlist");
    	}
    	Logger.getLogger(this.getClass()).warn(modelAndView.getViewName()+"=========token:==========="+request.getParameterValues("token")+"===="+isRepeatSubmit(request));
	  }*/
    /** 
     * 当出现一个非法令牌时调用 
     */  
   /* protected boolean handleInvalidToken(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception  
    {  
        Map<String , Object> data = new HashMap<String , Object>();  
        data.put("flag", 0);  
        data.put("msg", "请不要重复频繁操作！");  
        writeMessageUtf8(response, data);  
        Logger.getLogger(this.getClass()).warn();
        return false;  
    }  
    
    private void writeMessageUtf8(HttpServletResponse response, Map<String , Object> json) throws IOException  
    {  
        try  
        {  	 JsonMapper jsonMapper = new JsonMapper();
             response.setCharacterEncoding("UTF-8");  
             response.getWriter().print(jsonMapper.toJson(json));  
         }  
         finally  
         {  
             response.getWriter().close();  
         }  
     }  */
  

} 