/********************************************************************************************************************
 Auth: Drew Napp
 Date: 1/2/06

 Collection of various edit control related functionality
 Comments:
 An ongoing work in progress.  This is a collection of  routines I created because I hate inconstent data, and
 out DB is pretty string centric.  The major gotcha is that this is totally US centric in that it assumes USA
 formatting conventions (probably a bad notions) for phone, etc.  Note:  Some of this stuff is a relic from a
 a website I made back in the dark ages and later Javascrip implementation have the same feature.  Oh, and yes,
 I know how to use regular expressions, but it takes me 3X longer and they are hard to read.  Get over it.
 *********************************************************************************************************************/


var HM_IE = (document.all) ? true : false;

function getControl(ctrlname) {
    var ctrl = null;
    if (typeof(ctrlname) == "string") {
        var namebak = ctrl;
        if (document.getElementById)
        // this is the way the standards work
            ctrl = document.getElementById(ctrlname);
        else if (document.all)
        // this is the way old msie versions work
            ctrl = document.all[ctrlname];
        else if (document.layers)
            // this is the way nn4 works
                ctrl = document.layers[ctrlname];
        if (ctrl == null) {
            ctrl = self.document.forms[0][ctrlname];

            if (ctrl != null && ctrl.length == 2)
                ctrl = ctrl[0].type == "hidden" ? ctrl[1] : ctrl[0];
        }
    }
    else

        if (ctrl == null)
            ctrl = ctrlname;
    return ctrl;
}


function getRadio() {
    for (i = 0; i < document.forms[0].length; i++)
        if (document.forms[0][i].type == 'radio')
            if (document.forms[0][i].checked) {
                return document.forms[0][i].value;
            }
    return "notFound";
}

function getRadio(name) {
    for (i = 0; i < document.forms[0].length; i++)
        if (document.forms[0][i].type == 'radio')
            if (document.forms[0][i].name == name)
                if (document.forms[0][i].checked) {
                    return document.forms[0][i].value;
                }
    return "notFound";
}


//-------------------------------------------------------------------------------------------------
// disableControl																						Author: Drew Napp
//  param	--	descript																		Date: 09/26/05
//    ctr - the text name of the control or control object
//    hide - true to disable, false to enable
// Description:
// Remarks:
//     disableControl(ctrl, hide)
//    function disableControl(ctrl, disable) {
//        if (typeof(ctrl) == "string") {
//            ctrl = document.getElementById(ctrl);
//            }
//        ctrl.disabled = disable;
//        return true;
//    }

function disableControl(ctrl, disable) {
    ctrl = getControl(ctrl);
    ctrl.disabled = disable;
    return true;
}


//-------------------------------------------------------------------------------------------------
// hideControl																						Author: Drew Napp
//  param	--	descript																		Date: 09/26/05
//    ctr - the text name of the control or control object
//    hide - true to hide, false to show
// Description:
// Remarks:
//     hideControl(ctrl, hide)
function hideControl(ctrl, hide) {
    ctrl = getControl(ctrl);
    ctrl.style.visibility = hide ? 'hidden' : 'visible';
}

//-------------------------------------------------------------------------------------------------
// hideDiv																						Author: Drew Napp
//  param	--	descript																		Date: 06/17/2011
//    ctr - the text name of the duve
//    hide - true to hide, false to show
// Description:
// Remarks:
//     hideControl(ctrl, hide)
function hideDiv(name, me) {
    var arn = document.getElementById(name);
    if (me) {
        arn.style.overflow = 'visible';
        arn.style.display = 'none';
    }
    else {
        arn.style.overflow = 'hidden';
        arn.style.display = 'block';
    }

    hideControl(name, me);

}


//-------------------------------------------------------------------------------------------------
// charCnt																						Author: Drew Napp
//  param	--	descript																		Date: 09/26/05
//    c - the control for the edit box (this.<formname>.<control name>)
//    p - control to get the status  (this.<formname>.<control name>)
//    p - maximum length
// Description:
// Remarks:
//     charCnt(this.form.description, this.form.cnt, G_Desc );
var warned = false;
var lastctr = '';

