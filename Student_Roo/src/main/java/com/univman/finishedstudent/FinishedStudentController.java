package com.univman.finishedstudent;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/finishedstudents")
@Controller
@RooWebScaffold(path = "finishedstudents", formBackingObject = FinishedStudent.class)
public class FinishedStudentController {
}
