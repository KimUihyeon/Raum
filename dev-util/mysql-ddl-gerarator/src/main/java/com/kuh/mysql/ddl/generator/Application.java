package com.kuh.mysql.ddl.generator;

import com.kuh.mysql.ddl.generator.java.JPAEntityGenerator;

/**
 * @author kuh
 * @since 2020.03.23
 */
public class Application {
    public static void main(String[] arg){


        String ddlStr = "\n" +
                "CREATE TABLE `systemFiles` (\n" +
                "    `id` BIGINT NOT NULL,\n" +
                "    `fileType` VARCHAR(25) NOT NULL,\n" +
                "    `path` TEXT NOT NULL,\n" +
                "    `fileSize` DOUBLE NOT NULL,\n" +
                "    `orgFileName` TEXT NOT NULL,\n" +
                "    `extension` VARCHAR(20) NOT NULL,\n" +
                "    `regDate` DATETIME NOT NULL,\n" +
                "    PRIMARY KEY (`id`)\n" +
                ");";

        JPAEntityGenerator generator = new JPAEntityGenerator();
        String result = generator.run(ddlStr);


        System.out.println(result);
    }
}
