global class CustomDynamicPicklist extends VisualEditor.DynamicPickList {

    // dynamic picklist creator
    
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('account', 'Account');
        return defaultValue;
    }
    global override VisualEditor.DynamicPickListRows getValues() {
        
        VisualEditor.DynamicPickListRows  pickList = new VisualEditor.DynamicPickListRows();
        List<VisualEditor.DataRow> dataRowsList = new List<VisualEditor.DataRow>();
        
        for(Schema.sobjectType sobjectTypeName:schema.getGlobalDescribe().values()){
            
            VisualEditor.DataRow rowObj = new VisualEditor.DataRow(sobjectTypeName.getDescribe().getLabel(),sobjectTypeName.getDescribe().getName());
            dataRowsList.add(rowObj);
            
        }
          pickList.addAllRows(dataRowsList);
        return pickList;
    }
}