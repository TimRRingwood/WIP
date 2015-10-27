package test

import java.io.Serializable


class InfoUsers implements Serializable {
	
	LoginInfo loginInfo
    String username
	String password
	//Integer loginInfoId;
	String firstname
    String middlename
	String lastname
	String address1
	String address2
	String address3
	String address4
    String city
	String state
	String zipcode
	String phone
	String email
	String company
	Integer citizen1
	Integer citizen2
	Integer pocId
	boolean dualCitizen
	boolean immigrantAlien
	String realmID
    String orgID
	String alienNumb
	String alienExp
	String surTitle
	String nickname
	String suffix
	String organizationHier
	String country
	String phone1Ext
    String phone2Ext
	String phone2
	String email2
	String fax
	String position
	String preferredUsernames
	String preferredShell
	String comment
	boolean isGovEmp
	String contractNumber
	String conExp
	
	
	static transients = ['username', 'password', 'poc']
	//static hasOne = [loginInfo: LoginInfo]
	//static belongsTo = [loginInfo: LoginInfo]

	static constraints = {
		firstname(blank:true, nullable:true, maxSize: 50)
		middlename(blank:true, nullable:true, maxSize: 50)
		lastname(blank:true, nullable:true, maxSize: 50)
		nickname(blank:true, nullable:true, maxSize: 50)
		country(blank:true, nullable:true, maxSize: 50)
	    address1(blank:true, nullable:true, maxSize: 50)
		address2(blank:true, nullable:true)
		address4(blank:true, nullable:true)
		address3(blank:true, nullable:true)
		city(blank:true, nullable:true, maxSize: 50)
		state(blank:true, nullable:true, maxSize: 2)
		zipcode(blank:true, nullable:true, maxSize: 10)
		phone(blank:true, nullable:true, maxSize: 15)
		phone1Ext(blank:true, nullable:true, maxSize: 5)
		fax(blank:true, nullable:true, maxSize: 15)
		email(blank:true, nullable:true, maxSize: 50)
		phone2(blank:true, nullable:true, maxSize: 15)
		phone2Ext(blank:true, nullable:true, maxSize: 5)
		email2(blank:true, nullable:true, maxSize: 50)
		surTitle(blank:true, nullable:true)
		nickname(blank:true, nullable:true)
		suffix(blank:true, nullable:true)
		alienNumb(blank:true, nullable:true)
		alienExp(blank:true, nullable:true)
		citizen1(blank:true, nullable:true)
		citizen2(blank:true, nullable:true)
		pocId(blank:true, nullable:true)
		dualCitizen(blank:true, nullable:true)
		immigrantAlien(blank:true, nullable:true)
		realmID(blank:true, nullable:true)
		orgID(blank:true, nullable:true)
		organizationHier(blank:true, nullable:true)
		company(blank:true, nullable:true)
		position(blank:true, nullable:true, maxSize: 50)
		preferredUsernames(blank:true, nullable:true, maxSize: 8)
		preferredShell(blank:true, nullable:true)
		isGovEmp(blank:true, nullable:true)
		comment(blank:true, nullable:true)
		contractNumber(blank:true, nullable:true)
		conExp(blank:true, nullable:true)
  } 
  
	
	
	 def void assignParams(params) {
		//this.loginInfoId = params.int('userId');
		this.firstname = params.firstname;
		this.middlename = params.middlename;
		this.lastname = params.lastname;
		this.citizen1 = params.int('citizen1');
		this.dualCitizen = params.dualCitizen;
		this.citizen2 = params.int('citizen2');
		this.realmID = params.realmID;
		this.orgID = params.orgID;
		this.alienNumb = params.alienNumb;
		this.alienExp = params.alienExp;
		this.surTitle = params.surTitle;
		this.nickname = params.nickname;
		this.suffix = params.suffix;
		this.address1 = params.address1
		this.address2 = params.address2
		this.address3 = params.address3
		this.address4 = params.address4
		this.company = params.company
		this.zipcode = params.zipcode
		this.state = params.state
		this.city = params.city
		this.country = params.country
		this.phone = params.phone
		this.email = params.email
		this.phone1Ext = params.phone1Ext
		this.phone2 = params.phone2
		this.email2 = params.email2
		this.phone2Ext = params.phone2Ext
		this.organizationHier = params.organizationHier
		this.fax = params.fax
		this.position = params.position
		this.isGovEmp = params.boolean('isGovEmp')
	    this.preferredUsernames = params.preferredUsernames
		this.preferredShell = params.preferredShell
		this.comment = params.comment
		this.contractNumber = params.contractNumber;
		this.conExp = params.conExp;
		this.pocId = params.int('pocId');
	} 
}
