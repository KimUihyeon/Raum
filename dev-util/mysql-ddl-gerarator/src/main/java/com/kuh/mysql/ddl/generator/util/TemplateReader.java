package com.kuh.mysql.ddl.generator.util;

import com.kuh.mysql.ddl.generator.enums.ProgramingLanguage;
import com.kuh.mysql.ddl.generator.enums.ProgramingLanguageOption;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * @author kuh
 * @since 2020.03.23
 */
public class TemplateReader {

    public static class Setting {

        private ProgramingLanguage language;
        private ProgramingLanguageOption option;

        public void Setting(){

        }

        public Setting language(ProgramingLanguage language) {
            this.language = language;
            return this;
        }

        public Setting option(ProgramingLanguageOption option) {
            this.option = option;
            return this;
        }

        public String read() {
            return new TemplateReader().read(this.language, this.option);
        }
    }

    private String read(ProgramingLanguage language, ProgramingLanguageOption optional) {
        switch (language) {
            case NONE: {
                try{
                    throw new Exception("language enum not definition");
                }catch (Exception e){}
            }
            case JAVA: {
                if(optional == ProgramingLanguageOption.NONE) {

                }
                else if(optional == ProgramingLanguageOption.LOMBOK) {
                }


                String root = this.getClass().getResource("/").getPath();


                String path = this.getClass().getResource("./template/java/UseLombok.txt").toString();
                fileRead(path);
                break;
            }
        }

        return ";";
    }


    private String fileRead(String path){


        FileInputStream fileInputStream = null;
        StringBuilder contents = new StringBuilder();

        try {
            fileInputStream = new FileInputStream(new File(path));
            fileInputStream.read();

            while (fileInputStream.read() != -1){
                contents.append(fileInputStream.read());
            }

            System.out.println(contents);


        } catch (IOException ioException) {
            System.out.println(ioException.getMessage());

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            throw ex;
        } finally {
            try {
                fileInputStream.close();
            } catch (Exception ex1) {
            }
        }


        return contents.toString();
    }
}
