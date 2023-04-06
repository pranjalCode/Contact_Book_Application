package com.dao;

import com.entity.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

public class ContactDAO{
	
	private Connection conn;

	public ContactDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean saveContact(Contact c) {
		
		boolean f = false;
		try {
			String sql = "insert into contact(name, email, mobile, userId) values (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhone());
			ps.setInt(4, c.getUserId());
			
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f= true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	
	public List<Contact> getAllContact(int uId){
		
		List<Contact> list = new ArrayList<>();
		
		Contact c = null;
		try {
			String sql = "select * from contact where userId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				c = new Contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhone(rs.getString(4));
				list.add(c);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Contact getContactById(int cid) throws NumberFormatException {
		Contact c = new Contact();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from contact where id = ?");
			ps.setInt(1, cid);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				c.setId(rs.getInt(cid));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhone(rs.getString(4));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	    
		
		return c;
		
	}
	
	public boolean updateContact(Contact c) {
		
		boolean f = false;
		try {
			String sql = "update contact set name=?, email=?, mobile=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhone());
			ps.setInt(4, c.getId());
			
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f= true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteContactById(int id) {
		
		boolean f = false;
		try {
			String sql = "delete from contact where id =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			
			if(i==1) {
				f= true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

}
