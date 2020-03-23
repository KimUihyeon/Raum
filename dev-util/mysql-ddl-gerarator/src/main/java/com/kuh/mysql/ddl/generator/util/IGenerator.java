package com.kuh.mysql.ddl.generator.util;


/**
 * 제네레이트 하기 위한 공통 인터페이스.
 *
 * @author kuh
 * @since 2020.03.23
 */
public interface IGenerator {

    /**
     * ddl 파일주소 던지면 JPA 클래스로 콘솔에 찍어줌.
     * @param ddlFilePath
     * @return
     */
    String fileRun(String ddlFilePath);

    /**
     * ddl 문자열을 던지면 JPA 클래스로 콘솔에 찍어줌
     * @param ddl
     * @return
     */
    String run(String ddl);
}
