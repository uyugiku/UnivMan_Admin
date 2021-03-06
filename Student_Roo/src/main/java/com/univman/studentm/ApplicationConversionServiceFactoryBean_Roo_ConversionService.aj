// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.univman.studentm;

import com.univman.finishedstudent.FinishedStudent;
import com.univman.information.Information;
import com.univman.studentm.ApplicationConversionServiceFactoryBean;
import com.univman.studentm.Studentm;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<FinishedStudent, String> ApplicationConversionServiceFactoryBean.getFinishedStudentToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.univman.finishedstudent.FinishedStudent, java.lang.String>() {
            public String convert(FinishedStudent finishedStudent) {
                return new StringBuilder().append(finishedStudent.getName()).append(' ').append(finishedStudent.getMail()).toString();
            }
        };
    }
    
    public Converter<Long, FinishedStudent> ApplicationConversionServiceFactoryBean.getIdToFinishedStudentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.univman.finishedstudent.FinishedStudent>() {
            public com.univman.finishedstudent.FinishedStudent convert(java.lang.Long id) {
                return FinishedStudent.findFinishedStudent(id);
            }
        };
    }
    
    public Converter<String, FinishedStudent> ApplicationConversionServiceFactoryBean.getStringToFinishedStudentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.univman.finishedstudent.FinishedStudent>() {
            public com.univman.finishedstudent.FinishedStudent convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), FinishedStudent.class);
            }
        };
    }
    
    public Converter<Information, String> ApplicationConversionServiceFactoryBean.getInformationToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.univman.information.Information, java.lang.String>() {
            public String convert(Information information) {
                return new StringBuilder().append(information.getTitle()).append(' ').append(information.getInformationDate()).append(' ').append(information.getBody()).toString();
            }
        };
    }
    
    public Converter<Long, Information> ApplicationConversionServiceFactoryBean.getIdToInformationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.univman.information.Information>() {
            public com.univman.information.Information convert(java.lang.Long id) {
                return Information.findInformation(id);
            }
        };
    }
    
    public Converter<String, Information> ApplicationConversionServiceFactoryBean.getStringToInformationConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.univman.information.Information>() {
            public com.univman.information.Information convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Information.class);
            }
        };
    }
    
    public Converter<Studentm, String> ApplicationConversionServiceFactoryBean.getStudentmToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.univman.studentm.Studentm, java.lang.String>() {
            public String convert(Studentm studentm) {
                return new StringBuilder().append(studentm.getName()).append(' ').append(studentm.getMail()).toString();
            }
        };
    }
    
    public Converter<Long, Studentm> ApplicationConversionServiceFactoryBean.getIdToStudentmConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.univman.studentm.Studentm>() {
            public com.univman.studentm.Studentm convert(java.lang.Long id) {
                return Studentm.findStudentm(id);
            }
        };
    }
    
    public Converter<String, Studentm> ApplicationConversionServiceFactoryBean.getStringToStudentmConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.univman.studentm.Studentm>() {
            public com.univman.studentm.Studentm convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Studentm.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getFinishedStudentToStringConverter());
        registry.addConverter(getIdToFinishedStudentConverter());
        registry.addConverter(getStringToFinishedStudentConverter());
        registry.addConverter(getInformationToStringConverter());
        registry.addConverter(getIdToInformationConverter());
        registry.addConverter(getStringToInformationConverter());
        registry.addConverter(getStudentmToStringConverter());
        registry.addConverter(getIdToStudentmConverter());
        registry.addConverter(getStringToStudentmConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
