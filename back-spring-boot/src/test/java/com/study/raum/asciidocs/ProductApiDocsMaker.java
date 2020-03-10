package com.study.raum.asciidocs;

import com.study.raum.controller.ProductsApiController;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.restdocs.AutoConfigureRestDocs;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.restdocs.mockmvc.MockMvcRestDocumentation.document;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

/**
 * @author kuh
 * @since 2020.03.10
 */

@RunWith(SpringRunner.class)
@WebMvcTest(ProductsApiController.class)
@AutoConfigureRestDocs
public class ProductApiDocsMaker {

    @Autowired
    public MockMvc mvc;

    public void getApiMakeDocs() throws Exception {
        int id = 1;

        mvc.perform(get("/api/v1/products/" + id))
                .andDo(print())
                .andDo(document("products"));

    }

}
