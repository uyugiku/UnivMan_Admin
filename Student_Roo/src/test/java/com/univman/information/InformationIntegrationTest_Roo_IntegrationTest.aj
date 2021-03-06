// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.univman.information;

import com.univman.information.Information;
import com.univman.information.InformationDataOnDemand;
import com.univman.information.InformationIntegrationTest;
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

privileged aspect InformationIntegrationTest_Roo_IntegrationTest {
    
    declare @type: InformationIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: InformationIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: InformationIntegrationTest: @Transactional;
    
    @Autowired
    InformationDataOnDemand InformationIntegrationTest.dod;
    
    @Test
    public void InformationIntegrationTest.testCountInformations() {
        Assert.assertNotNull("Data on demand for 'Information' failed to initialize correctly", dod.getRandomInformation());
        long count = Information.countInformations();
        Assert.assertTrue("Counter for 'Information' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void InformationIntegrationTest.testFindInformation() {
        Information obj = dod.getRandomInformation();
        Assert.assertNotNull("Data on demand for 'Information' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Information' failed to provide an identifier", id);
        obj = Information.findInformation(id);
        Assert.assertNotNull("Find method for 'Information' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Information' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void InformationIntegrationTest.testFindAllInformations() {
        Assert.assertNotNull("Data on demand for 'Information' failed to initialize correctly", dod.getRandomInformation());
        long count = Information.countInformations();
        Assert.assertTrue("Too expensive to perform a find all test for 'Information', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Information> result = Information.findAllInformations();
        Assert.assertNotNull("Find all method for 'Information' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Information' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void InformationIntegrationTest.testFindInformationEntries() {
        Assert.assertNotNull("Data on demand for 'Information' failed to initialize correctly", dod.getRandomInformation());
        long count = Information.countInformations();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Information> result = Information.findInformationEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Information' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Information' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void InformationIntegrationTest.testFlush() {
        Information obj = dod.getRandomInformation();
        Assert.assertNotNull("Data on demand for 'Information' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Information' failed to provide an identifier", id);
        obj = Information.findInformation(id);
        Assert.assertNotNull("Find method for 'Information' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyInformation(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Information' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void InformationIntegrationTest.testMergeUpdate() {
        Information obj = dod.getRandomInformation();
        Assert.assertNotNull("Data on demand for 'Information' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Information' failed to provide an identifier", id);
        obj = Information.findInformation(id);
        boolean modified =  dod.modifyInformation(obj);
        Integer currentVersion = obj.getVersion();
        Information merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Information' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void InformationIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Information' failed to initialize correctly", dod.getRandomInformation());
        Information obj = dod.getNewTransientInformation(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Information' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Information' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Information' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void InformationIntegrationTest.testRemove() {
        Information obj = dod.getRandomInformation();
        Assert.assertNotNull("Data on demand for 'Information' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Information' failed to provide an identifier", id);
        obj = Information.findInformation(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Information' with identifier '" + id + "'", Information.findInformation(id));
    }
    
}
