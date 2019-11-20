// Helper function to get an existing c3 chart object via the htmlWidgets object
function getC3Chart(id){
  
  // Get the HTMLWidgets object
  var htmlWidgetsObj = HTMLWidgets.find("#" + id);
  
  if( typeof(htmlWidgetsObj) !== "undefined"){
    // Use the getChart method we created to get the underlying C3 chart
    var c3Obj = htmlWidgetsObj.getChart(); 
  }

  return(c3Obj);
}