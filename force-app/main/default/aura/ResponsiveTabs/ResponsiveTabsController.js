({
	doStuff: function(component, event, helper) {
        document.addEventListener('touchstart', function(e) {
            component.set('v.touchStart', e.pageX);
        });
        document.addEventListener('touchend', function(e) {
            component.set('v.touchEnd', e.pageX);
        });
        
        document.addEventListener('mousedown', function(e) {
            console.log(e.pageX);
            component.set('v.touchStart', e.pageX);

        });
        document.addEventListener('mouseup', function(e) {
            console.log(e.pageX);
            component.set('v.touchEnd', e.pageX);
        });
    }
})