package com.neuedu.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class OperateFile {

    public static String upload(MultipartFile file){
        String uuid= UUID.randomUUID().toString();

        String fileName=file.getOriginalFilename();

        String fileExtendName=fileName.substring(fileName.lastIndexOf("."));

        String newFileName=uuid+fileExtendName;

        File path=new File("F:\\project\\businessmanager\\src\\main\\webapp\\WEB-INF\\images");
        if(path.exists()){
            path.mkdir();
        }
        File newFile=new File(path,newFileName);

        try {
            file.transferTo(newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return newFileName;

    }

    public static List<String> upload(MultipartFile[] files){
        List<String> list=new ArrayList<>();
        for (MultipartFile file:files) {
            String uuid= UUID.randomUUID().toString();

            String fileName=file.getOriginalFilename();

            String fileExtendName=fileName.substring(fileName.lastIndexOf("."));

            String newFileName=uuid+fileExtendName;

            File path=new File("F:\\project\\businessmanager\\src\\main\\webapp\\WEB-INF\\images");
            if(path.exists()){
                path.mkdir();
            }
            File newFile=new File(path,newFileName);

            try {
                file.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            list.add(newFileName);
        }
        return list;
    }

    public static void deleteFiles(List<String> fileNames){
        if(fileNames.isEmpty())return;

        String path="F:\\project\\businessmanager\\src\\main\\webapp\\WEB-INF\\images\\";
        for(String name:fileNames){
            File file=new File(path+name);
            file.delete();
        }
    }

    public static void deleteFile(String fileName){
        if(fileName.equals("")||fileName==null)return;

        String path="F:\\project\\businessmanager\\src\\main\\webapp\\WEB-INF\\images\\";

            File file=new File(path+fileName);
            file.delete();

    }

}
