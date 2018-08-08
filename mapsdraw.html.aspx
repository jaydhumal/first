 <!DOCTYPE html>

<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> -->
<%@ Page Language="C#" %>
    <%@ Register tagprefix="SharePoint" namespace="Microsoft.SharePoint.WebControls" assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
        <html dir="ltr" xmlns="http://www.w3.org/1999/xhtml" xmlns:mso="urn:schemas-microsoft-com:office:office" xmlns:msdt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
            
            <head runat="server">
<meta name="WebPartPageExpansion" content="full" />
<meta name="ProgId" content="SharePoint.WebPartPage.Document" />

<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">



                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>sample map draw page</title>
                <meta http-equiv="X-UA-Compatible" content="IE=10" />
                <!-- Bootstrap -->
                <SharePoint:ScriptLink runat="server" localizable="false" language="javascript" name="core.js"></SharePoint:ScriptLink>

<!--
                <link type="text/css" rel="stylesheet" href="../SiteAssets/css/bootstrap.css" />
                <link type="text/css" rel="stylesheet" href="../SiteAssets/Multi-Level Push Menu/css/component.css" />
                <link type="text/css" rel="stylesheet" href="../SiteAssets/Multi-Level Push Menu/css/demo.css" />
                <link type="text/css" rel="stylesheet" href="../SiteAssets/css/custom.css" />
-->
                <!-- web font -->
                <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400" rel="stylesheet" type="text/css" />
                <!-- plugin css -->
                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
                
              <script src="https://www.decorplanit.com/plugin/autoNumeric-1.9.18.js"></script>
 
                 
  

                 
                 
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.SPServices/0.7.1a/jquery.SPServices-0.7.1a.min.js"></script>
                <!-- if you put Forms7 in a location other than SiteAssets of your current site, be sure to update this reference -->
                <style type="text/css">
                    .legalbutton {
                        color: white!important;
                        text-transform:uppercase; 
                        text-decoration: none;
                        padding-left: 5px;
                        padding-right: 5px;
                    }
                    #suiteBar {
                        display:none!important;
                    }
                    #s4-titlerow {
                        display:none!important;
                    }
                    #sideNavBox {
                        display:none!important;
                    }
                    #contentBox {
                        margin-right: 0px;
                        margin-left: 0px;
                        min-width: 0px;
                    }
                    #s4-bodyContainer {
                        padding-bottom: 0px;

                    }
                    
                    
                             .focused{
					  border: solid 2px red;
					  }

                    
   <!-- JSD01 -->              
   	#input.watermark { 
   	 color:red;
 text-decoration:underline;
   	  }  
      
  
        .row-highlight
        {
            background-color: Yellow;
        }
 
     fieldset {
-webkit-border-radius: 8px;
-moz-border-radius: 8px;
border-radius: 8px;
} 
  



 

.popup-overlay{
  /*Hides pop-up when there is no "active" class*/
  visibility:hidden;
  position:absolute;
  background:#ffffff;
  border:3px solid #666666;
  width:150px;
  height:150px;
  left:25%; 
}
.popup-overlay.active{
  /*displays pop-up when "active" class is present*/
  visibility:visible;
  text-align:center;
}

.popup-content {
  /*Hides pop-up content when there is no "active" class */
 visibility:hidden;
}

.popup-content.active {
  /*Shows pop-up content when "active" class is present */
  visibility:visible;
}

button{
  display:inline-block;
  vertical-align:middle;
  border-radius:30px;
  margin:.20rem;
  font-size: 1rem;
  color:#666666;
  background:   #ffffff;
  border:1px solid #666666;  
}

button:hover{
  border:1px solid #666666;
  background:#666666;
  color:#ffffff;
}


 
  #map {
    height: 100%;
  }
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
 


 
  #legend {
    font-family: Arial, sans-serif;
    background: #fff;
    padding: 10px;
    margin: 10px;
    border: 1px solid #000;
     position:absolute;
 
 
z-index:10;
width:10%;

  }
 
#legend h3 {
        margin-top: 0;
      }


      #legend img {
        vertical-align: middle;
      }
 
#checkbox {
    vertical-align: middle;
}

 

 
.vlr {
    border-left: 6px solid red;
 /*   height: 18px;  */
 
}
 

