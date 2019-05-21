package com.my.spring.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.my.spring.exception.AdvertException;
import com.my.spring.exception.UserException;
import com.my.spring.pojo.Advert;
import com.my.spring.pojo.Category;

public class AdvertDAO extends DAO {

    public Advert create(Advert advert)
            throws AdvertException {
        try {
            begin();            
            getSession().save(advert);     
            commit();
            return advert;
        } catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create advert", e);
            throw new AdvertException("Exception while creating advert: " + e.getMessage());
        }
    }

    public void delete(Advert advert)
            throws AdvertException {
        try {
            begin();
            getSession().delete(advert);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw new AdvertException("Could not delete advert", e);
        }
    }
    
    public List<Advert> list() throws AdvertException{
    	
    	try {
            begin();
            Query q = getSession().createQuery("from Advert");
            List<Advert> adverts = q.list();
            commit();
            return adverts;
        } catch (HibernateException e) {
            rollback();
            throw new AdvertException("Could not delete advert", e);
        }
    	
    }
    public Advert getAdvert(int advIDno) {
        try {
            begin();
            Query q = getSession().createQuery("from Advert where id=:advID");
            q.setLong("advID", advIDno);
            Advert adv = (Advert) q.uniqueResult();
            //System.out.println(user.getUsertype());
            commit();
            return adv;
        } catch (HibernateException e) {
            rollback();
            try {
                throw new AdvertException("Could not get Advert " + advIDno, e);
            } catch (AdvertException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }
        return null;
    }
}