function charCnt(txtctr, cntr, s) {

    if (typeof(txtctr) == "string")
        txtctr = getControl(txtctr);


    cntr = getControl(cntr);

    var l = txtctr.value.length;
    cntr.value = s - l;
    if (l > s) {
        if (!warned && lastctr == txtctr) {
            alert("Maximum size has been exceeded : all other input will be lost");
            warned = true;
        }
        txtctr.value = txtctr.value.substring(0, s);

    }
    lastctr = txtctr;

    return 0;
}


//-------------------------------------------------------------------------------------------------
// setCaptionTitle(docTitle) 			 													Author: Drew Napp
//  docTitle -- String to make the windows title                           Date: 09/25/05
// Description:
// Remarks:
//function setCaptionTitle(doctitle)
//{
//	parent.document.title = ("PIE :  " + doctitle)
//}

//-------------------------------------------------------------------------------------------------
// isNull(objex)																				Author: Drew Napp
//  objex -- Object to check for nullness 											Date: 09/25/05
// Description:
// Remarks:
function isNull(objex)
{
    return objex == 0;
}

//-------------------------------------------------------------------------------------------------
// len(objex)																						Author: Drew Napp
//  objex -- Object to get length from 													Date: 09/25/05
// Description:
// Remarks:
function len(objex)
{
    return objex.length;
}


//-------------------------------------------------------------------------------------------------
// trim																						Author: Drew Napp
//  s -- string to trim
// Description:
// Remove the whitespace from the front and back of a string.
// Remarks:
function trim(s)
{
    // developed by willmaster.com
    while ((s.indexOf(' ', 0) == 0) && (s.length > 1))
    {
        s = s.substring(1, s.length);
    }
    while ((s.lastIndexOf(' ') == (s.length - 1) && (s.length > 1)))
    {
        s = s.substring(0, (s.length - 1));
    }
    if ((s.indexOf(' ', 0) == 0) && (s.length == 1))
        s = '';
    return s;
}


//-------------------------------------------------------------------------------------------------
// left(str, n)			 																   Author: Drew Napp
//  str -- string to get left chars from 												Date: 09/25/05
//  n   -- Number of characters to get
// Description:
//    Copy the left n characters into a new string
// Remarks:
function left(str, n)
{
    if (n <= 0)     // Invalid bound, return blank string
        return "";
    else
        if (n > String(str).length)       // Invalid bound, return
            return str;                    // entire string
        else                             // Valid bound, return appropriate substring
            return String(str).substring(0, n);
}
String.prototype.left = function(n) {
    return left(this, n);
}


//-------------------------------------------------------------------------------------------------
// right(str, n)			 																   Author: Drew Napp
//  str -- string to get left chars from 												Date: 09/25/05
//  n   -- Number of characters to get
// Description:
//    Copy the right n characters into a new string
// Remarks:
function right(str, n)
{
    if (n <= 0)     // Invalid bound, return blank string
        return "";
    else
        if (n > String(str).length)   // Invalid bound, return
            return str;                     // entire string
        else
        { // Valid bound, return appropriate substring
            var iLen = String(str).length;
            return String(str).substring(iLen, iLen - n);
        }
}
String.prototype.right = function(n) {
    return right(this, n);
}


//-------------------------------------------------------------------------------------------------
// mid																						Author: Drew Napp
//  str	--	source string														      Date: 09/25/05
//  start -- starting position
//  len -- Number of characters to copy
// Description:
// Remarks:
function mid(str, start, len)
{
    // Make sure start and len are within proper bounds
    if (start < 0 || len < 0)
        return "";

    var iEnd, iLen = String(str).length;
    if (start + len > iLen)
        iEnd = iLen;
    else
        iEnd = start + len;

    return String(str).substring(start, iEnd);
}
String.prototype.mid = function(start, len) {
    return mid(this, start, len);
}


