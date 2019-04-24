package app;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class PrintAdvice {
	
	@Before("execution(* app.Galaxy*.powerOn(..))")
	public void printBefore(JoinPoint jp) {
//		System.out.println(jp.getSignature().getName());
		System.out.println("PrintAdvice : AOP Before print");
	}
	
	@After("execution(* app.Galaxy*.volumeUp(..))")
	public void printAfter(JoinPoint jp) {
//		System.out.println(jp.getSignature().getName());
		System.out.println("PrintAdvice : AOP After print");
	}
	
	@Around("execution(* app.Galaxy*.volumeDown(..))")
	public void printAround(ProceedingJoinPoint jp) throws Throwable {
//		System.out.println(jp.getSignature().getName());
		// method 전에 실행되는 부분
		System.out.println("PrintAdvice : AOP Around Before print");
		jp.proceed(); // joint point
		// method 후에 실행되는 부분
		System.out.println("PrintAdvice : AOP Around After print");
	}
}