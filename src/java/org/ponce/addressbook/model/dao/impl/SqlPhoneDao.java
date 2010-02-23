package org.ponce.addressbook.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

import org.ponce.addressbook.controller.actions.CommonActions;
import org.ponce.addressbook.model.Entity;
import org.ponce.addressbook.model.Phone;
import org.ponce.addressbook.model.ReferenceLink;
import org.ponce.addressbook.model.dao.PhoneDao;

public class SqlPhoneDao extends AbstractSqlDao implements PhoneDao<Entity> {

    @Override
    protected void fillValues(Entity entity, ResultSet rs) throws SQLException {
	final Phone phone = (Phone) entity;
	phone.setId(rs.getInt(1));
	phone.setHousePhone(rs.getString(2));
	phone.setMobilePhone(rs.getString(3));
	phone.setWorkPhone(rs.getString(4));
    }

    @Override
    protected String getFields(Entity entity, CommonActions action) {
	String out = "";
	final Phone phone = (Phone) entity;
	switch (action) {
	case CREATE:
	    out = "(null,'" + phone.getHousePhone() + "','"
		    + phone.getMobilePhone() + "','" + phone.getWorkPhone()
		    + "');";
	    break;

	case UPDATE:
	    out = "HOUSE_PHONE='" + phone.getHousePhone() + "',MOBILE_PHONE='"
		    + phone.getMobilePhone() + "',WORK_PHONE='"
		    + phone.getWorkPhone() + "'";
	    break;
	}
	return out;
    }

    @Override
    protected String getTableName() {
	// TODO make it constant
	return "PHONE";
    }

    @Override
    public void loadReferences(Entity entity, Class<?> clazz) {
	// not used
    }

    @Override
    protected Entity loadValues(ResultSet rs) throws SQLException {
	Phone phone = new Phone();
	fillValues(phone, rs);

	return phone;
    }

    @Override
    protected Collection<ReferenceLink> getReferences(Entity entity) {
	// TODO Auto-generated method stub
	return null;
    }

}
