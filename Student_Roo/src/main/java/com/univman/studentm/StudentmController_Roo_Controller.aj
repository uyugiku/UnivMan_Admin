// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.univman.studentm;

import com.univman.studentm.Studentm;
import com.univman.studentm.StudentmController;
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

privileged aspect StudentmController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String StudentmController.create(@Valid Studentm studentm, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, studentm);
            return "studentms/create";
        }
        uiModel.asMap().clear();
        studentm.persist();
        return "redirect:/studentms/" + encodeUrlPathSegment(studentm.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String StudentmController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Studentm());
        return "studentms/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StudentmController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("studentm", Studentm.findStudentm(id));
        uiModel.addAttribute("itemId", id);
        return "studentms/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StudentmController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("studentms", Studentm.findStudentmEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Studentm.countStudentms() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("studentms", Studentm.findAllStudentms(sortFieldName, sortOrder));
        }
        return "studentms/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String StudentmController.update(@Valid Studentm studentm, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, studentm);
            return "studentms/update";
        }
        uiModel.asMap().clear();
        studentm.merge();
        return "redirect:/studentms/" + encodeUrlPathSegment(studentm.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String StudentmController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Studentm.findStudentm(id));
        return "studentms/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StudentmController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Studentm studentm = Studentm.findStudentm(id);
        studentm.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/studentms";
    }
    
    void StudentmController.populateEditForm(Model uiModel, Studentm studentm) {
        uiModel.addAttribute("studentm", studentm);
    }
    
    String StudentmController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
