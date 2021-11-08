public class GetAccounts
{
    public List<Contact> Contact {set;get;}
    public GetAccounts()
    {
        Contact = [Select Lastname, Phone from Contact where phone!=null];
    }
}