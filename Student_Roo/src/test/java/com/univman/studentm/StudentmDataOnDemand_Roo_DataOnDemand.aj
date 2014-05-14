// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.univman.studentm;

import com.univman.studentm.Studentm;
import com.univman.studentm.StudentmDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect StudentmDataOnDemand_Roo_DataOnDemand {
    
    declare @type: StudentmDataOnDemand: @Component;
    
    private Random StudentmDataOnDemand.rnd = new SecureRandom();
    
    private List<Studentm> StudentmDataOnDemand.data;
    
    public Studentm StudentmDataOnDemand.getNewTransientStudentm(int index) {
        Studentm obj = new Studentm();
        setFinished(obj, index);
        setMail(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void StudentmDataOnDemand.setFinished(Studentm obj, int index) {
        Boolean finished = false;
        obj.setFinished(finished);
    }
    
    public void StudentmDataOnDemand.setMail(Studentm obj, int index) {
        String mail = "mail_" + index;
        obj.setMail(mail);
    }
    
    public void StudentmDataOnDemand.setName(Studentm obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Studentm StudentmDataOnDemand.getSpecificStudentm(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Studentm obj = data.get(index);
        Long id = obj.getId();
        return Studentm.findStudentm(id);
    }
    
    public Studentm StudentmDataOnDemand.getRandomStudentm() {
        init();
        Studentm obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Studentm.findStudentm(id);
    }
    
    public boolean StudentmDataOnDemand.modifyStudentm(Studentm obj) {
        return false;
    }
    
    public void StudentmDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Studentm.findStudentmEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Studentm' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Studentm>();
        for (int i = 0; i < 10; i++) {
            Studentm obj = getNewTransientStudentm(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
