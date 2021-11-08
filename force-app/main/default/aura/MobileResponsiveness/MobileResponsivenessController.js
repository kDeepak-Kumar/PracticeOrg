({
	navigateToVizient : function(component, event, helper) {
		window.location.href = "https://www.vizientinc.com/";
	},
    
    navigateTow3schools : function(component, event, helper) {
		window.open("https://www.w3schools.com");
	},
    
    navigateToMobileView : function(component, event, helper) {
		window.location.href = window.location.href+"mobileview";
	},
    touchmove: function(component, event, helper) {     
         if(!event.touches || event.touches.length == 0)return;
         var xmoved =  event.touches[0].clientX;
        alert('touch event');
        //do stuff
},
     
    
    
})