({
    handleClick : function(component, event, helper) {
        console.log('This is handle Click Method');
        component.set('V.MyName','K.Anil Kumar');
        component.set('V.MyPhoneNum','9000219093');
    },
    CreatingConstructor : function(component){
    console.log('This is Constructor Function');
	}
 })