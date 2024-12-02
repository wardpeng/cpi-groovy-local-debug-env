<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="EmpEmployment">
    <EmpEmployment>
      <xsl:for-each select="EmpEmployment">
        <EmpEmployment>
        	<!-- Followings are for data logic  -->
          <xsl:copy-of select="assignmentClass"/>
          <xsl:copy-of select="userId"/>
          
          <!-- Followings are for file output -->
          <personIdExternal>
            <xsl:value-of select="personNav/PerPerson/personIdExternal"/>
          </personIdExternal>
          <xsl:copy-of select="customString1"/>
          <lastName>
            <xsl:value-of select="personNav/PerPerson/personalInfoNav/PerPersonal/lastName"/>
          </lastName>
          <middleName>
            <xsl:value-of select="personNav/PerPerson/personalInfoNav/PerPersonal/middleName"/>
          </middleName>
          <firstName>
            <xsl:value-of select="personNav/PerPerson/personalInfoNav/PerPersonal/firstName"/>
          </firstName>
          <thirdName>
          	<xsl:value-of select="personNav/PerPerson/personalInfoNav/PerPersonal/thirdName"/>
          </thirdName>
          <firstNameAlt1>
            <xsl:value-of select="personNav/PerPerson/personalInfoNav/PerPersonal/firstNameAlt1"/>
          </firstNameAlt1>
          <lastNameAlt1>
            <xsl:value-of select="personNav/PerPerson/personalInfoNav/PerPersonal/lastNameAlt1"/>
          </lastNameAlt1>
      		<cust_legacyCodeString6>
      			<xsl:value-of select="jobInfoNav/EmpJob/customString6Nav/cust_subSection/cust_legacyCode"/>
      		</cust_legacyCodeString6>
      		<dateOfBirth>
            <xsl:value-of select="personNav/PerPerson/dateOfBirth"/>
      		</dateOfBirth>
      		<cardType>
            <xsl:value-of select="personNav/PerPerson/nationalIdNav/PerNationalId[cardType='HKID1']/cardType"/>
      		</cardType>
      		<nationalId>
            <xsl:value-of select="personNav/PerPerson/nationalIdNav/PerNationalId[cardType='HKID1']/nationalId"/>
      		</nationalId>
      		<company>
            <xsl:value-of select="jobInfoNav/EmpJob/company"/>
      		</company>
      		<startDate>
            <xsl:value-of select="startDate"/>
      		</startDate>
      		<employeeClass>
            <xsl:value-of select="jobInfoNav/EmpJob/employeeClass"/>
      		</employeeClass>
      		<employeeClassExternalCode>
            <xsl:value-of select="jobInfoNav/EmpJob/employeeClassNav/PicklistOption/externalCode"/>
      		</employeeClassExternalCode>
      		<customString14>
            <xsl:value-of select="jobInfoNav/EmpJob/customString14"/>
      		</customString14>
      	<!-- 	<status>
            <xsl:value-of select="jobInfoNav/EmpJob/emplStatusNav/PicklistOption/status"/>
      		</status> -->
      		<seqNumbermpJob>
            <xsl:value-of select="jobInfoNav/EmpJob/seqNumber"/>
      		</seqNumbermpJob>
      		<startDateEmpJob>
            <xsl:value-of select="jobInfoNav/EmpJob/startDate"/>
      		</startDateEmpJob>
      		<endDateEmpJob>
            <xsl:value-of select="jobInfoNav/EmpJob/endDate"/>
      		</endDateEmpJob>
      		<cust_legacyCodeCostCenterNav>
            <xsl:value-of select="jobInfoNav/EmpJob/costCenterNav/FOCostCenter/cust_legacyCode"/>
      		</cust_legacyCodeCostCenterNav>
      		<jobCodeEmpJob>
                <xsl:value-of select="jobInfoNav/EmpJob/jobCode"/>
      		</jobCodeEmpJob>
      		<jobCode>
      		<!-- CR 20340530, change to jobCodeNav/cust_legacyCode -->
           <!--  <xsl:value-of select="jobInfoNav/EmpJob/jobCode"/> -->
           <xsl:value-of select="jobInfoNav/EmpJob/jobCodeNav/FOJobCode/cust_legacyCode"/>
      		</jobCode>
      		<cust_legacyCodeDepartmentNav>
            <xsl:value-of select="jobInfoNav/EmpJob/departmentNav/FODepartment/cust_legacyCode"/>
      		</cust_legacyCodeDepartmentNav>
      		<!-- CR 20240729, Refer the table below, if Cust_legacyCode is blank in EmpJob\cxustomString8Nav, look for the value in per entity/field in the line below until a value is found, outbound the filed as Department ID and stop. -->
      		<cust_legacyCodeString8><xsl:value-of select="jobInfoNav/EmpJob/customString8Nav/cust_team/cust_legacyCode"/></cust_legacyCodeString8>
            <cust_legacyCodeString7><xsl:value-of select="jobInfoNav/EmpJob/customString7Nav/cust_unit/cust_legacyCode"/></cust_legacyCodeString7>
            <!--<cust_legacyCodeString6><xsl:value-of select="jobInfoNav/EmpJob/customString6Nav/cust_subSection/cust_legacyCode"/></cust_legacyCodeString6>-->
            <cust_legacyCodeString5><xsl:value-of select="jobInfoNav/EmpJob/customString5Nav/cust_section/cust_legacyCode"/></cust_legacyCodeString5>
            <cust_legacyCodeDepartment><xsl:value-of select="jobInfoNav/EmpJob/departmentNav/FODepartment/cust_legacyCode"/></cust_legacyCodeDepartment>
            <cust_legacyCodeDvision><xsl:value-of select="jobInfoNav/EmpJob/divisionNav/FODivision/cust_legacyCode"/></cust_legacyCodeDvision>
            <cust_legacyCodeCompany><xsl:value-of select="jobInfoNav/EmpJob/companyNav/FOCompany/externalCode"/></cust_legacyCodeCompany>
            
      		<holidayCalendarCode>
            <xsl:value-of select="jobInfoNav/EmpJob/holidayCalendarCode"/>
      		</holidayCalendarCode>
      		<standardHours>
            <xsl:value-of select="jobInfoNav/EmpJob/standardHours"/>
      		</standardHours>
      		<payGrade>
            <xsl:value-of select="jobInfoNav/EmpJob/payGrade"/>
      		</payGrade>
      		<customString13>
            <xsl:value-of select="jobInfoNav/EmpJob/customString13"/>
      		</customString13>
      		<privatePhoneNumber>
      			<xsl:value-of select="personNav/PerPerson/phoneNav/PerPhone[phoneTypeNav/PicklistOption/externalCode='PM']/phoneNumber"/>
     			</privatePhoneNumber>
      	  <homePhoneNumber>
      	  	<xsl:value-of select="personNav/PerPerson/phoneNav/PerPhone[phoneTypeNav/PicklistOption/externalCode='H']/phoneNumber"/>
     	  	</homePhoneNumber>
      		<code>
      			<!-- 2024.03.13 CR: MAILCOUNTRY - Peraddressdeflt\countryNav  - territoryCode -->
            <!-- <xsl:value-of select="jobInfoNav/EmpJob/companyNav/FOCompany/countryOfRegistrationNav/Country/code"/> -->
            <xsl:value-of select="personNav/PerPerson/homeAddressNavDEFLT/PerAddressDEFLT/countryNav/Territory/territoryCode"/>
      		</code>
      		<externalName_en_GB>
      			<!-- 2024.03.13 CR: MAILCOUNTRYDESC - Peraddressdeflt\countryNav - territoryName -->
            <!-- <xsl:value-of select="jobInfoNav/EmpJob/companyNav/FOCompany/countryOfRegistrationNav/Country/externalName_en_GB"/> -->
            <xsl:value-of select="personNav/PerPerson/homeAddressNavDEFLT/PerAddressDEFLT/countryNav/Territory/territoryName"/>
      		</externalName_en_GB>
      		<address1>
            <xsl:value-of select="personNav/PerPerson/homeAddressNavDEFLT/PerAddressDEFLT/address1"/>
      		</address1>
      		<address2>
            <xsl:value-of select="personNav/PerPerson/homeAddressNavDEFLT/PerAddressDEFLT/address2"/>
      		</address2>
      		<city>
            <xsl:value-of select="personNav/PerPerson/homeAddressNavDEFLT/PerAddressDEFLT/cityNav/PicklistOption/localeLabel"/>
      		</city>
      		<externalCodeStateNav>
            <xsl:value-of select="personNav/PerPerson/homeAddressNavDEFLT/PerAddressDEFLT/stateNav/PicklistOption/externalCode"/>
      		</externalCodeStateNav>
      		<state>
            <xsl:value-of select="personNav/PerPerson/homeAddressNavDEFLT/PerAddressDEFLT/stateNav/PicklistOption/localeLabel"/>
      		</state>
      		<zipCode>
            <xsl:value-of select="personNav/PerPerson/homeAddressNavDEFLT/PerAddressDEFLT/zipCode"/>
      		</zipCode>
      		<nameFODepartment>
            <xsl:value-of select="jobInfoNav/EmpJob/departmentNav/FODepartment/name"/>
      		</nameFODepartment>
      		<gender>
            <xsl:value-of select="personNav/PerPerson/personalInfoNav/PerPersonal/gender"/>
      		</gender>
      		<workscheduleCode>
            <xsl:value-of select="jobInfoNav/EmpJob/workscheduleCode"/>
      		</workscheduleCode>
      		<customString17>
            <xsl:value-of select="jobInfoNav/EmpJob/customString17"/>
      		</customString17>
          <secondaryExternalCode><xsl:value-of select="SecondaryAssignmentsItem/SecondaryAssignments_externalCode"/></secondaryExternalCode>
      		
		      <!-- Following fields are for SC_FilterEmpEmploymentByStatus: Active&Inactive filter  -->
		      <!-- status=ACTIVE when /User/status ='t' 
      		status=INACTIVE when /User/status ='f'  -->
		      <xsl:choose>
		        <xsl:when test="userNav/User/status ='t'">
		          <empJobStatus>ACTIVE</empJobStatus>
		        </xsl:when>
		        <xsl:otherwise>
		        	<empJobStatus>INACTIVE</empJobStatus>
		        </xsl:otherwise>
		      </xsl:choose>		
		      <empJobStatusExternalCode>
		      	<xsl:value-of select="userNav/User/status"/>
	      	</empJobStatusExternalCode>
		      <activeUserIdPerPersonIdExternal/>
		      <inActiveUserIdPerPersonIdExternal/>
		      <userIdEmpEmploymentTermination>
		      	<xsl:value-of select="EmpEmploymentTermination/userId"/>
	      	</userIdEmpEmploymentTermination>
		      <userONB2Process>
		      	<xsl:value-of select="ONB2Process/user"/>
	      	</userONB2Process>
		      <processStatusONB2Process>
		      	<xsl:value-of select="ONB2Process/processStatus"/>
	      	</processStatusONB2Process>
          
        </EmpEmployment>
      </xsl:for-each>
    </EmpEmployment>
  </xsl:template>

</xsl:stylesheet>