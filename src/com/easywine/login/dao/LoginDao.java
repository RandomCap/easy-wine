package com.easywine.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.easywine.user.pojo.User;
import com.mysql.jdbc.Statement;

@Repository("loginDao")
public class LoginDao {
	
	@Autowired
	private JdbcTemplate loginJdbcTemplate;

	public User findUserByLoginnameOrEmailAndPwd(String sql) {
		User user = new User();
		user = loginJdbcTemplate.queryForObject(sql, new RowMapper<User>(){

			public User mapRow(ResultSet rs, int arg1) throws SQLException {
				User u = new User();
				
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setGender(rs.getInt("gender"));
				u.setBirthday(rs.getDate("birthday"));
				u.setCreate_date(rs.getDate("create_date"));
				u.setPhone(rs.getString("phone"));
				u.setEmail(rs.getString("email"));
				u.setQq(rs.getInt("qq"));
				u.setLogin_name(rs.getString("login_name"));
				
				return u;
			}
		});
		return user;
	}

	public List<Integer> findUserByNameOrEmailOrPhone(String sql) {
		List<Integer> list = new ArrayList<Integer>();
		list = loginJdbcTemplate.query(sql, new RowMapper<Integer>(){

			public Integer mapRow(ResultSet rs, int arg1) throws SQLException {
				return rs.getInt("id");
			}
		});
		
		return list;
	}

	public Integer insertNewUser( final String sql, final User user, final String pwd) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		loginJdbcTemplate.update(new PreparedStatementCreator() {
			//INSERT INTO ( name, gender, status, create_date , phone , email , login_name, login_pwd )
			public PreparedStatement createPreparedStatement(Connection connection)
					throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS); 
				
				ps.setString(1, user.getName());
				ps.setInt(2, user.getGender());
				ps.setInt(3, user.getStatus());
				//ps.setDate(4, new java.sql.Date(user.getCreate_date().getTime()));
				ps.setString(4, user.getPhone());
				ps.setString(5, user.getEmail());
				ps.setString(6, user.getName());
				ps.setString(7, pwd);
				
				return ps;
			}
			
		}, keyHolder);
		
		 final int id = keyHolder.getKey().intValue();
		String fsql = "INSERT INTO user_sys_filter( user_id, note_photo_count) VALUES( ?,? )";
		loginJdbcTemplate.update( fsql, new PreparedStatementSetter() {

			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setInt(1, id);
				ps.setInt(2, 5);
				
			} 
			
		});
		
		return id;
	}

}
