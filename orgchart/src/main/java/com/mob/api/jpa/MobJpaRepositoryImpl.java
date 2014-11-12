package com.mob.api.jpa;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public class MobJpaRepositoryImpl<T, ID extends Serializable> extends SimpleJpaRepository<T, ID> implements MobJpaRepository<T, ID> {

    private final EntityManager entityManager;
    private final Class<T> domainClass;
    
    public MobJpaRepositoryImpl(final Class<T> domainClass, final EntityManager entityManager) {
        super(domainClass, entityManager);
        this.entityManager = entityManager;
        this.domainClass = domainClass;
    }

    @Override
    public T getReference(final ID id) {
        return entityManager.getReference(domainClass, id);
    }

}
