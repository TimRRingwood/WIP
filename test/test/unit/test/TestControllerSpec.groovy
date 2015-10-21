package test



import spock.lang.Specification
import test.TestController
import grails.test.mixin.TestFor
import groovy.json.JsonSlurper
import groovy.mock.interceptor.StubFor

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */

@TestFor(TestController)
class TestControllerSpec extends Specification {
	
	//RecaptchaService recaptchaService

    def setup() {
    }

    def cleanup() {
    }
	
	/*def "test test"() {
		TestController t = new TestController()
		when:
		t.index()

		then:
		response.text == 'Test this'

	}*/
	
	def "re test"() { 
		/*println "test"
		def stub = new StubFor(Post.class)
		stub.demand.hasProperty(3..3) { true }
		stub.demand.setUrl() {}
		stub.demand.setProxy() {}
		stub.demand.getQueryParams(3..3) { new QueryParams(null) }
		stub.demand.getResponse() { postText == null ? null : new JsonSlurper().parseText(postText) }
		def response = r.checkAnswer("123.123.123.123", "response")
		println ("X: " + response)
	
		when:
		response = recaptchaService.checkAnswer("123.123.123.123", "response")
		
		then:
		response == true
		stub.use {
			response = r.checkAnswer("123.123.123.123", "response")
	
			assertTrue response == expectedValid
		} */
	}

   /* def "#a , #b max #c let's try this!"() {
    expect:
    Math.max(a, b) == c
    where:
    a||b||c
    10||5||10
    10||20||20
    20||20||20
  } */
}
