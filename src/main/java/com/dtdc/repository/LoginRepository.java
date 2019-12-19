package com.dtdc.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.dtdc.model.Login;

@Repository
public interface LoginRepository extends CrudRepository<Login,Integer> {

	@Query("select l.loginId from Login l where l.userName=:userName and  l.password=:password and l.userType=:userType")
	public Integer getLoginCount(@Param("userName")String userName,@Param("password")String password,@Param("userType")String userType);
}
