import { LightningElement } from 'lwc';

export default class SwipeableTabs extends LightningElement {
    
    connectedCallback(){
		var swiper = new swiper(".swiper-container", {
			pagination: ".swiper-pagination",
			slidesPerView: 1,
			paginationClickable: true,
			loop: true,
			paginationBulletRender: function (index, className) {
			  var tabsName = ["Apps", "Tricks", "News", "Games"];
			  if (index === tabsName.length - 1) {
				return (
				  '<span class="' +
				  className +
				  '">' +
				  tabsName[index] +
				  "</span>" +
				  '<div class="active-mark "></div>'
				);
			  }
			  return '<span class="' + className + '">' + tabsName[index] + "</span>";
			}
		  });
		  
    }

}