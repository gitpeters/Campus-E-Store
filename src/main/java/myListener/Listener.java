package myListener;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import connection.DbConnection;

public class Listener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		try {
			Connection con = DbConnection.connection();
			String sql1 = "create database campusestock";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.executeUpdate();

			String sql2 = "create table campusestock.vendor(vendorId varchar(200), vendorName varchar(200), vendorEmail varchar(200), vendorMatricNo varchar(200), vendorPassword varchar(200), vendorBrandName varchar(200), vendorSchoolId longBlob)";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.executeUpdate();

			String sql3 = "create table campusestock.product(productId varchar(200), vendorId varchar(200), productName varchar(200), datePosted date, productStatus varchar(200), productSample1 longBlob, prodcutSample2 longBlob, productSample3 longblob, adsStatus varchar(200), brandName varchar(200), keywords varchar(500), productAmount double)";
			PreparedStatement ps3 = con.prepareStatement(sql3);
			ps3.executeUpdate();

			String sql4 = "create table campusestock.productads(productId varchar(200), vendorId varchar(200), adsId varchar(200), adsAmount varchar(200), adsStartDate date, adsEndDate date, adsStatus varchar(200), adsDuration varchar(200))";
			PreparedStatement ps4 = con.prepareStatement(sql4);
			ps4.executeUpdate();

			String sql5 = "create table campusestock.admin(adminId varchar(200), adminUsername varchar(200), adminPassword varchar(200))";
			PreparedStatement ps5 = con.prepareStatement(sql5);
			ps5.executeUpdate();
			
			String sql6 = "create table campusestock.position(username varchar(200), position varchar(200))";
			PreparedStatement ps6 = con.prepareStatement(sql6);
			ps6.executeUpdate();
			
			String sql7 = "create table campusestock.login_credential(username varchar(200), password varchar(200), position varchar(200))";
			PreparedStatement ps7 = con.prepareStatement(sql7);
			ps7.executeUpdate();

		} catch (SQLException e) {
			System.out.println("Schema/table already exsit!");
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	}

}