//-------------------------------------------------------------------------------------------------
// lTrim																						Author: Drew Napp
//  Strip the whitespace off of the left side of string.                Date: 09/25/05
//   str -- string to strip
// Description:
// Remarks:
function lTrim(str)
{
    var whitespace = new String(" \t\n\r");

    var s = new String(str);

    if (whitespace.indexOf(s.charAt(0)) != -1)
    {
        // We have a string with leading blank(s)...

        var j = 0, i = s.length;

        // Iterate from the far left of string until we
        // don't have any more whitespace...
        while (j < i && whitespace.indexOf(s.charAt(j)) != -1)
            j++;


        // Get the substring from the first non-whitespace
        // character to the end of the string...
        s = s.substring(j, i);
    }

    return s;
}
String.prototype.lTrim = function() {
    return lTrim(this);
}


//-------------------------------------------------------------------------------------------------
// rTrim																						Author: Drew Napp
//  Strip the whitespace off of the Right side of string.                Date: 09/25/05
//   str -- string to strip
// Description:
// Remarks:
function rTrim(str)
{
    // We don't want to trip JUST spaces, but also tabs,
    // line feeds, etc.  Add anything else you want to
    // "trim" here in Whitespace
    var whitespace = new String(" \t\n\r");

    var s = new String(str);

    if (whitespace.indexOf(s.charAt(s.length - 1)) != -1) {
        // We have a string with trailing blank(s)...

        var i = s.length - 1;       // Get length of string

        // Iterate from the far right of string until we
        // don't have any more whitespace...
        while (i >= 0 && whitespace.indexOf(s.charAt(i)) != -1)
            i--;

        // Get the substring from the front of the string to
        // where the last non-whitespace character is...
        s = s.substring(0, i + 1);
    }

    return s;
}
String.prototype.rTrim = function() {
    return rTrim(this);
}

//-------------------------------------------------------------------------------------------------
// uCase																						Author: Drew Napp
//  tempstr	--	string to uppercase			                              Date: 09/25/05
// Description:
//  Return an uppercase version of a string.
// Remarks:
function uCase(tmpstr)
{
    return tmpstr.toUpperCase();
}
String.prototype.uCase = function() {
    return uCase(this);
}


//-------------------------------------------------------------------------------------------------
// roundNumber                                                              Author: Drew Napp
//  num	--	number to round                                                 Date: 09/25/05
// dec  --  number of decimal places to round to
// Description:
//  Return a number rounded to the number of decimal places.
// Remarks:
function roundNumber(num, dec) {
    var result = Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec);
    return result;
}


//-------------------------------------------------------------------------------------------------
// inStr																						Author: Drew Napp
//  prime -- string to search															Date: 09/25/05
//  exts -- the string to find.
// Description:
// Remarks:
function inStr(prime, exts)
{
    return prime.indexOf(exts);
}

String.prototype.inStr = function(exts) {
    return inStr(this, exts);
}


//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function isAlpha(str)
{
    // Return immediately if an invalid value was passed in
    if (str + "" == "undefined" || str + "" == "null" || str + "" == "")
        return false;

    var isValid = true;

    str += ""; // convert to a string for performing string comparisons.

    // Loop through string one character at time, breaking out of for
    // loop when an non Alpha character is found.
    for (i = 0; i < str.length; i++)
    {
        // Alpha must be between "A"-"Z", or "a"-"z"
        if (!( ((str.charAt(i) >= "a") && (str.charAt(i) <= "z")) ||
               ((str.charAt(i) >= "A") && (str.charAt(i) <= "Z")) ))
        {
            isValid = false;
            break;
        }
    } // end for loop

    return isValid;

    return true;
} // end IsAlpha
String.prototype.isAlpha = function() {
    return isAlpha(this);
}


//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function isNumeric(chr)
{
    switch (chr)
            {
        case '1' : return true;
        case '2' : return true;
        case '3' : return true;
        case '4' : return true;
        case '5' : return true;
        case '6' : return true;
        case '7' : return true;
        case '8' : return true;
        case '9' : return true;
        case '0' : return true;
        case '.' : return true;
        default  : return false;
    }
}

