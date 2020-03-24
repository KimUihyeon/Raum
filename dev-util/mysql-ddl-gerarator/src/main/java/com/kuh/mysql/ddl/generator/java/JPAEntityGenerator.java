package com.kuh.mysql.ddl.generator.java;

import com.kuh.mysql.ddl.generator.enums.ProgramingLanguage;
import com.kuh.mysql.ddl.generator.enums.ProgramingLanguageOption;
import com.kuh.mysql.ddl.generator.util.IGenerator;
import com.kuh.mysql.ddl.generator.util.TemplateReader;
import jdk.nashorn.internal.objects.annotations.Getter;

/**
 * @author kuh
 * @since 2020.03.23
 */

public class JPAEntityGenerator implements IGenerator {

    public boolean isLombok = true ;


    /**
     * TODO : 밖에서 CREATE 문 끊어주는거 만들어야함.
     * @param ddl
     * @return
     */
    @Override
    public String run(String ddl) {

        singleGenerator(ddl);
        return ddl;
    }


    private String singleGenerator(String ddl) {

        int bodyStartIndex = ddl.indexOf("(");
        int bodyLastIndex = ddl.lastIndexOf(")");

        if (bodyStartIndex == -1 || bodyLastIndex == -1) {
            try {
                throw new Exception("비 정상적인 ddl 입니다.   () 부족");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        String header = ddl.substring(0, bodyStartIndex);
        String body = ddl.substring(bodyStartIndex+1, bodyLastIndex);

        StringBuilder classHeader  = new StringBuilder();

        String template = new TemplateReader.Setting()
                .language(ProgramingLanguage.JAVA)
                .option(ProgramingLanguageOption.LOMBOK)
                .read();

        if(isLombok){
            classHeader.append("@Getter");
            classHeader.append(System.lineSeparator());
            classHeader.append("@NoArgsConstructor");
            classHeader.append(System.lineSeparator());
            classHeader.append("@AllArgsConstructor");
            classHeader.append(System.lineSeparator());
            classHeader.append("@Builder");
            classHeader.append(System.lineSeparator());
        }

        classHeader.append("@Entity");
        classHeader.append(System.lineSeparator());
        classHeader.append("@Table(name = \"[$$TABLE_NAME]\")");
        classHeader.append(System.lineSeparator());
        classHeader.append("public class [$$ClassName]{");
        classHeader.append(System.lineSeparator());
        classHeader.append("}");
        String finalHeader = classHeader.toString();
        System.out.println(finalHeader);

        return ddl;
    }
}
