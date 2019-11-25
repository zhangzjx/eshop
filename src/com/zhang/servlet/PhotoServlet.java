package com.zhang.servlet;

import com.zhang.dom.Photo;
import com.zhang.service.ProductService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * @author prayers
 * @date 2019/11/18 18:48
 */
public class PhotoServlet extends HttpServlet {

    Photo photo = new Photo();
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建一个文件上传解析器ServletFileUpload对象，并设置上传文件的大小限制
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        try {
            Map<String, List<FileItem>> map = upload.parseParameterMap(request);
            FileItem fileItem = map.get("photo").get(0);
            String photoName = fileItem.getName();
            //获得字段名和字段值
            String brandName = map.get("brand_name").get(0).getString("utf-8");
            String brandFirst = map.get("brand_first").get(0).getString("utf-8");
            System.out.println(photoName+brandName+brandFirst);
            InputStream inputStream = fileItem.getInputStream();

            /*在项目中需要对同个文件流进行两个操作，
            一个是上传文件流到HDFS上，一个是上传文件流到solr建立文件索引，
            将inputStream转换成ByteArrayOutputStream，
            重复使用流时再用byteArrayOutputStream转换回来*/
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int len;
            while ((len = inputStream.read(buffer)) > -1) {
                byteArrayOutputStream.write(buffer, 0, len);
            }
            byteArrayOutputStream.flush();
            InputStream inputStream1 = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
            InputStream inputStream2 = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());

            String path = request.getServletContext().getRealPath("/WEB-INF/img/"+photoName);
            File file = new File(path);
            if (!file.exists() || !file.isDirectory()) {
                file.mkdirs();
            }
            //流的对拷
            FileOutputStream fileOutputStream = new FileOutputStream(path+photoName);

            byte[] bytes = new byte[512];
            int length;
            while ((length = inputStream1.read(bytes)) > -1) {
                fileOutputStream.write(bytes, 0, length);
            }
            fileOutputStream.flush();
            fileOutputStream.close();

            //封装一下数据，存入数据库
            photo.setBrandName(brandName);
            photo.setBrandFirst(brandFirst);
            photo.setPhotoName(photoName);
            photo.setFilePath(path);
            //photo.setFileTime(new Date());
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String filetime = sdf.format(date);

            Date d = null;
            try {
                d = (Date) sdf.parse(filetime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            photo.setFileTime(d);

            System.out.println(inputStream2);
            System.out.println(path);

             ProductService productService =  new ProductService();
             productService.addBrand(photo);
             request.setAttribute("msg","添加成功");



        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        ProductServlet productServlet = new ProductServlet();
        productServlet.findAllBrand(request,response);
    }

}
            /**
             *
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String filetime = sdf.format(date);

            Date d = null;
            try {
                d = (Date) sdf.parse(filetime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            photo.setFileTime((d);
             */
