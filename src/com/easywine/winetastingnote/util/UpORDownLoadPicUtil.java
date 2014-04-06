package com.easywine.winetastingnote.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.easywine.winetastingnote.pojo.ItemImg;

public class UpORDownLoadPicUtil {
	
	
	public static ItemImg uploadImg(HttpServletRequest request,
			CommonsMultipartFile file_upload_name, String type , Integer key ) {
		ItemImg img = new ItemImg(); 
		String fileName = file_upload_name.getFileItem().getName().toString();
		if(fileName != null && !"".equals(fileName)){
			String[] ie_f_name = fileName.replace("\\", ",").split(",");
			fileName = ie_f_name[ie_f_name.length-1];
		}
		String end = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String affixName=System.currentTimeMillis()+end;
		String realPath =  request.getSession().getServletContext().getRealPath("/");
		String filepath = File.separator+"pap"+File.separator+type+"_" + key;
		String diskPath = realPath + filepath;
		File file = new File(diskPath);
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream in = null;
		try {
			in = file_upload_name.getInputStream();
			FileOutputStream out = new FileOutputStream(diskPath + File.separator + affixName);
			byte[] bts = new byte[1024];
			int length=0;
			while((length=in.read(bts))!=-1){
				out.write(bts, 0, length);
			}
			out.close();
			in.close();
			img.setPhotoUrl(filepath + File.separator + affixName);
			String name = fileName.substring(0, fileName.lastIndexOf("."));
			img.setPhotoName( name );
			img.setRelationId(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return img;
	}

	public static void deleleFile(HttpServletRequest request,
			ItemImg img) {
		String realPath =  request.getSession().getServletContext().getRealPath("/");
		String filePath = img.getPhotoUrl();
		File affix_file = new File(realPath + filePath);
		if(affix_file.exists()){
			affix_file.delete();
		}
	}

	public static void downloadAfixx(HttpServletRequest request, HttpServletResponse response, 
			ItemImg img) throws UnsupportedEncodingException {
		if( img == null ){return ;}
		String filePath = request.getSession().getServletContext().getRealPath("/") + img.getPhotoUrl();
		File file = new File( filePath);
		if( !file.exists() ) return ;
		String end = img.getPhotoUrl().substring(img.getPhotoUrl().lastIndexOf(".") , img.getPhotoUrl().length());
		String filename = img.getPhotoName();
		byte[] b = filename.getBytes("GBK");   
		filename = new String(b,"8859_1");  
		response.setHeader("Content-Disposition","attachment;filename="+filename + end);
		response.setContentType("application/octet-stream;");//定义输出类型
		OutputStream os;
		try {
			os = response.getOutputStream();
			InputStream in = new BufferedInputStream(new FileInputStream(file));
			int len;
			byte[] buffer = new byte[1024];
			while((len=in.read(buffer))>0){
				os.write(buffer,0,len);
			}
			os.close();
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
