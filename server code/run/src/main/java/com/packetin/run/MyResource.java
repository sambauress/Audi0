package com.packetin.run;

import java.io.File;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

/**
 * Root resource (exposed at "myresource" path)
 */
@Path("myresource")
public class MyResource {
	
	String folder1;
	String xml = "<?xml version=\"1.0\"?> \n <Content> ";
    /**
     * Method handling HTTP GET requests. The returned object will be sent
     * to the client as "text/plain" media type.
     *
     * @return String that will be returned as a text/plain response.
     */
    @GET
    @Produces(MediaType.TEXT_XML)
    public String getIt() {
    	File folder = new File("/opt/tomcat/webapps/ROOT/music/");
        return listFilesForFolder(folder) + "\n </Content>";
    }
    

    public String encodeToHTML(String str) {
	    return str
	        .replace("&",  "%26")
	        .replace(" ",  "%20")
	//        .replace(".",  "%2E")
//	        .replace("\\",  "/")
	        .replace("?", "%3F");
	      
	}
	
	public String listFilesForFolder(final File folder) {
		
		
		
		 for (final File fileEntry : folder.listFiles()) {
		        
			 if (fileEntry.isDirectory()) {
				 folder1 = (fileEntry.toString()).replace("/opt/tomcat/webapps/ROOT/", "");
				 xml = xml + " \n <album hdgridposterurl=\"http://192.168.0.115:8080/" + encodeToHTML(folder1) +"/Folder.jpg\" >";
		            listFilesForFolder(fileEntry);
		            xml = xml + "\n</album> ";  
		        } else {
	        	String print = fileEntry.toString();
	        	String cut = print.replace("/opt/tomcat/webapps/ROOT/", "");
	        	String s  = encodeToHTML(cut);
	        	String end = "http://192.168.0.115:8080/" + s;

	        	
	        	xml = xml + "\n<item url=\"" + end + "\" title =\"" + ((cut.replace(".mp3", "")).replace("&", "")).replace(folder1 + "/","") + "\" />";
	        	
		        }
	          
	    }
		
		 System.out.print(xml);

		 return xml;
	 
	}

}
