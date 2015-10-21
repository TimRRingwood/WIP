package test

import grails.plugin.springsecurity.annotation.Secured
import com.megatome.grails.RecaptchaService
import net.sf.ehcache.loader.CacheLoader
import test.LoginInfo;


class SecureController {
	
RecaptchaService recaptchaService

   def attempts
   def allowedNumberOfAttempts
   
   @Secured('ROLE_ADMIN')
   def index() {
      render 'Secure access only'
   }
   
  
   void init() {
	   allowedNumberOfAttempts = grailsApplication.config.brutforce.loginAttempts.allowedNumberOfAttempts
	   int time = grailsApplication.config.brutforce.loginAttempts.time

	   log.info "account block configured for $time minutes"
	   attempts = CacheBuilder.newBuilder()
				  .expireAfterWrite(time, TimeUnit.MINUTES)
				  .build({0} as CacheLoader);
   }

   
   def test() {
       // "sec";
   }
   
   def recap1() {
	   
   }

   def vc2() {
      println "vc2"
   }
   def recap2() {
	   println "recap 2"
	   
	   def numberOfAttempts = attempts
	   println "fail login  previous number for attempts $numberOfAttempts"


	   println "P1: " + params.secret
	   println "P2: " + params.g-recaptcha-response
	   def atest = recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params);
	   print "at test" + atest
	   if (!atest) {
		   println "A"
		   render(view: "recap1")
	   }
	   else {
		   render(view: "recap2")
	   }


   }
}