//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function isNoise(chr)
{
    switch (chr)
            {
        case ' ' : return true;
        case '\'' : return true;
        case '&quot' : return true;
        case '&amp' : return true;
        default  : return false;
    }
}

//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function filterAlpha(sString)
{
    if (isNull(sString))
    {
        return "";
    }

    sOut = ""
    for (nCharPos = 0; nCharPos < len(sString); nCharPos++)
    {
        sChar = uCase(mid(sString, nCharPos, 1));
        if (isAlpha(sChar))
            sOut += sChar;
    }

    return sOut;
}


//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function filterNumeric(sString)
{
    if (isNull(sString))
    {
        return "";
    }
    sOut = ""

    for (nCharPos = 0; nCharPos < len(sString); nCharPos++)
    {
        sChar = uCase(mid(sString, nCharPos, 1));
        if (isNumeric(sChar))
            sOut += sChar;
    }
    return sOut;
}

//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function filterAlphaNumeric(sString, extra)
{
    if (isNull(sString))
    {
        return "";
    }

    sOut = ""
    for (nCharPos = 0; nCharPos < len(sString); nCharPos++)
    {
        sChar = uCase(mid(sString, nCharPos, 1));
        if (isAlpha(sChar) || isNumeric(sChar) || extra.indexOf(sChar) >= 0)
            sOut += sChar;
    }

    return sOut;
}


//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function strip(value)
{
    var len = 0;
    while (value.charAt(len) == ' ')
        len++;

    if (len)
        value = value.substring(len, value.length);

    len = value.length - 1;
    while (value.charAt(len) == ' ')
        len--;

    if (len != (value.length - 1    ))
        value = value.substring(len, value.length);
    return value;
}

//-------------------------------------------------------------------------------------------------
// formatPhone(thevalue, countryCode)
//  thevalue -- String, candidate value                                            Date: 09/25/05
//  countryCode -- string value of the country of residence for the number. (only U.S. numbers are validated)
// Description:
// Remarks:
function formatPhone(thevalue, country)
{

    if (country != "United States") return thevalue;

    var phone = thevalue.toUpperCase();

    var buffer = "";
    for (lp = 0; lp < phone.length; lp++)
    {                            // Strip out all "junk" (e.g. ( ) - . etc)
        if (isNumeric(phone.charAt(lp)))
            buffer = buffer + phone.substr(lp, 1);
    }
    // Does it start with 1?  ie 18001231234
    if (buffer.length == 11 && buffer.charAt(0) == '1')
    {                            // Pull it off (this may be a good flag candidate
        buffer = buffer.substring(1, buffer.length);
    }
    // Do we have the right number of numbers ??
    if (buffer.length != 10)
    {
        //alert("U.S. phone numbers should be in the form ###-###-####");
        return thevalue;
    }
    ///var returnstr="xxx-xxx-xxxx";
    // Put it in the ###-###-#### format
    return buffer.substr(0, 3) + "-" + buffer.substr(3, 3) + "-" + buffer.substr(6, 4);


}

//-------------------------------------------------------------------------------------------------
// formatPhone(thevalue, appendex)                                           Author: Drew Napp
//  thevalue -- String, candidate value                                            Date: 09/25/05
//  appendex -- Boolean, true to add on extension if one (e.g. "715-552-8734 x123")
// Description:
// Remarks:
function formatPhoneOriginal(thevalue, appendex)
{
    var extenlist = new Array("EXTENSION", "EXTEN.", "EXTEN", "EXT.", "EXT", "X.", "X");
    var phone = thevalue.toUpperCase();
    var exten = "";

    for (lp = 0; lp < extenlist.length; lp++)
    {
        var index = phone.indexOf(extenlist[lp]);
        if (index >= 0)            // Found an extension
        {                               // Cut the string into it's components
            exten = phone.substring(index + extenlist[lp].length, phone.length);
            phone = phone.substring(0, index);
            exten = strip(exten);
            break;
        }
    }

    var buffer = "";
    for (lp = 0; lp < phone.length; lp++)
    {                            // Strip out all "junk" (e.g. ( ) - . etc)
        if (isNumeric(phone.charAt(lp)))
            buffer = buffer + phone.substr(lp, 1);
    }
    // Does it start with 1?  ie 18001231234
    if (buffer.charAt(0) == '1')
    {                            // Pull it off (this may be a good flag candidate
        buffer = buffer.substring(1, buffer.length);
    }
    // Do we have the right number of numbers ??
    if (buffer.length != 10)
    {
        alert("Phone should be in the form ###-###-#### EXT ####");
        return thevalue;
    }
    ///var returnstr="xxx-xxx-xxxx";
    // Put it in the ###-###-#### format
    var returnstr = buffer.substr(0, 3) + "-" + buffer.substr(3, 3) + "-" + buffer.substr(6, 4);

    if (exten.length && appendex)// if we have an extension, and we are adding them
        returnstr = returnstr + " x" + exten;

    return returnstr;
}

