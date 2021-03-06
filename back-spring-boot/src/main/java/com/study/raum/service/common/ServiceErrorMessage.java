package com.study.raum.service.common;

import com.study.raum.setting.PropertyFileManager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;

/**
 * @author kuh
 * @since 2020.04.17
 */

@PropertySource(PropertyFileManager.ERROR_MGS_PROP)
public abstract class ServiceErrorMessage {

    @Value("${not_find_data}")
    protected String NOT_FIND_DATA;

    @Value("${not_supported_http_method}")
    protected String NOT_SUPPORTED_HTTP_METHOD;

    @Value("${not_find_page}")
    protected String NOT_FIND_PAGE;

    @Value("${not_find_posts}")
    protected String NOT_FIND_POSTS;

    @Value("${fail_delete_jpa}")
    protected String FAIL_DELETE_JPA;
}