.vlb {
    border-left: 6px solid blue;
    height: 18px;
}
.vlg {
    border-left: 6px solid green;
    height: 18px;
}
.vly {
    border-left: 6px solid yellow;
    height: 18px;
}

                </style>

<!--

 
                <script src="../SiteAssets/jQuery.Forms7-0.0.07.js"></script>
                <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" />
                <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
                <script src="https://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
   
 -->
            
            <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.css" /> 

 

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.27/jquery.autocomplete.js"></script>


<!-- This stylesheet contains specific styles for displaying
         the map on this page. Replace it with your own styles as
         described in the documentation:
         https://developers.google.com/maps/documentation/javascript/tutorial
    -->
    <link rel="stylesheet" href="/maps/documentation/javascript/cgc/demos.css">
	
<meta name="viewport" content="initial-scale=1.0, width=device-width" />
<link rel="stylesheet" type="text/css" href="https://js.api.here.com/v3/3.0/mapsjs-ui.css?dp-version=1533195059" />
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-core.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-service.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-ui.js"></script>
<script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-mapevents.js"></script>

	
</head>
                
            <body>

 
<!-- <div id="map-canvas" style="height: 800px; width: 1000px;  background-color:#FFFFCC;"></div>   -->

   <div id="map" style="width: 100%; height: 800px; position:relative; background: grey" />

<div id="legend"   style="width:20%; " ><h3>Map Legend</h3>
 
 <div class="vlr">
        <input type="checkbox" id="red" name="red" value="red"    style="padding-left:15px;"   onchange= "dothis(this)" />
 
<!--	<img src="../SiteAssets/red.jpg">  -->
        <label for="scales" style="padding-left:10px;"> </label>
		<span id="rr"></span>	
 
    </div>

    <div class="vlb">
        <input type="checkbox" id="blue" name="blue" style="padding-left:15px;"  onchange= "dothis(this)" value="blue"  />
 

        <label for="horns" style="padding-left:10px;"> </label>
		<span id="bb"></span>	

    </div>

    <div class="vlg">
        <input type="checkbox" id="green" name="green" style="padding-left:15px;"  onchange= "dothis(this)" value="green"  />
 

        <label for="horns" style="padding-left:10px;"> </label>
		<span id="gg"></span>	

    </div>

    <div class="vly">
        <input type="checkbox" id="yellow" name="yellow"  style="padding-left:15px;" onchange= "dothis(this)" 	      value="yellow"  />
 
        <label for="horns" style="padding-left:10px;"> </label>
		<span id="yy"></span>	

    </div>

  <br/>


<div>
    <button type="submit" id="btn">Refresh</button>
  </div>


</div>


  <script  type="text/javascript" charset="UTF-8" >
    

 
 

/**
 * Boilerplate map initialization code starts below:
 */
 
//Step 1: initialize communication with the platform
var platform = new H.service.Platform({
  app_id: 'devportal-demo-20180625',
  app_code: '9v2BkviRwi9Ot26kp2IysQ',
  useHTTPS: true
});


var pixelRatio = window.devicePixelRatio || 1;
var defaultLayers = platform.createDefaultLayers({
  tileSize: pixelRatio === 1 ? 256 : 512,
  ppi: pixelRatio === 1 ? undefined : 320
});

//Step 2: initialize a map 
var map = new H.Map(document.getElementById('map'),
  defaultLayers.normal.map,{
 // center: {lat:50, lng:5},
// position of india 
 center: {lat:28.6071, lng:77.2127},

  zoom: 4,
  pixelRatio: pixelRatio
});


 


//-------------------------
// define variables here 
//-------------------------
var r = b = y = g = 0;

var test = "";


// Create a marker icon from an image URL:

 

// define marker icons 
    var red = new H.map.Icon("https://quantasys-public.sharepoint.com/SiteAssets/red.jpg");
   var green = new H.map.Icon("https://quantasys-public.sharepoint.com/SiteAssets/green.jpg");

   var blue = new H.map.Icon("https://quantasys-public.sharepoint.com/SiteAssets/blue.jpg");
   var yellow = new H.map.Icon("https://quantasys-public.sharepoint.com/SiteAssets/yellow.png");

// define marker groups 

     red_grp = new H.map.Group();
     green_grp = new H.map.Group();
     blue_grp = new H.map.Group();
     yellow_grp = new H.map.Group();

 