//-------------------------------------------------------------------------------------------------
// formatDate(thevalue)                                                          Author: Drew Napp
//  thevalue -- String, candidate value                                            Date: 09/25/05
// Description:
// Remarks:
function formatDate(datestr) {

    var delims = new String(' ./-');
    var delim = "";

    for (lp = 0; lp < delims.length; lp++) {
        var xar = datestr.split(delims.charAt(lp));
        if (xar.length == 3) {
            delim = delims.charAt(lp);
            break;
        }
    }
    //alert("xar.length = " + xar.length + "  delim.length=" + delim.length);
    if (delim.length > 0)
        return (
                (xar[0].length == 1 ? "0" + xar[0] : xar[0]) + "/" +
                (xar[1].length == 1 ? "0" + xar[1] : xar[1]) + "/" +
                (xar[2].length == 2 ? "20" + xar[2] : xar[2])
                );

    datestr = filterNumeric(datestr);
    //alert("datestr =" + datestr);

    datestr = strip(datestr);

    if (datestr.length == 0)
        return "";

    return (
            datestr.substring(0, 2) + "/" +
            datestr.substring(2, 4) + "/" +
            (datestr.length == 6 ?
             "20" + datestr.substring(4, 6) :
             datestr.substring(4, 8) )
            );

    return datestr;
}

function formatDate2(datestr) {
    return formatDate(datestr);
}

//-------------------------------------------------------------------------------------------------
// formatnumber(thevalue)                                                        Author: Drew Napp
//  thevalue -- String, candidate value                                            Date: 09/09/06
// Description:
// Remarks:
function formatNumber(thevalue)
{
    var wkv = strip(thevalue).toUpperCase();

    if (wkv == null || wkv.length <= 0)
        return "";

    var dpos = inStr(wkv, '.');                         // Find the decimal and the exponent (if any)
    var epos = inStr(wkv, 'E');

    var evalu = 0;                                      // This will be the exponential value

    if (epos > -1) {                                     // an 'E' was found, get the value after and shorten string
        evalu = parseInt(wkv.right(wkv.length - epos - 1));
        wkv = wkv.left(epos);
    }
    // Get the whole number part, the filter will drop formatting

    var whole = filterNumeric(wkv.left((dpos >= 0) ? dpos : wkv.length));
    // and the decimal.  The filter will drop any key value
    var decim = filterNumeric(wkv.right((dpos >= 0) ? (wkv.length - dpos - 1) : 0));

    //alert("1 whole = " + whole + " , decim = " + decim);

    var cnt = 0;                                        // Count leading zeros
    while (cnt < whole.length && whole.charAt(cnt) == '0') {
        cnt ++;
    }

    if (cnt > 0)                                        // and remove them
        whole = whole.right(whole.length - cnt);

    if (whole.length == 0)                              // Nothing before the zip?  Make it 0  (as in 0.123)
        whole = '0';

    //alert("2 whole = " + whole + " , decim = " + decim);

    if (isAlpha(right(wkv, 1))) {                        // Does this string still end in a character
        switch (uCase(right(wkv, 1)))
                {
            case 'K' :
                evalu = 3;
                break;
            case 'M' :
                evalu = 6;
                break;
            case 'B' :
                evalu = 9;
                break;
            case 'T' :
                evalu = 12;
                break;
            case 'Q' :
                evalu = 15;
                break;
        }
    }
    // Loop for the exponential value
    while (evalu--) {
        // alert("loop whole = " + whole + " , decim = " + decim);
        if (decim.length > 0) {                          // if there is decimal fraction, slide it forward
            if (whole.charAt(0) != "0")
                whole += decim.charAt(0);
            else
                whole = decim.charAt(0);
            decim = decim.right(decim.length - 1);
        }
        else
            if (whole.charAt(0) != "0")
                whole += "0";                           // Otherwise, add 0s if it is not a zero
    }

    // alert("3 whole = " + whole + " , decim = " + decim);

    // now we want to format the number
    var tmpw = whole;                                   // Copy the whole value,
    whole = "";
    cnt = 1;
    for (i = tmpw.length - 1; i >= 0; i--) {               // Go right to left, and add commas where required
        if (cnt > 3) {
            whole = ',' + whole;
            cnt = 1;
        }
        cnt ++;
        whole = tmpw.charAt(i) + whole;
        //alert("whole = " + whole + " cnt = " + cnt);
    }
    // Now we will strip any leading zeros (it can happen)
    if (whole.length == 0)
        whole = '0';

    if (decim.length > 0)                               // Finally, if there is a decimal left, add it
        whole = whole + "." + decim;

    if (thevalue.charAt(0) == '-')                      // replace the sign if there was one
        whole = '-' + whole;

    //alert("thevalue = " + whole );

    return whole

}


