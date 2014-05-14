package com.univman.studentm;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/studentms")
@Controller
@RooWebScaffold(path = "studentms", formBackingObject = Studentm.class)
@RooWebFinder
public class StudentmController {
}
