package com.univman.studentm;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "studentm", finders = { "findStudentmsByNameLikeAndMailLike" })
public class Studentm {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @NotNull
    private String mail;

    /**
     */
    @NotNull
    private Boolean finished = false;
}