//----------------------------------------------
// function the get min & max random numbers
//----------------------------------------------
 function gen(min, max, decimalPlaces) {  
    var rand = Math.random()*(max-min) + min;
    var power = Math.pow(10, decimalPlaces);
    return Math.floor(rand*power) / power;
}

//=----------------------------------
// function to add markers to the map
//=----------------------------------

function add(map)
{

 

// -----------------------------
// do loop baed on a counter
//-----------------------------

for (var i=0; i<1000; i++)
 {
// ger random latitude
   var xx = (gen(0, 200, 3) );

// get longitude value  

   var yy = (gen(0, 200, 4) );

//----------
// red marker
//-----------
 if (xx <= 50.00)
 {

 
// variable test to hold the marker based on random lat & long 

     test = new H.map.Marker({lat:xx, lng:yy}, { icon: red } );

  //   red_grp.addObject(test);
  //    map.removeObject(red_grp);

// add test marker to red group 
 red_grp.addObjects([test]);

// add red group to map 
  map.addObject(red_grp);


// increment counter
     r = r + 1;
  }

//----------
// green marker
//-----------
  if ((xx > 50)  && (xx <=  100.00))
{

//  create green marker based on random lat & long  
     test = new H.map.Marker({lat:xx, lng:yy}, { icon: green } );

// add test marker to green  group 
 green_grp.addObjects([test]);

// add green group to map 
  map.addObject(green_grp);


// counter 
 g = g + 1;

 


}

//-----------------
// yellow  marker
//-----------------
  if (( xx > 100) &&  (xx <=  150.00))
{

// create yellow marker
     test = new H.map.Marker({lat:xx, lng:yy}, { icon: yellow });

// add yellow marker to group 
 yellow_grp.addObjects([test]);

// add group to map 
  map.addObject(yellow_grp);


// counter
 y = y + 1;

}

//----------
// blue  marker
//-----------
  if ( xx > 150.00  )
{

// blue marker
    test = new H.map.Marker({lat:xx, lng:yy}, { icon: blue });

// add blue marker to blue group 
 blue_grp.addObjects([test]);

// add group to map 
  map.addObject(blue_grp);

// counter
 b = b + 1;
}


 //   map.addObject(test);



}

}

 

// -------------------------------
// function to add markers to map 
//-------------------------------
   add(map);


 

 var legend = document.getElementById('legend');
 
// ------------------------
// button click event 
//-------------------------
  $("#btn").click( function()
           {
  //           alert('button clicked');
 

      map.removeObject(red_grp);
 map.removeObject(green_grp); 
 map.removeObject(yellow_grp); 
 map.removeObject(blue_grp); 

 window.location.reload(true);

  // add(map);

           }
        );
 
 
// display icon count in check boxes 
  $('#rr').text(r) ;
  $('#gg').text(g) ;
  $('#bb').text(b) ;
  $('#yy').text(y) ;
 

//--------------------------------
// function on check box event 
//--------------------------------
function dothis(id){

// checked value
  var chk = id.checked;

//id of checked box
  var val = id.defaultValue;

// based on the status of check button and id  
// add or remove the associated markers

switch (chk) { 

	case true: 

	 if (val == "red")
    {       map.removeObject(red_grp);  }
	 if (val == "green")
    {   map.removeObject(green_grp);  }
	 if (val == "blue")
    {  map.removeObject(blue_grp);  }
	 if (val == "yellow")
    {   map.removeObject(yellow_grp);  }

	break;


	case  false: 
	 if (val == "red")
    {      map.addObject(red_grp);  }
	 if (val == "green")
    {  map.addObject(green_grp); }
	 if (val == "blue")
    {   map.addObject(blue_grp);  }
	 if (val == "yellow")
    {  map.addObject(yellow_grp);  }

	break;

}
 



}




//Step 3: make the map interactive
// MapEvents enables the event system
// Behavior implements default interactions for pan/zoom (also on mobile touch environments)

   var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));

// Create the default UI components

 var ui = H.ui.UI.createDefault(map, defaultLayers);

// Now use the map as required...
  //   addMarkersToMap(map);
  </script>

 
 

 
 
                    
 
            </body>
        
        </html>