//-------------------------------------------------------------------------------------------------
// checkPOBox(thevalue)                                              		Author: Drew Napp
//  thevalue -- Convert a PObox to a common format                         Date: 09/25/05
// Description:
//  Returns "PO Box 1234"
// Remarks:
function checkPOBox(thevalue)
{
    var poboxlist = new Array("POBOX", "PO BOX", "P.O. BOX", "P. O.", "PO_BOX", "P.O.B.", "POB", "BOX");
    var pobox = thevalue.toUpperCase();

    if (pobox == "X")
        return "X";

    for (lp = 0; lp < poboxlist.length; lp++)
    {
        var index = pobox.indexOf(poboxlist[lp]);
        if (index >= 0)
        {
            pobox = pobox.substring(index + poboxlist[lp].length, pobox.length);

            break;
        }
    }
    if (pobox.length > 0)
        return "PO Box " + pobox;
    else
        return "";
}


//-------------------------------------------------------------------------------------------------
// validateState(thevalue)                                                 Author: Drew Napp
//  thevalue -- the string to check	                                       Date: 09/25/05
// Description:
// Remarks:
function validateState(thevalue)
{
    var statelist = "-AL-AK-AZ-AR-CA-CO-CT-DE-DC-FL-GA-GU-HI-ID-IL-IN-IA-KS-KY-LA-ME-MD-MA-MI-MN-MS-MO-MT-NE-NV-NH-NJ-NM-NY-NC-ND-OH-OK-OR-PA-PR-RI-SC-SD-TN-TX-UT-VT-VA-VI-WA-WV-WI-WY-AB-BC-MB-NB-NF-NS-PE-ON-QC-SK-";

    var stateval = thevalue.toUpperCase();
    if (statelist.indexOf(stateval) > 0)
        return stateval;
    alert(thevalue + " is not a valid state, territory, or province code");
    return "";
}


//-------------------------------------------------------------------------------------------------
// checkPrefix(thevalue)                                                   Author: Drew Napp
//  thevalue -- string to check against                                    Date: 09/25/05
// Description:
// Remarks:
/*function checkPrefix(thevalue)
 {
 var tempvalue = filterAlpha(thevalue)
 tempvalue = tempvalue.toUpperCase();
 if (tempvalue.length == 0)
 return "";

 switch (tempvalue)
 {
 case "MR"   : return  "Mr"; break;
 case "MRS"  : return  "Mrs"; break;
 case "MISS" : return  "Miss"; break;
 case "MS"   : return  "Ms"; break;
 case "DR"   : return  "Dr"; break;
 case "MAJ"  : return  "Maj"; break;
 case "CPT"  : return  "CPT"; break;
 case "CAPT" : return  "CPT"; break;
 case "LT"   : return  "LT"; break;
 case "GEN"  : return  "Gen"; break;
 case "REV"  : return  "Rev"; break;
 case "FR"   : return  "Fr"; break;
 case "SR"   : return  "Sr"; break;
 case "HON"  : return  "Hon"; break;
 case "X"		: return "X"; break;
 default:
 alert("I don't know what \"" + thevalue + "\" is...are you sure?");
 return thevalue;
 }
 }
 */
