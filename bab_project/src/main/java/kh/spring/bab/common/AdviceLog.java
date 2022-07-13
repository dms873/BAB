package kh.spring.bab.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AdviceLog {
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	
	@Pointcut("execution(public * kh.spring.bab..*Dao.*(..))")
	public void commonDaoPointCut() {}
	@Pointcut("execution(public * kh.spring.bab..*ServiceImpl.*(..))")
	public void commonServicePointCut() {}
	@Pointcut("execution(public * kh.spring.bab..*Controller.*(..))")
	public void commonControllerPointCut() {}

	
	@Around("commonDaoPointCut()")
	public Object aroundLogMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null;  // 타겟메소드로부터 return 받은 값을 저장
		
		logger.debug("\t\t["+pjp.getThis()+":"+pjp.getSignature().getName()+"]");
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			logger.debug("\t\t--args["+i+"] "+args[i] +"\n");
		}	
		
		// 타겟메소드 실행
		ro = pjp.proceed();
		
		// 타겟메소드의 return 값
		logger.debug("\t\t[ DAO ▶ ] "+ ro);
		
		return ro;
	}
	
	@Around("commonControllerPointCut()")
	public Object aroundLogCtrlMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null;  // 타겟메소드로부터 return 받은 값을 저장
		
		logger.debug("\t[ " + pjp.getThis() + " : " + pjp.getSignature().getName() + " ]");
		// 타겟메소드로 전달되는 매개인자들
		Object[] args = pjp.getArgs();
		for(int i = 0; i < args.length; i++) {
			logger.debug("\t-args[ "+i+" ] "+args[i] +"\n");
		}	
		
		// 타겟메소드 실행
		ro = pjp.proceed();
		
		// 타겟메소드의 return 값
		logger.debug("\t[ CONTROLLER ▶ ] "+ ro + "\n ==================== \n");
		
		return ro;
	}
	
	
}
