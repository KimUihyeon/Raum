package com.kuh.mysql.ddl.generator.util;

import com.kuh.mysql.ddl.generator.enums.ProgramingLanguage;
import com.kuh.mysql.ddl.generator.enums.ProgramingLanguageOption;

/**
 * @author kuh
 * @since 2020.03.23
 */
public class TemplateReader {

    public static class setting {

        private ProgramingLanguage language;
        private ProgramingLanguageOption option;

        public void language(ProgramingLanguage language){
            this.language = language;
        }

        public void option(ProgramingLanguageOption option){
            this.option = option;
        }

        public String read() throws Exception {
            return new TemplateReader().read(this.language , this.option);
        }
    }

    private String read(ProgramingLanguage language, ProgramingLanguageOption optional) throws Exception {
        switch (language) {
            case NONE: {
                throw new Exception("language enum not definition");
            }
        }

        return ";";
    }
}