//-------------------------------------------------------------------------------------------------
// checkSuffix(thevalue)                                                   Author: Drew Napp
//  thevalue -- string to check against                                    Date: 09/25/05
// Description:
// Remarks:
/*function checkSuffix(thevalue)
 {

 var tempvalue = filterAlpha(thevalue);
 tempvalue = tempvalue.toUpperCase();

 if (tempvalue.length == 0)
 return "";

 switch (tempvalue)
 {
 case "CPA" 	: return  "CPA"; break;
 case "EDD"  	: return  "EdD"; break;
 case "JD" 	: return  "JD"; break;
 case "JR" 	: return  "Jr"; break;
 case "LCPC" 	: return  "LCPC"; break;
 case "MA"  	: return  "MA"; break;
 case "MAED"  	: return  "MAEd"; break;
 case "MD" 	: return  "MD"; break;
 case "MPA"  	: return  "MPA"; break;
 case "PHD"  	: return  "PhD"; break;
 case "RN" 	: return  "RN"; break;
 case "SR"  	: return  "Sr"; break;
 case "THD"  	: return  "ThD"; break;
 case "II"  	: return  "II"; break;
 case "III"  	: return  "III"; break;
 case "IV" 	: return  "IV"; break;
 case "X"		: return "X"; break;
 default:
 alert("I don't know what \"" + thevalue + "\" is...are you sure?");
 return thevalue;
 }
 }
 */
//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function checkZip(thevalue)
{
    var tempvalue = filterNumeric(thevalue);
    //assert("now its " + tempvalue);
    if (tempvalue.length == 9)
        tempvalue = Left(tempvalue, 5) + "-" + Right(tempvalue, 4);
    else
        if (tempvalue.length != 5)
            alert(thevalue + " does not look like a valid Zip Code to me.");
    return tempvalue;


}

//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
NoLower = 1;

function toWordCaps(InString)
{
    bToUpper = true;
    //alert("arguments.length = " + arguments.length + " and arguments[2] = " + arguments[2]);
    if (arguments.length == 2 && arguments[1] == NoLower)
        TestString = InString;
    else
        TestString = InString.toLowerCase();

    RetString = "";

    for (lp = 0; lp < TestString.length; lp++)
    {
        chrt = TestString.charAt(lp);
        if (bToUpper)
            RetString += chrt.toUpperCase();
        else
            RetString += chrt;
        bToUpper = (chrt == ' ');
    }
    return RetString;

}


