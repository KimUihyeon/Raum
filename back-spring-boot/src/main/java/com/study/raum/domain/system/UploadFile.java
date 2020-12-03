package com.study.raum.domain.system;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * UploadFile
 * 
 * 업로드 파일 패턴 ->
 *
 * private
 * /uploadFile/유저명(hash)/시스템날짜(timestamp(yyyy-MM-dd) hash)/
 *
 * public
 * /uploadFile/common/시스템날짜(timestamp(yyyy-MM-dd) hash)/
 *
 * @author Kimuihyeon
 * @since 2020.11.30
 */

@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "upload_file")
public class UploadFile {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "request_id")
    private Long requestId;
    private String requestType; // (COMMENT/PRODUCT)

    private String extension; // 확장자 (.포함)
    private String filePath; // 파일 경로
    private String transFileName; // 변경된 파일 이름
    private String orgFileName; // 원본 파일 이름
    private Timestamp uploadAt; // 업로드 시간
    private Timestamp deletedAt; // 삭제된 시간

}
