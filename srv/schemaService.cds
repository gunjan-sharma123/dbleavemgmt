using { app.schema } from '../db/schema';

service LeaveManagementService @(requires: 'authenticated-user') {

  entity LeaveBalance @(restrict: [
    {
      grant: ['READ'],
      to: ['Employee']
    },
  ]) as projection on schema.LeaveBalance;
  entity LeaveType  @(restrict: [
    {
      grant: ['READ'],
      to: ['Employee']
    }
  ]) as projection on schema.LeaveType;
  entity LeaveRequest  @(restrict: [
    {
      grant: ['READ', 'CREATE', 'UPDATE', 'DELETE'],
      to: ['Employee']
    },
    {
      grant: ['READ', 'CREATE', 'UPDATE', 'DELETE'],
      to: ['Manager']
    },
    {
      grant: ['READ', 'UPDATE'],
      to: ['HR']
    }
  ])as projection on schema.LeaveRequest;

  @readonly
  entity Manager as projection on schema.Manager;

  @readonly
  entity HR as projection on schema.HR

  @readonly
  entity Employees as projection on schema.Employee;

  // @cds.persistence.exists
 @cds.persistence.exists
entity LoggedInUser {
    id : String;
    userRole : String;
}
  


}


//console.log("branch merge")