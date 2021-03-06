// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.univman.studentm;

import com.univman.studentm.Studentm;
import com.univman.studentm.StudentmDataOnDemand;
import com.univman.studentm.StudentmIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StudentmIntegrationTest_Roo_IntegrationTest {
    
    declare @type: StudentmIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: StudentmIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: StudentmIntegrationTest: @Transactional;
    
    @Autowired
    StudentmDataOnDemand StudentmIntegrationTest.dod;
    
    @Test
    public void StudentmIntegrationTest.testCountStudentms() {
        Assert.assertNotNull("Data on demand for 'Studentm' failed to initialize correctly", dod.getRandomStudentm());
        long count = Studentm.countStudentms();
        Assert.assertTrue("Counter for 'Studentm' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void StudentmIntegrationTest.testFindStudentm() {
        Studentm obj = dod.getRandomStudentm();
        Assert.assertNotNull("Data on demand for 'Studentm' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Studentm' failed to provide an identifier", id);
        obj = Studentm.findStudentm(id);
        Assert.assertNotNull("Find method for 'Studentm' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Studentm' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void StudentmIntegrationTest.testFindAllStudentms() {
        Assert.assertNotNull("Data on demand for 'Studentm' failed to initialize correctly", dod.getRandomStudentm());
        long count = Studentm.countStudentms();
        Assert.assertTrue("Too expensive to perform a find all test for 'Studentm', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Studentm> result = Studentm.findAllStudentms();
        Assert.assertNotNull("Find all method for 'Studentm' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Studentm' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void StudentmIntegrationTest.testFindStudentmEntries() {
        Assert.assertNotNull("Data on demand for 'Studentm' failed to initialize correctly", dod.getRandomStudentm());
        long count = Studentm.countStudentms();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Studentm> result = Studentm.findStudentmEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Studentm' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Studentm' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void StudentmIntegrationTest.testFlush() {
        Studentm obj = dod.getRandomStudentm();
        Assert.assertNotNull("Data on demand for 'Studentm' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Studentm' failed to provide an identifier", id);
        obj = Studentm.findStudentm(id);
        Assert.assertNotNull("Find method for 'Studentm' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyStudentm(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Studentm' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void StudentmIntegrationTest.testMergeUpdate() {
        Studentm obj = dod.getRandomStudentm();
        Assert.assertNotNull("Data on demand for 'Studentm' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Studentm' failed to provide an identifier", id);
        obj = Studentm.findStudentm(id);
        boolean modified =  dod.modifyStudentm(obj);
        Integer currentVersion = obj.getVersion();
        Studentm merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Studentm' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void StudentmIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Studentm' failed to initialize correctly", dod.getRandomStudentm());
        Studentm obj = dod.getNewTransientStudentm(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Studentm' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Studentm' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Studentm' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void StudentmIntegrationTest.testRemove() {
        Studentm obj = dod.getRandomStudentm();
        Assert.assertNotNull("Data on demand for 'Studentm' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Studentm' failed to provide an identifier", id);
        obj = Studentm.findStudentm(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Studentm' with identifier '" + id + "'", Studentm.findStudentm(id));
    }
    
}
