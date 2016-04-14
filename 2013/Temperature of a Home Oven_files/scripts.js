/* Sometimes I feel like I've been tied to the whipping post. */

/* break-out-of-frames */

if (window!= top)
top.location.href=location.href

/* popup slide */

function openSlide(url) { myWindow = window.open(url, 'myWindow', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes,width=640,height=480'); }

/* cctv - watch the cars */

function smallWindow(url) { smallOne = window.open(url, 'smallOne', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no,width=704,height=600'); }
function largeWindow(url) { bigOne = window.open(url, 'bigOne', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no,width=1760,height=960'); }

/* rollover */

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

/*
  vibrantTable()

  written by Ryan Cannon  http://ryancannon.com/

  combines and enhances scripts by Chris Heilmann and David F. Miller.
  alternates color of each row, and highlights a hovered row, as per the
  document's stylesheet. Requires definition of the following styles:
    table.vibrant tr.even
    table.vibrant tr.odd
    table.vibrant td.selected
*/

function vibrantTable() {
  var even = false;
  if ( document.getElementById && document.createTextNode ) {
    var tables = document.getElementsByTagName('table');
    for ( var i=0; i < tables.length; i++ ) {
      var classes_array = tables[i].className.split(' ');
      var isVibrant = false;
      for ( var g = 0; g < classes_array.length; g++ ) {
        if ( classes_array[g] == 'vibrant' )
          isVibrant = true;
      }
      if (  isVibrant ) {
        var trs = tables[i].getElementsByTagName('tr');
        for ( var j =0; j < trs.length; j++ ) {
          if ( trs[j].parentNode.nodeName.toLowerCase() == 'tbody' ) {
            var mytr = trs[j];
            mytr.className= even ? 'even' : 'odd';
            trs[j].onmouseover = function() {
              tds = this.childNodes;
              for ( var k=0; k < tds.length; k++ ) {
                tds[k].className = 'selected';
              }
              return false;
            }
            trs[j].onmouseout = function() {
              tds = this.childNodes;
              for ( var k=0; k < tds.length; k++ ) {
                tds[k].className = '';
              }
              return false;
            }
          }
          even =  ! even;
        }
      }
    }
  }
}
window.addEventListener("load",vibrantTable,false);

/* No Condition Is Permanent. */