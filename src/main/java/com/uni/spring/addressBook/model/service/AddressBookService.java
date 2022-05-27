package com.uni.spring.addressBook.model.service;

import java.util.ArrayList;

import com.uni.spring.addressBook.model.dto.Dept;
import com.uni.spring.member.model.dto.WideMember;

public interface AddressBookService {

	ArrayList<WideMember> selectAllAddList(WideMember wm);

	ArrayList<Dept> selectDeptTitleList(Dept dp);

}