//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:
function checkemail(emailStr) {

    /* The following pattern is used to check if the entered e-mail address
     fits the user@domain format.  It also is used to separate the username
     from the domain. */
    var emailPat = /^(.+)@(.+)$/
    /* The following string represents the pattern for matching all special
     characters.  We don't want to allow special characters in the address.
     These characters include ( ) < > @ , ; : \ " . [ ]    */
    var specialChars = "\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
    /* The following string represents the range of characters allowed in a
     username or domainname.  It really states which chars aren't allowed. */
    var validChars = "\[^\\s" + specialChars + "\]"
    /* The following pattern applies if the "user" is a quoted string (in
     which case, there are no rules about which characters are allowed
     and which aren't; anything goes).  E.g. "jiminy cricket"@disney.com
     is a legal e-mail address. */
    var quotedUser = "(\"[^\"]*\")"
    /* The following pattern applies for domains that are IP addresses,
     rather than symbolic names.  E.g. joe@[123.124.233.4] is a legal
     e-mail address. NOTE: The square brackets are required. */
    var ipDomainPat = /^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
    /* The following string represents an atom (basically a series of
     non-special characters.) */
    var atom = validChars + '+'
    /* The following string represents one word in the typical username.
     For example, in john.doe@somewhere.com, john and doe are words.
     Basically, a word is either an atom or quoted string. */
    var word = "(" + atom + "|" + quotedUser + ")"
    // The following pattern describes the structure of the user
    var userPat = new RegExp("^" + word + "(\\." + word + ")*$")
    /* The following pattern describes the structure of a normal symbolic
     domain, as opposed to ipDomainPat, shown above. */
    var domainPat = new RegExp("^" + atom + "(\\." + atom + ")*$")


    /* Finally, let's start trying to figure out if the supplied address is
     valid. */
    emailStr = emailStr.toLowerCase();

    if (emailStr == "x")
        return "X";

    /* Begin with the coarse pattern to simply break up user@domain into
     different pieces that are easy to analyze. */
    var matchArray = emailStr.match(emailPat)
    if (matchArray == null) {
        /* Too many/few @'s or something; basically, this address doesn't
         even fit the general mould of a valid e-mail address. */
        alert("Email address seems incorrect (check @ and .'s)")
        return emailStr;
    }
    var user = matchArray[1]
    var domain = matchArray[2]

    // See if "user" is valid
    if (user.match(userPat) == null) {
        // user is not valid
        alert("The username doesn't seem to be valid.")
        return emailStr;
    }

    /* if the e-mail address is at an IP address (as opposed to a symbolic
     host name) make sure the IP address is valid. */
    var IPArray = domain.match(ipDomainPat)
    if (IPArray != null) {
        // this is an IP address
        for (var i = 1; i <= 4; i++) {
            if (IPArray[i] > 255) {
                alert("Destination IP address is invalid!")
                return emailStr;
            }
        }
        return emailStr;
    }

    // Domain is symbolic name
    var domainArray = domain.match(domainPat)
    if (domainArray == null) {
        alert("The domain name doesn't seem to be valid.")
        return emailStr;
    }

    /* domain name seems valid, but now make sure that it ends in a
     three-letter word (like com, edu, gov) or a two-letter word,
     representing country (uk, nl), and that there's a hostname preceding
     the domain or country. */

    /* Now we need to break up the domain to get a count of how many atoms
     it consists of. */
    var atomPat = new RegExp(atom, "g")
    var domArr = domain.match(atomPat)
    var len = domArr.length
    if (domArr[domArr.length - 1].length < 2 ||
        domArr[domArr.length - 1].length > 3) {
        // the address must end in a two letter or three letter word.
        alert("The address must end in a three-letter domain, or two letter country.")
        return emailStr;
    }

    // Make sure there's a host name preceding the domain.
    if (len < 2) {
        var errStr = "This address is missing a hostname!"
        alert(errStr)
        return emailStr;
    }

    // If we've gotten this far, everything's valid!
    return emailStr;
}


function toggle(obj) {
    var sibling;
    if (obj.nextSibling.nodeType == 3) {
        sibling = obj.nextSibling.nextSibling;
    }
    else {
        sibling = obj.nextSibling;
    }
    sibling.style.display = (sibling.style.display == 'none') ? 'block' : 'none';
}

function openDialog(target, xsize, ysize) {
    var param = 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=yes, width=' + xsize + ', height= ' + ysize + ',top=0,left=0';
    var handle = window.open(target, 'new_window', param);
}


// --------------------------------------------------------------------------
//
/*
 function reportError(msg,url,line)
 {
 var str = "Err: " + msg + " on line: "
 + line + "\nURL: " + url  + "\nWeb: "
 + navigator.appName + " " + navigator.appName
 + " " + navigator.appVersion;
 document.errform.error.value = str;
 return true;
 }
 */

//-------------------------------------------------------------------------------------------------
// Function																						Author: Drew Napp
//  param	--	descript																		Date: 09/25/05
// Description:
// Remarks:


