public class GetChild {
	 private final List<contact> conLsit;


    public GetChild() {
        conLsit = [SELECT Id, LastName,account.Name from contact where accountId != null ];
    }

    public List<contact> getchildNotes() {

       Return conLsit;
    }
}