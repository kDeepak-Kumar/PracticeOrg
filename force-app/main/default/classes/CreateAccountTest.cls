@isTest(seeAllData = true)
public class CreateAccountTest
{
  static testMethod void testInsertaccount()
  {
  Account a= new Account();
  a.Name = 'RamRam';
      a.Phone = '1234645';
      insert a;
  }
}