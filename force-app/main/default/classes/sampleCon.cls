public class sampleCon {
    
    public List<SelectOption> getpicknames()
    {
        set<String> setobj = new set<string>();
        List<SelectOption> options = new List<SelectOption>();
        Schema.DescribeFieldResult ccity = Schema.sObjectType.Opportunity.fields.StageName.getSObjectField().getDescribe();
        options.add(new SelectOption('--None--', '--None--'));
        for(PicklistEntry ent:ccity.getpicklistvalues())
        {
            options .add(new SelectOption(ent.getValue(), ent.getLabel()));
            setobj.add(ent.getvalue());
        }
        return options;
    }
}