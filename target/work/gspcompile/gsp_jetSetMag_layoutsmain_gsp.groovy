import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_jetSetMag_layoutsmain_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/layouts/main.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',5,['gsp_sm_xmlClosingForEmptyTag':("/"),'charset':("utf-8")],-1)
printHtmlPart(1)
createTagBody(2, {->
createTagBody(3, {->
invokeTag('layoutTitle','g',6,['default':("Jet7 Magazine | Votre Jet à la une")],-1)
})
invokeTag('captureTitle','sitemesh',6,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',6,[:],2)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("description"),'content':("app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav")],-1)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("viewport"),'content':("width=device-width, initial-scale=1, maximum-scale=1")],-1)
printHtmlPart(2)
expressionOut.print(resource(dir:'js/jPlayer',file:'jplayer.flat.css'))
printHtmlPart(3)
expressionOut.print(resource(dir:'css',file:'app.v1.css'))
printHtmlPart(3)
expressionOut.print(resource(dir:'js/datatables',file:'datatables.css'))
printHtmlPart(4)
expressionOut.print(resource(dir:'images',file:'favicon.ico'))
printHtmlPart(5)
invokeTag('layoutHead','g',13,[:],-1)
printHtmlPart(6)
})
invokeTag('captureHead','sitemesh',19,[:],1)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(7)
invokeTag('layoutBody','g',470,[:],-1)
printHtmlPart(8)
})
invokeTag('captureBody','sitemesh',758,['class':("")],1)
printHtmlPart(9)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1404920403777L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}
