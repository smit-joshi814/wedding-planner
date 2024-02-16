package com.wedding.planner.utils;


import java.sql.Clob;
import java.sql.SQLException;

import javax.sql.rowset.serial.SerialClob;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Service;

@Service
public class UtilityService implements Converter<String, Clob>{

	@Override
	public Clob convert(String source) {
		try {
			return new SerialClob(source.toCharArray());
		} catch (SQLException ex) {
			return null;
		}
	}
}
