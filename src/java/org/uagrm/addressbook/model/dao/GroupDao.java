package org.uagrm.addressbook.model.dao;

import java.util.Set;

import org.uagrm.addressbook.model.Group;

/**
 * @author Timoteo Ponce
 * 
 */
public interface GroupDao extends GenericDao<Group> {

    static final String TABLE_NAME = "GROUPS";
    static final String TABLE_GROUP_CONTACTS = "GROUP_CONTACTS";

    Set<Group> getByContact(final Integer contactId);

    void saveContacts(Group group);
}