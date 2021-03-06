package com.hp.up.business.service.impl;

import com.hp.up.business.repository.BaseRepository;
import com.hp.up.business.service.BaseService;
import com.hp.up.core.Entity.BaseEntity;
import com.hp.up.core.common.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * @Author haopeng
 * @Date 2017/9/7 17:09
 */
public abstract class BaseServiceImpl <E extends BaseEntity> implements BaseService<E> {

    protected static final Logger logger = LoggerFactory.getLogger(BaseService.class);

    protected BaseRepository<E> baseRepository;


    @Override
    @Cacheable(value = "resourceCache", key = "#id", condition = "#id gt 0")
    public E getById(Long id) {
        logger.info(Constants.LOGPREFIX+ "query from database !");
        return baseRepository.get(id);
    }

    @Override
    public List<E> getByIds(List<Long> ids) {
        List<E> entities = new LinkedList<E>();
        for (Long id : ids) {
            E entity = getById(id);
            if (entity != null) {
                entities.add(entity);
            }
        }
        return entities;
    }

    @Override
    @Cacheable(value = "resourceCache", key = "#id", condition = "#id gt 0")
    public Boolean exists(Long id) {
        return getById(id) != null;
    }

    @Override
    public List<E> getAll() {
        return baseRepository.getAll();
    }

    @Override
    @Transactional
    //@CachePut(value = "resourceCache", key = "#entity.id")
    public int save(E entity) {
        entity.setCreateDate(new Date());
        int count = baseRepository.save(entity);
        return count;
    }

    @Override
    public void save(List<E> entities) {
        for (E entity : entities) {
            save(entity);
        }
    }

    @Override
    public E saveAndReturn(E entity) {
        save(entity);
        if (entity.getId() != null) {
            return getById(entity.getId());
        }
        return null;
    }

    @Override
    @CacheEvict(value = { "resourceCache"}, key = "#id", condition = "#id gt 0")
    public int remove(Long id) {
        E entity = getById(id);
        if (entity != null) {
            entity.beforRemove();
            int count = baseRepository.remove(id);
            entity.afterRemove();
            return count;
        }
        return 0;
    }

    @Override
    public void remove(List<Long> ids) {
        for (Long id : ids) {
            remove(id);
        }
    }

    //@CachePut(value = "resourceCache", key = "#entity.id")
    @Override
    @CacheEvict(value = { "resourceCache"}, key = "#entity.id", condition = "#entity.id gt 0",beforeInvocation=true)
    public E update(E entity) {
        entity.beforUpdate();
        if (entity.getModifyDate() == null) {
            entity.setModifyDate(new Date());
        }
        int count = baseRepository.update(entity);
        if (count > 0 && entity.getId() != null && entity.getId() > 0) {
            entity = getById(entity.getId());
            if (entity != null) {
                entity.afterUpdate();
            }
        }
        return entity;
    }

    @Override
    public Long getCount() {
        long count = baseRepository.getCount();
        return count > 0 ? count : 0L;
    }


    @Override
    public abstract   void afterPropertiesSet() throws Exception ;
}
