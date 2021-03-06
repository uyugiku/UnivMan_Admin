// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.univman.finishedstudent;

import com.univman.finishedstudent.FinishedStudent;
import com.univman.finishedstudent.FinishedStudentController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect FinishedStudentController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FinishedStudentController.create(@Valid FinishedStudent finishedStudent, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, finishedStudent);
            return "finishedstudents/create";
        }
        uiModel.asMap().clear();
        finishedStudent.persist();
        return "redirect:/finishedstudents/" + encodeUrlPathSegment(finishedStudent.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FinishedStudentController.createForm(Model uiModel) {
        populateEditForm(uiModel, new FinishedStudent());
        return "finishedstudents/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FinishedStudentController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("finishedstudent", FinishedStudent.findFinishedStudent(id));
        uiModel.addAttribute("itemId", id);
        return "finishedstudents/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FinishedStudentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("finishedstudents", FinishedStudent.findFinishedStudentEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) FinishedStudent.countFinishedStudents() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("finishedstudents", FinishedStudent.findAllFinishedStudents(sortFieldName, sortOrder));
        }
        return "finishedstudents/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FinishedStudentController.update(@Valid FinishedStudent finishedStudent, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, finishedStudent);
            return "finishedstudents/update";
        }
        uiModel.asMap().clear();
        finishedStudent.merge();
        return "redirect:/finishedstudents/" + encodeUrlPathSegment(finishedStudent.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FinishedStudentController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, FinishedStudent.findFinishedStudent(id));
        return "finishedstudents/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FinishedStudentController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FinishedStudent finishedStudent = FinishedStudent.findFinishedStudent(id);
        finishedStudent.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/finishedstudents";
    }
    
    void FinishedStudentController.populateEditForm(Model uiModel, FinishedStudent finishedStudent) {
        uiModel.addAttribute("finishedStudent", finishedStudent);
    }
    
    String FinishedStudentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
