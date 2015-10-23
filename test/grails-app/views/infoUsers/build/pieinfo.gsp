<html>
<head>
    <meta http-equiv="Content-Type"
    content="text/html; charset=UTF-8"/>
    <meta name="layout" content="hpc" />
    <title>PIE Info</title>
    

         
     <script type="text/javascript" id="js1">
    
        $(document).ready(function() {
 
    
            var tc1 = $("#hidCitizen1").val()* 1;       
            var tc2 = $("#hidCitizen2").val() * 1;
            $("#citizen1").val(tc1);
            $("#citizen2").val(tc2);          
         

            var v = tc1 != '0' && tc2 != '0';
            if (v) {
                $('#dualCitizen').attr("checked", true);
                $("#2Citizen").removeClass('hidden');
            }
            else {
                $('#dualCitizen').attr("checked", false);
                $("#2Citizen").addClass('hidden');
            }

            $('#dualCitizen').change(function() {
                if(this.checked) $("#2Citizen").removeClass('hidden');
                else {
                    $("#2Citizen").addClass('hidden');
                    $("#citizen2").val("0");
                }
            });
            
            try {
	           $(".cal").datepicker( {
	               showOn: "button",
	                buttonImage: "/test/assets/cal.gif",
	                buttonImageOnly: false,
	                dateFormat: 'mm/dd/yy'
	           });

	           //$("#alienExp").datepicker();
	            
	            	            
	            //$("#viewAgreement").css('display', $("#newUserAgreement").val() ? 'none': 'block');
	            //$("#agreementSuccess").css('display', $("#newUserAgreement").val() ? 'block': 'none');
                $(".tip").each(function() {
			        $(this).parent().tooltip({
			            content: function() {return $(this).find(".tip").html();}  ,
			            items: $(this).parent(),
			            tooltipClass: "pieTooltip"
			        })
			    });
            
            
            }
            catch(e) {
               alert(e.message);
            }
         });
        
       </script>
</head>
<body>
    <div class="body">
        <h1>PIE INFO</h1>
        <g:if test="${message}">
            <div class="message">${message}</div>
        </g:if>
        <g:hasErrors bean="${command}">
            <div class="errors">
                <g:renderErrors bean="${command}" as="list" />
            </div>
        </g:hasErrors>
        <g:if test="${pwd != null}">
            Generated Password For You Is: ${pwd}
        </g:if>
        <g:form action="build">
   
        <input type="hidden" id="userId" name="userId" value="${user.id}" />
        <input type="hidden" id="hidCitizen1" name="hidCitizen1" value="${info.citizen1}" />
        <input type="hidden" id="hidCitizen2" name="hidCitizen2" value="${info.citizen2}" />
                   
            <div class="dialog">
                <table>
                <tbody>
                     <tr class="required">
	                   <td colspan="2">
	                     Items highlighted in blue are mandatory information
	                   </td>
	                </tr>
	                
<tr class="required">
    <td>
        
        
        
        Citizenship:
    </td>
    <td>
        
            <select name="citizen1" onchange="changeCitizenship(this.value);" id="citizen1"><option selected="selected" value="">Select Citizenship</option>
                <option value="1">United States</option>
<option value="2">United States Minor Outlying Islands</option>
<option value="3">United States Misc. Caribbean Islands</option>
<option value="4">United States Misc. Pacific Islands</option>
<option value="5">Afghanistan</option>
<option value="6">Albania</option>
<option value="7">Algeria</option>
<option value="8">American Samoa</option>
<option value="9">Andorra</option>
<option value="10">Angola</option>
<option value="11">Anguilla</option>
<option value="12">Antarctica</option>
<option value="13">Antigua And Barbuda</option>
<option value="14">Argentina</option>
<option value="15">Armenia</option>
<option value="16">Aruba</option>
<option value="17">Australia</option>
<option value="18">Austria</option>
<option value="19">Azerbaijan</option>
<option value="20">Bahamas</option>
<option value="21">Bahrain</option>
<option value="22">Bangladesh</option>
<option value="23">Barbados</option>
<option value="24">Belarus</option>
<option value="25">Belgium</option>
<option value="26">Belize</option>
<option value="27">Benin</option>
<option value="28">Bermuda</option>
<option value="29">Bhutan</option>
<option value="30">Bolivia</option>
<option value="31">Bosnia And Herzegovina</option>
<option value="32">Botswana</option>
<option value="33">Bouvet Island</option>
<option value="34">Brazil</option>
<option value="35">British Indian Ocean Territory</option>
<option value="36">Brunei Darussalam</option>
<option value="37">Bulgaria</option>
<option value="38">Burkina Faso</option>
<option value="39">Burma</option>
<option value="40">Burundi</option>
<option value="41">Byelorussian Ssr</option>
<option value="42">Cambodia</option>
<option value="43">Cameroon</option>
<option value="44">Canada</option>
<option value="45">Cape Verde</option>
<option value="46">Cayman Islands</option>
<option value="47">Central African Republic</option>
<option value="48">Chad</option>
<option value="49">Chile</option>
<option value="50">China</option>
<option value="51">Christmas Island</option>
<option value="52">Cocos (Keeling) Islands</option>
<option value="53">Colombia</option>
<option value="54">Comoros</option>
<option value="55">Congo</option>
<option value="56">Cook Islands</option>
<option value="57">Costa Rica</option>
<option value="58">Cote D'Ivoire</option>
<option value="59">Croatia</option>
<option value="60">Cuba</option>
<option value="61">Cyprus</option>
<option value="62">Czech Republic</option>
<option value="63">Denmark</option>
<option value="64">Djibouti</option>
<option value="65">Dominica</option>
<option value="66">Dominican Republic</option>
<option value="67">East Timor</option>
<option value="68">Ecuador</option>
<option value="69">Egypt</option>
<option value="70">El Salvador</option>
<option value="71">Equatorial Guinea</option>
<option value="72">Eritrea</option>
<option value="73">Estonia</option>
<option value="74">Ethiopia</option>
<option value="75">Falkland Islands</option>
<option value="76">Faroe Islands</option>
<option value="77">Fiji</option>
<option value="78">Finland</option>
<option value="79">France</option>
<option value="80">France (Metropolitan)</option>
<option value="81">French Guiana</option>
<option value="82">French Polynesia</option>
<option value="83">French Southern Territories</option>
<option value="84">Gabon</option>
<option value="85">Gambia</option>
<option value="86">Gaza Strip</option>
<option value="87">Georgia</option>
<option value="88">Germany</option>
<option value="89">Ghana</option>
<option value="90">Gibraltar</option>
<option value="91">Greece</option>
<option value="92">Greenland</option>
<option value="93">Grenada</option>
<option value="94">Guadeloupe</option>
<option value="95">Guam</option>
<option value="96">Guatemala</option>
<option value="97">Guinea</option>
<option value="98">Guinea-Bissau</option>
<option value="99">Guyana</option>
<option value="100">Haiti</option>
<option value="101">Heard And Mcdonald Islands</option>
<option value="102">Honduras</option>
<option value="103">Hong Kong</option>
<option value="104">Hungary</option>
<option value="105">Iceland</option>
<option value="106">India</option>
<option value="107">Indonesia</option>
<option value="108">Iran</option>
<option value="109">Iraq</option>
<option value="110">Iraq-Saudi Arabia Neutral Zone</option>
<option value="111">Ireland</option>
<option value="112">Israel</option>
<option value="113">Italy</option>
<option value="114">Jamaica</option>
<option value="115">Japan</option>
<option value="116">Johnston Atoll</option>
<option value="117">Jordan</option>
<option value="118">Kazakhstan</option>
<option value="119">Kenya</option>
<option value="120">Kiribati</option>
<option value="121">Korea (North)</option>
<option value="122">Korea (South)</option>
<option value="266">Kosovo</option>
<option value="123">Kuwait</option>
<option value="124">Kyrgyzstan</option>
<option value="125">Laos</option>
<option value="126">Latvia</option>
<option value="127">Lebanon</option>
<option value="128">Lesotho</option>
<option value="129">Liberia</option>
<option value="130">Libya</option>
<option value="131">Liechtenstein</option>
<option value="132">Lithuania</option>
<option value="133">Luxembourg</option>
<option value="134">Macau</option>
<option value="135">Macedonia</option>
<option value="136">Madagascar</option>
<option value="137">Malawi</option>
<option value="138">Malaysia</option>
<option value="139">Maldives</option>
<option value="140">Mali</option>
<option value="141">Malta</option>
<option value="142">Marshall Islands</option>
<option value="143">Martinique</option>
<option value="144">Mauritania</option>
<option value="145">Mauritius</option>
<option value="146">Mayotte</option>
<option value="147">Mexico</option>
<option value="148">Micronesia</option>
<option value="149">Midway Islands</option>
<option value="150">Moldova</option>
<option value="151">Monaco</option>
<option value="152">Mongolia</option>
<option value="153">Montserrat</option>
<option value="154">Morocco</option>
<option value="155">Mozambique</option>
<option value="156">Myanmar</option>
<option value="157">Namibia</option>
<option value="158">Nauru</option>
<option value="159">Nepal</option>
<option value="160">Netherlands</option>
<option value="161">Netherlands Antilles</option>
<option value="162">New Caledonia</option>
<option value="163">New Zealand</option>
<option value="164">Nicaragua</option>
<option value="165">Niger</option>
<option value="166">Nigeria</option>
<option value="167">Niue</option>
<option value="168">Norfolk Island</option>
<option value="169">Northern Mariana Islands</option>
<option value="170">Norway</option>
<option value="171">Oman</option>
<option value="172">Pakistan</option>
<option value="173">Palau</option>
<option value="174">Panama</option>
<option value="175">Papua New Guinea</option>
<option value="176">Paracel Islands</option>
<option value="177">Paraguay</option>
<option value="178">Peru</option>
<option value="179">Philippines</option>
<option value="180">Pitcairn Island</option>
<option value="181">Poland</option>
<option value="182">Portugal</option>
<option value="183">Puerto Rico</option>
<option value="184">Qatar</option>
<option value="185">Republic Of The Congo</option>
<option value="186">Reunion</option>
<option value="187">Romania</option>
<option value="188">Russia</option>
<option value="189">Rwanda</option>
<option value="190">Saint Helena</option>
<option value="191">Saint Kitts And Nevis</option>
<option value="192">Saint Lucia</option>
<option value="193">Saint Pierre And Miquelon</option>
<option value="194">Saint Vincent And The Grenadines</option>
<option value="195">Samoa</option>
<option value="196">San Marino</option>
<option value="197">Sao Tome And Principe</option>
<option value="198">Saudi Arabia</option>
<option value="199">Senegal</option>
<option value="262">Serbia</option>
<option value="200">Seychelles</option>
<option value="201">Sierra Leone</option>
<option value="202">Singapore</option>
<option value="203">Slovakia</option>
<option value="204">Slovenia</option>
<option value="205">Solomon Islands</option>
<option value="206">Somalia</option>
<option value="207">South Africa</option>
<option value="208">South Georgia And The South Sandwich Islands</option>
<option value="209">Spain</option>
<option value="210">Spanish North Africa</option>
<option value="211">Spratly Island</option>
<option value="212">Sri Lanka</option>
<option value="213">Sudan</option>
<option value="214">Suriname</option>
<option value="215">Svalbard And Jan Mayen Islands</option>
<option value="216">Swaziland</option>
<option value="217">Sweden</option>
<option value="218">Switzerland</option>
<option value="219">Syria</option>
<option value="220">Taiwan</option>
<option value="221">Tajikistan</option>
<option value="222">Tanzania</option>
<option value="223">Thailand</option>
<option value="224">Togo</option>
<option value="225">Tokelau</option>
<option value="226">Tonga</option>
<option value="227">Trinidad And Tobago</option>
<option value="228">Tunisia</option>
<option value="229">Turkey</option>
<option value="230">Turkmenistan</option>
<option value="231">Turks And Caicos Islands</option>
<option value="232">Tuvalu</option>
<option value="233">Uganda</option>
<option value="234">Ukraine</option>
<option value="235">United Arab Emirates</option>
<option value="236">United Kingdom</option>
<option value="237">Uruguay</option>
<option value="238">Uzbekistan</option>
<option value="239">Vanuatu</option>
<option value="240">Vatican City</option>
<option value="241">Venezuela</option>
<option value="242">Vietnam</option>
<option value="243">Virgin Islands (United Kingdom)</option>
<option value="244">Virgin Islands (United States)</option>
<option value="245">Wake Island</option>
<option value="246">Wallis And Futuna Islands</option>
<option value="247">West Bank Of The Jordan River</option>
<option value="248">Western Sahara</option>
<option value="249">Yemen</option>
<option value="250">Yugoslavia</option>
<option value="251">Zaire</option>
<option value="252">Zambia</option>
<option value="253">Zimbabwe</option></select>
        
        
        
        <label><input name="dualCitizen" value="1" id="dualCitizen" type="checkbox">Dual Citizenship?</label>
        <div class="hidden" id="2Citizen"> <select name="citizen2" onchange="changeCitizenship(this.value);" id="citizen2"><option value="0" selected="selected">Select 2nd Country</option>
            <option value="1">United States</option>
<option value="2">United States Minor Outlying Islands</option>
<option value="3">United States Misc. Caribbean Islands</option>
<option value="4">United States Misc. Pacific Islands</option>
<option value="5">Afghanistan</option>
<option value="6">Albania</option>
<option value="7">Algeria</option>
<option value="8">American Samoa</option>
<option value="9">Andorra</option>
<option value="10">Angola</option>
<option value="11">Anguilla</option>
<option value="12">Antarctica</option>
<option value="13">Antigua And Barbuda</option>
<option value="14">Argentina</option>
<option value="15">Armenia</option>
<option value="16">Aruba</option>
<option value="17">Australia</option>
<option value="18">Austria</option>
<option value="19">Azerbaijan</option>
<option value="20">Bahamas</option>
<option value="21">Bahrain</option>
<option value="22">Bangladesh</option>
<option value="23">Barbados</option>
<option value="24">Belarus</option>
<option value="25">Belgium</option>
<option value="26">Belize</option>
<option value="27">Benin</option>
<option value="28">Bermuda</option>
<option value="29">Bhutan</option>
<option value="30">Bolivia</option>
<option value="31">Bosnia And Herzegovina</option>
<option value="32">Botswana</option>
<option value="33">Bouvet Island</option>
<option value="34">Brazil</option>
<option value="35">British Indian Ocean Territory</option>
<option value="36">Brunei Darussalam</option>
<option value="37">Bulgaria</option>
<option value="38">Burkina Faso</option>
<option value="39">Burma</option>
<option value="40">Burundi</option>
<option value="41">Byelorussian Ssr</option>
<option value="42">Cambodia</option>
<option value="43">Cameroon</option>
<option value="44">Canada</option>
<option value="45">Cape Verde</option>
<option value="46">Cayman Islands</option>
<option value="47">Central African Republic</option>
<option value="48">Chad</option>
<option value="49">Chile</option>
<option value="50">China</option>
<option value="51">Christmas Island</option>
<option value="52">Cocos (Keeling) Islands</option>
<option value="53">Colombia</option>
<option value="54">Comoros</option>
<option value="55">Congo</option>
<option value="56">Cook Islands</option>
<option value="57">Costa Rica</option>
<option value="58">Cote D'Ivoire</option>
<option value="59">Croatia</option>
<option value="60">Cuba</option>
<option value="61">Cyprus</option>
<option value="62">Czech Republic</option>
<option value="63">Denmark</option>
<option value="64">Djibouti</option>
<option value="65">Dominica</option>
<option value="66">Dominican Republic</option>
<option value="67">East Timor</option>
<option value="68">Ecuador</option>
<option value="69">Egypt</option>
<option value="70">El Salvador</option>
<option value="71">Equatorial Guinea</option>
<option value="72">Eritrea</option>
<option value="73">Estonia</option>
<option value="74">Ethiopia</option>
<option value="75">Falkland Islands</option>
<option value="76">Faroe Islands</option>
<option value="77">Fiji</option>
<option value="78">Finland</option>
<option value="79">France</option>
<option value="80">France (Metropolitan)</option>
<option value="81">French Guiana</option>
<option value="82">French Polynesia</option>
<option value="83">French Southern Territories</option>
<option value="84">Gabon</option>
<option value="85">Gambia</option>
<option value="86">Gaza Strip</option>
<option value="87">Georgia</option>
<option value="88">Germany</option>
<option value="89">Ghana</option>
<option value="90">Gibraltar</option>
<option value="91">Greece</option>
<option value="92">Greenland</option>
<option value="93">Grenada</option>
<option value="94">Guadeloupe</option>
<option value="95">Guam</option>
<option value="96">Guatemala</option>
<option value="97">Guinea</option>
<option value="98">Guinea-Bissau</option>
<option value="99">Guyana</option>
<option value="100">Haiti</option>
<option value="101">Heard And Mcdonald Islands</option>
<option value="102">Honduras</option>
<option value="103">Hong Kong</option>
<option value="104">Hungary</option>
<option value="105">Iceland</option>
<option value="106">India</option>
<option value="107">Indonesia</option>
<option value="108">Iran</option>
<option value="109">Iraq</option>
<option value="110">Iraq-Saudi Arabia Neutral Zone</option>
<option value="111">Ireland</option>
<option value="112">Israel</option>
<option value="113">Italy</option>
<option value="114">Jamaica</option>
<option value="115">Japan</option>
<option value="116">Johnston Atoll</option>
<option value="117">Jordan</option>
<option value="118">Kazakhstan</option>
<option value="119">Kenya</option>
<option value="120">Kiribati</option>
<option value="121">Korea (North)</option>
<option value="122">Korea (South)</option>
<option value="266">Kosovo</option>
<option value="123">Kuwait</option>
<option value="124">Kyrgyzstan</option>
<option value="125">Laos</option>
<option value="126">Latvia</option>
<option value="127">Lebanon</option>
<option value="128">Lesotho</option>
<option value="129">Liberia</option>
<option value="130">Libya</option>
<option value="131">Liechtenstein</option>
<option value="132">Lithuania</option>
<option value="133">Luxembourg</option>
<option value="134">Macau</option>
<option value="135">Macedonia</option>
<option value="136">Madagascar</option>
<option value="137">Malawi</option>
<option value="138">Malaysia</option>
<option value="139">Maldives</option>
<option value="140">Mali</option>
<option value="141">Malta</option>
<option value="142">Marshall Islands</option>
<option value="143">Martinique</option>
<option value="144">Mauritania</option>
<option value="145">Mauritius</option>
<option value="146">Mayotte</option>
<option value="147">Mexico</option>
<option value="148">Micronesia</option>
<option value="149">Midway Islands</option>
<option value="150">Moldova</option>
<option value="151">Monaco</option>
<option value="152">Mongolia</option>
<option value="153">Montserrat</option>
<option value="154">Morocco</option>
<option value="155">Mozambique</option>
<option value="156">Myanmar</option>
<option value="157">Namibia</option>
<option value="158">Nauru</option>
<option value="159">Nepal</option>
<option value="160">Netherlands</option>
<option value="161">Netherlands Antilles</option>
<option value="162">New Caledonia</option>
<option value="163">New Zealand</option>
<option value="164">Nicaragua</option>
<option value="165">Niger</option>
<option value="166">Nigeria</option>
<option value="167">Niue</option>
<option value="168">Norfolk Island</option>
<option value="169">Northern Mariana Islands</option>
<option value="170">Norway</option>
<option value="171">Oman</option>
<option value="172">Pakistan</option>
<option value="173">Palau</option>
<option value="174">Panama</option>
<option value="175">Papua New Guinea</option>
<option value="176">Paracel Islands</option>
<option value="177">Paraguay</option>
<option value="178">Peru</option>
<option value="179">Philippines</option>
<option value="180">Pitcairn Island</option>
<option value="181">Poland</option>
<option value="182">Portugal</option>
<option value="183">Puerto Rico</option>
<option value="184">Qatar</option>
<option value="185">Republic Of The Congo</option>
<option value="186">Reunion</option>
<option value="187">Romania</option>
<option value="188">Russia</option>
<option value="189">Rwanda</option>
<option value="190">Saint Helena</option>
<option value="191">Saint Kitts And Nevis</option>
<option value="192">Saint Lucia</option>
<option value="193">Saint Pierre And Miquelon</option>
<option value="194">Saint Vincent And The Grenadines</option>
<option value="195">Samoa</option>
<option value="196">San Marino</option>
<option value="197">Sao Tome And Principe</option>
<option value="198">Saudi Arabia</option>
<option value="199">Senegal</option>
<option value="262">Serbia</option>
<option value="200">Seychelles</option>
<option value="201">Sierra Leone</option>
<option value="202">Singapore</option>
<option value="203">Slovakia</option>
<option value="204">Slovenia</option>
<option value="205">Solomon Islands</option>
<option value="206">Somalia</option>
<option value="207">South Africa</option>
<option value="208">South Georgia And The South Sandwich Islands</option>
<option value="209">Spain</option>
<option value="210">Spanish North Africa</option>
<option value="211">Spratly Island</option>
<option value="212">Sri Lanka</option>
<option value="213">Sudan</option>
<option value="214">Suriname</option>
<option value="215">Svalbard And Jan Mayen Islands</option>
<option value="216">Swaziland</option>
<option value="217">Sweden</option>
<option value="218">Switzerland</option>
<option value="219">Syria</option>
<option value="220">Taiwan</option>
<option value="221">Tajikistan</option>
<option value="222">Tanzania</option>
<option value="223">Thailand</option>
<option value="224">Togo</option>
<option value="225">Tokelau</option>
<option value="226">Tonga</option>
<option value="227">Trinidad And Tobago</option>
<option value="228">Tunisia</option>
<option value="229">Turkey</option>
<option value="230">Turkmenistan</option>
<option value="231">Turks And Caicos Islands</option>
<option value="232">Tuvalu</option>
<option value="233">Uganda</option>
<option value="234">Ukraine</option>
<option value="235">United Arab Emirates</option>
<option value="236">United Kingdom</option>
<option value="237">Uruguay</option>
<option value="238">Uzbekistan</option>
<option value="239">Vanuatu</option>
<option value="240">Vatican City</option>
<option value="241">Venezuela</option>
<option value="242">Vietnam</option>
<option value="243">Virgin Islands (United Kingdom)</option>
<option value="244">Virgin Islands (United States)</option>
<option value="245">Wake Island</option>
<option value="246">Wallis And Futuna Islands</option>
<option value="247">West Bank Of The Jordan River</option>
<option value="248">Western Sahara</option>
<option value="249">Yemen</option>
<option value="250">Yugoslavia</option>
<option value="251">Zaire</option>
<option value="252">Zambia</option>
<option value="253">Zimbabwe</option></select> </div>
    </td>
</tr>

    

<tr class="required alien">
    <td>
        <div id="immigrantLabel">
            <a href="#" onclick="return false;">Immigrant Alien:
            <span class="tip">
            Also known as a "Permanent Resident Alien",
                "Lawful Permanent Resident," "Resident Alien Permit Holder,"
                or "Green Card Holder"</span>
            </a>
        </div>
    </td>
    <td>
        <div id="immigrantValue">
            
            Yes <input name="immigrantAlien" value="1" type="radio">
            No <input name="immigrantAlien" value="0" type="radio">
            
        </div>
    </td>
</tr>

  <tr class="required">
            <td>
                
                            <a href="#" onclick="return false;">
                                
                                Preferred Kerberos Realm:
                            <div class="tip">
                               <p> For a Standard account select <span class="emphasis">HPCMP.HPC.MIL</span> </p>
                               <p> For an Open Systems account select <span class="emphasis">ORS.HPC.MIL</span> </p>
                            </div>
                            </a>
                
                
                
            </td>
            <td>
                
                    <select name="realmID" id="realmID"><option selected="selected" value="HPCMP.HPC.MIL">HPCMP.HPC.MIL</option>
<option value="ORS.HPC.MIL">ORS.HPC.MIL</option></select>
                
                
            </td>
        </tr>
    

<!-- This is how we handled the common names for the applications screen -->

    



<!-- End of the application form section -->

<!-- This is how we handled the common names for the applications screen -->



    <tr class="required">
        <td>
            
            Org ID:
        </td>
        <td>
            
                <select id="orgID" name="orgID"><option selected="selected" value="">Select organization</option>
<option value="ACOMA">ACOMA - Aviation Command at Moffett Field, CA</option>
<option value="ACOML">ACOML - Aviation Command at Langley Research Center, VA</option>
<option value="ACOMM">ACOMM - Army Material Command at Redstone Arsenal, AL</option>
<option value="ACOMV">ACOMV - Aviation and Missile Command at Redstone Arsenal, AL</option>
<option value="AEDCA">AEDCA - Arnold Engineering Development Complex at Arnold AFB, TN</option>
<option value="AFAAC">AFAAC - Air Force Air Armament Center at Eglin AFB, FL</option>
<option value="AFAAH">AFAAH - Air Force Air Armament Center at Holloman AFB, NM</option>
<option value="AFDEK">AFDEK - Air Force Research Laboratory - Directed Energy at Kirtland AFB, NM</option>
<option value="AFDEM">AFDEM - Air Force Research Laboratory - Directed Energy at Maui, HI</option>
<option value="AFFTC">AFFTC - Air Force Flight Test Center at Edwards AFB, CA</option>
<option value="AFHEB">AFHEB - Air Force Research Laboratory - Human Effectiveness at JBSA Fort Sam Houston, TX</option>
<option value="AFHEW">AFHEW - Air Force Research Laboratory - Human Effectiveness at Wright-Patterson AFB, OH</option>
<option value="AFIFR">AFIFR - Air Force Research Laboratory -  Information at Rome, NY</option>
<option value="AFIFW">AFIFW - Air Force Research Laboratory - Information at WPAFB, OH</option>
<option value="AFITO">AFITO - Air Force Institute of Technology at Wright-Patterson AFB, OH</option>
<option value="AFMLT">AFMLT - Air Force Research Laboratory - Materials/Manufacturing at Tyndall AFB, FL</option>
<option value="AFMLW">AFMLW - Air Force Research Laboratory - Materials/Manufacturing at WPAFB, OH</option>
<option value="AFMNG">AFMNG - Air Force Research Laboratory - Munitions at Eglin AFB, FL</option>
<option value="AFOSR">AFOSR - Air Force Office of Scientific Research at Arlington, VA</option>
<option value="AFPRD">AFPRD - Air Force Research Laboratory - Propulsions at Edwards AFB, CA</option>
<option value="AFPRW">AFPRW - Air Force Research Laboratory - Propulsions at WPAFB, OH</option>
<option value="AFSNH">AFSNH - Air Force Research Laboratory - Sensors at Hanscom AFB, MA</option>
<option value="AFSNR">AFSNR - Air Force Research Laboratory - Sensors at Rome, NY</option>
<option value="AFSNW">AFSNW - Air Force Research Laboratory - Sensors at WPAFB, OH</option>
<option value="AFVAW">AFVAW - Air Force Research Laboratory - Air Vehicles at WPAFB, OH</option>
<option value="AFVSH">AFVSH - Air Force Research Laboratory - Space Vehicles at Hanscom AFB, MA</option>
<option value="AFVSK">AFVSK - Air Force Research Laboratory - Space Vehicles at Kirtland AFB, NM</option>
<option value="AFWAC">AFWAC - Air Force Weather Agency at Offutt AFB, NE</option>
<option value="AMSAA">AMSAA - Army Material Systems Analysis Activity at Aberdeen Proving Ground, MD</option>
<option value="ARLAP">ARLAP - Army Research Laboratory at Aberdeen Proving Ground, MD</option>
<option value="ARLST">ARLST - Army Research Laboratory at Stanford, CA</option>
<option value="ARONC">ARONC - Army Research Office at Research Triangle Park,NC</option>
<option value="ASCWP">ASCWP - Aeronautical Systems Center Engineering Directorate at WPAFB, OH</option>
<option value="ASTTC">ASTTC - Army Research, Development and Engineering Command Simulation and Training Tech Cntr at Orlando, FL</option>
<option value="ATECM">ATECM - Army Tech and Evaluation Command, Aberdeen Proving Ground, MD</option>
<option value="ATTCA">ATTCA - Redstone Test Center at Ft. Rucker, AL</option>
<option value="CECOM">CECOM - Army Communications-Electronics Command at Fort Monmouth, NJ</option>
<option value="DARPA">DARPA - Defense Advanced Research Projects Agency at Arlington, VA</option>
<option value="DOTEA">DOTEA - Director of Test and Evaluation at Arlington, VA</option>
<option value="DPGUT">DPGUT - Dugway Proving Ground at Dugway Proving Ground, UT</option>
<option value="DTRAA">DTRAA - Defense Threat Reduction Agency at Alexandria, VA</option>
<option value="ERDCA">ERDCA - U.S. Army Engineer Research and Development Center at Alexandria, VA</option>
<option value="ERDCC">ERDCC - U.S. Army Engineer Research and Development Center at  Champaign, IL</option>
<option value="ERDCH">ERDCH - U.S. Army Engineer Research and Development Center at Hanover, NH</option>
<option value="ERDCS">ERDCS - U.S. Army Engineer Research and Development Center Support at Vicksburg, MS</option>
<option value="ERDCV">ERDCV - U.S. Army Engineer Research and Development Center at Vicksburg, MS</option>
<option value="HPCMO">HPCMO - High Performance Computing Modernization Office at Lorton, VA</option>
<option value="MDAVA">MDAVA - Missile Defense Agency in Crystal City, VA</option>
<option value="MHPCC">MHPCC - Maui High Performance Computing Center at Kihei, HI</option>
<option value="MRMCA">MRMCA - Medical Research and Materiel Command at Aberdeen Proving Ground, MD</option>
<option value="MRMCF">MRMCF - Medical Research and Materiel Command at Ft. Detrick, MD</option>
<option value="NAVOS">NAVOS - Navy DSRC at Stennis Space Center, MS</option>
<option value="NAWCC">NAWCC - Naval Air Warfare Center at China Lake, CA</option>
<option value="NAWCL">NAWCL - Naval Air Warfare Center at Lakehurst, NJ</option>
<option value="NAWCM">NAWCM - Naval Air Warfare Center at Pt. Mugu, CA</option>
<option value="NAWCO">NAWCO - Naval Air Warfare Center at Orlando, FL</option>
<option value="NAWCP">NAWCP - Naval Air Warfare Center at Patuxent River, MD</option>
<option value="NFRCC">NFRCC - Naval Fleet Readiness Command at Naval Air Station Cecil Field, FL</option>
<option value="NFRCE">NFRCE - Naval Fleet Readiness Command at Cherry Point, NC</option>
<option value="NFRCS">NFRCS - Naval Fleet Readiness Command - South at Jacksonville, FL</option>
<option value="NFRCW">NFRCW - Naval Fleet Readiness Command - West at San Diego, CA</option>
<option value="NMRCM">NMRCM - Naval Medical Research Center at Fort Detrick, MD</option>
<option value="NPSCA">NPSCA - Naval Postgraduate School at Monterey, CA</option>
<option value="NRLDC">NRLDC - Naval Research Laboratory at Washington, DC</option>
<option value="NRLMR">NRLMR - Naval Research Laboratory at Monterey, CA</option>
<option value="NRLSS">NRLSS - Naval Research Laboratory at Stennis Space Center, MS</option>
<option value="NSWCC">NSWCC - Naval Surface Warfare Center at Carderock, MD</option>
<option value="NSWCD">NSWCD - Naval Surface Warfare Center at Dahlgren, VA</option>
<option value="NSWCI">NSWCI - Naval Surface Warfare Center at Indian Head, MD</option>
<option value="NSWCP">NSWCP - Naval Surface Warfare Center at Panama City, FL</option>
<option value="NSWCV">NSWCV - Naval Surface Warfare Center at Dam Neck, VA</option>
<option value="NSWCZ">NSWCZ - Naval Surface Warfare Center at Crane, IN</option>
<option value="NUWCN">NUWCN - Naval Undersea Warfare Center at Newport, RI</option>
<option value="NVESD">NVESD - Night Vision and Electronic Sensors Directorate at Fort Belvoir, VA</option>
<option value="NWDCN">NWDCN - Navy Warfare Development Command at Norfolk, VA</option>
<option value="OARMY">OARMY - Other Army</option>
<option value="ODEFN">ODEFN - Other Defense at Arlington, VA</option>
<option value="ONAVY">ONAVY - Other Navy</option>
<option value="ONIMD">ONIMD - Office of Naval Intelligence, Suitland, MD</option>
<option value="ONRDC">ONRDC - Office of Naval Research at Arlington, VA</option>
<option value="OUSAF">OUSAF - Other Air Force</option>
<option value="PMRFH">PMRFH - Pacific Missile Range Facility - Barking Sands, Kauai, HI</option>
<option value="RTTCA">RTTCA - Redstone Test Center at Redstone Arsenal, AL</option>
<option value="SBCCA">SBCCA - Soldier Biological Chemical Command at Aberdeen Proving Ground, MD</option>
<option value="SBCCN">SBCCN - Soldier Biological Chemical Command Research Development Engineering Center at Natick, MA</option>
<option value="SMCCA">SMCCA - Space and Missile Systems Center/Aerospace at Los Angeles AFB, CA</option>
<option value="SMDCH">SMDCH - Space and Strategic Defense Command at Huntsville, AL</option>
<option value="SSCNC">SSCNC - SPAWAR Systems Center Atlantic at North Charleston, SC</option>
<option value="SSCSD">SSCSD - Space and Naval Warfare Systems Center at San Diego, CA</option>
<option value="TACOP">TACOP - Army Research, Development and Engineering Command at Picatinny Arsenal, NJ</option>
<option value="TACOW">TACOW - Tank-Automotive Command at Warren, MI</option>
<option value="USAFA">USAFA - US Air Force Academy at Colorado Springs, CO</option>
<option value="USMAN">USMAN - US Military Academy at West Point, NY</option>
<option value="USNAM">USNAM - US Naval Academy at Annapolis, MD</option>
<option value="USNOW">USNOW - US Naval Observatory at Washington, DC</option>
<option value="WPASC">WPASC - Air Force Research Laboratory -  DSRC at WPAFB OH</option>
<option value="WSMRN">WSMRN - White Sands Missile Range at White Sands Missle Range, NM</option>
<option value="YPGAZ">YPGAZ - Yuma Proving Ground at Yuma Proving Ground, AZ</option></select>
            
            
        </td>
    </tr>


<tr class="required alien">
    <td>
        Alien Registration, Visa, or Passport Number:
        <p class="inlineErrors"></p>
    </td>
    <td>
        <input name="alienNumb" value="${info.alienNumb}"  type="text">
</tr>
<tr class="required alien">
    <td>
        Alien Registration, Visa, or Passport Expiration Date:
        <p class="inlineErrors"> </p>
    </td>
    <td>
        <input name="alienExp" id="alienExp" value="${info.alienExp}" class="cal" type="text"/>
    </td>
</tr>
<tr class="required">
    <td>
        
        Legal First Name:
    </td>
    <td>
        <input name="firstname" id="firstname" value="${info.firstname}"  size="50" type="text">
    </td>
</tr>
<tr>
    <td>
        
        Legal Middle Name:
    </td>
    <td>
        <input name="middlename"  id="middlename" value="${info.middlename}"  size="50" type="text">
    </td>
</tr>
<tr class="required">
    <td>
        
        Legal Last Name:
    </td>
    <td>
           <input name="lastname"  id="lastname" value="${info.lastname}"  size="50" type="text">
    </td>
</tr>
<tr>
    <td>
        
        Legal Last Name Suffix:
    </td>
    <td>
        <select name="suffix"><option selected="selected" value="">Select Suffix</option>
            <option value="Jr.">Jr.</option>
<option value="Sr.">Sr.</option>
<option value="I">I</option>
<option value="II">II</option>
<option value="III">III</option>
<option value="IV">IV</option>
<option value="V">V</option></select>
    </td>
</tr>
<tr>
    <td>
        
        Title (Mr., Ms., Dr., Military):
    </td>
    <td>
        <select name="surTitle"><option selected="selected" value="">Select Title</option>
            <option value="Mr.">Mr.</option>
<option value="Mrs.">Mrs.</option>
<option value="Miss">Miss</option>
<option value="Ms.">Ms.</option>
<option value="Dr.">Dr.</option>
<option value="Prof.">Prof.</option>
<option value="SPC">SPC (Specialist)</option>
<option value="CPL">CPL (Corporal)</option>
<option value="SGT">SGT (Sergeant)</option>
<option value="SSG">SSG (Staff Sergeant)</option>
<option value="TSGT">TSGT (Technical Sergeant)</option>
<option value="SFC">SFC (Sergeant First Class)</option>
<option value="MSG">MSG (Master Sergeant)</option>
<option value="2LT">2LT (Second Lieutenant)</option>
<option value="1LT">1LT (First Lieutenant)</option>
<option value="CAPT">CAPT (Captain)</option>
<option value="MAJ">MAJ (Major)</option>
<option value="LTC">LTC (Lieutenant Colonel)</option>
<option value="COL">COL (Colonel)</option>
<option value="LT">LT (Lieutenant)</option>
<option value="LCDR">LCDR (Lieutenant Commander)</option>
<option value="CDR">CDR (Commander)</option>
<option value="ENS">ENS (Ensign)</option>
<option value="MIDN">MIDN (Midshipman)</option>
<option value="CDT">CDT (Cadet)</option></select>
    </td>
</tr>
<tr>
    <td>
        
        Nickname:
    </td>
    <td>
        <input name="nickname" type="text" value="${info.nickname}" >
    </td>
</tr>

<tr>
    <td>Mailing address:</td>
</tr>
<tr class="required">
    <td>
        
        Company/Organization
    </td>
    <td>
        <input name="company" size="50" type="text" value="${info.company}" />
    </td>
</tr>
<tr>
    <td>
        
        Office symbol:
    </td>
    <td>
        <input name="organizationHier" size="50" type="text" value="${info.organizationHier}">
    </td>
</tr>
<tr class="required">
    <td>
        
        Business/School Address 1: <br>(do not use a PO Box)
    </td>
    <td>
        <textarea name="address1" cols="47" rows="2"></textarea>
    </td>
</tr>
<tr>
    <td>
        
        Business/School Address 2:
    </td>
    <td>
        <textarea name="address2" cols="47" rows="2">${info.address2}</textarea>
    </td>
</tr>
<tr>
    <td>
        
        Business/School Address 3:
    </td>
    <td>
        <textarea name="address3" cols="47" rows="2">${info.address3}</textarea>
    </td>
</tr>
<tr>
    <td>
        
        Business/School Address 4:
    </td>
    <td>
        <textarea name="address4" cols="47" rows="2">${info.address4}</textarea>
    </td>
</tr>
<tr class="required">
    <td>
        
        City:
    </td>
    <td>
        <input name="city" size="50" type="text" value="${info.city}">
    </td>
</tr>
<tr class="required">
    <td>
        
        
        State:
    </td>
    <td>
        <!--html:text property="state" size="50" /-->
        <select name="state"><option selected="selected" value="">n/a</option>
<option value="AA">AA</option>
<option value="AE">AE</option>
<option value="AK">AK</option>
<option value="AL">AL</option>
<option value="AP">AP</option>
<option value="AR">AR</option>
<option value="AZ">AZ</option>
<option value="CA">CA</option>
<option value="CO">CO</option>
<option value="CT">CT</option>
<option value="DC">DC</option>
<option value="DE">DE</option>
<option value="FL">FL</option>
<option value="GA">GA</option>
<option value="HI">HI</option>
<option value="IA">IA</option>
<option value="ID">ID</option>
<option value="IL">IL</option>
<option value="IN">IN</option>
<option value="KS">KS</option>
<option value="KY">KY</option>
<option value="LA">LA</option>
<option value="MA">MA</option>
<option value="MD">MD</option>
<option value="ME">ME</option>
<option value="MI">MI</option>
<option value="MN">MN</option>
<option value="MO">MO</option>
<option value="MS">MS</option>
<option value="MT">MT</option>
<option value="NC">NC</option>
<option value="ND">ND</option>
<option value="NE">NE</option>
<option value="NH">NH</option>
<option value="NJ">NJ</option>
<option value="NM">NM</option>
<option value="NV">NV</option>
<option value="NY">NY</option>
<option value="OH">OH</option>
<option value="OK">OK</option>
<option value="OR">OR</option>
<option value="PA">PA</option>
<option value="RI">RI</option>
<option value="SC">SC</option>
<option value="SD">SD</option>
<option value="TN">TN</option>
<option value="TX">TX</option>
<option value="UT">UT</option>
<option value="VA">VA</option>
<option value="VT">VT</option>
<option value="WA">WA</option>
<option value="WI">WI</option>
<option value="WV">WV</option>
<option value="WY">WY</option></select>
    </td>
</tr>

<tr class="required">
    <td>
        
        Country:
    </td>
    <td>
        <!--html:text property="country" size="50" /-->
        <select name="country" onchange="checkZipBgColor(this.value, 'zipcoderow')"><option selected="selected" value="United States">United States</option>
<option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
<option value="United States Misc. Caribbean Islands">United States Misc. Caribbean Islands</option>
<option value="United States Misc. Pacific Islands">United States Misc. Pacific Islands</option>
<option value="Afghanistan">Afghanistan</option>
<option value="Albania">Albania</option>
<option value="Algeria">Algeria</option>
<option value="American Samoa">American Samoa</option>
<option value="Andorra">Andorra</option>
<option value="Angola">Angola</option>
<option value="Anguilla">Anguilla</option>
<option value="Antarctica">Antarctica</option>
<option value="Antigua And Barbuda">Antigua And Barbuda</option>
<option value="Argentina">Argentina</option>
<option value="Armenia">Armenia</option>
<option value="Aruba">Aruba</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Azerbaijan">Azerbaijan</option>
<option value="Bahamas">Bahamas</option>
<option value="Bahrain">Bahrain</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Barbados">Barbados</option>
<option value="Belarus">Belarus</option>
<option value="Belgium">Belgium</option>
<option value="Belize">Belize</option>
<option value="Benin">Benin</option>
<option value="Bermuda">Bermuda</option>
<option value="Bhutan">Bhutan</option>
<option value="Bolivia">Bolivia</option>
<option value="Bosnia And Herzegovina">Bosnia And Herzegovina</option>
<option value="Botswana">Botswana</option>
<option value="Bouvet Island">Bouvet Island</option>
<option value="Brazil">Brazil</option>
<option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
<option value="Brunei Darussalam">Brunei Darussalam</option>
<option value="Bulgaria">Bulgaria</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Burma">Burma</option>
<option value="Burundi">Burundi</option>
<option value="Byelorussian Ssr">Byelorussian Ssr</option>
<option value="Cambodia">Cambodia</option>
<option value="Cameroon">Cameroon</option>
<option value="Canada">Canada</option>
<option value="Cape Verde">Cape Verde</option>
<option value="Cayman Islands">Cayman Islands</option>
<option value="Central African Republic">Central African Republic</option>
<option value="Chad">Chad</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Christmas Island">Christmas Island</option>
<option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
<option value="Colombia">Colombia</option>
<option value="Comoros">Comoros</option>
<option value="Congo">Congo</option>
<option value="Cook Islands">Cook Islands</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Cote D'Ivoire">Cote D'Ivoire</option>
<option value="Croatia">Croatia</option>
<option value="Cuba">Cuba</option>
<option value="Cyprus">Cyprus</option>
<option value="Czech Republic">Czech Republic</option>
<option value="Denmark">Denmark</option>
<option value="Djibouti">Djibouti</option>
<option value="Dominica">Dominica</option>
<option value="Dominican Republic">Dominican Republic</option>
<option value="East Timor">East Timor</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="El Salvador">El Salvador</option>
<option value="Equatorial Guinea">Equatorial Guinea</option>
<option value="Eritrea">Eritrea</option>
<option value="Estonia">Estonia</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Falkland Islands">Falkland Islands</option>
<option value="Faroe Islands">Faroe Islands</option>
<option value="Fiji">Fiji</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="France (Metropolitan)">France (Metropolitan)</option>
<option value="French Guiana">French Guiana</option>
<option value="French Polynesia">French Polynesia</option>
<option value="French Southern Territories">French Southern Territories</option>
<option value="Gabon">Gabon</option>
<option value="Gambia">Gambia</option>
<option value="Gaza Strip">Gaza Strip</option>
<option value="Georgia">Georgia</option>
<option value="Germany">Germany</option>
<option value="Ghana">Ghana</option>
<option value="Gibraltar">Gibraltar</option>
<option value="Greece">Greece</option>
<option value="Greenland">Greenland</option>
<option value="Grenada">Grenada</option>
<option value="Guadeloupe">Guadeloupe</option>
<option value="Guam">Guam</option>
<option value="Guatemala">Guatemala</option>
<option value="Guinea">Guinea</option>
<option value="Guinea-Bissau">Guinea-Bissau</option>
<option value="Guyana">Guyana</option>
<option value="Haiti">Haiti</option>
<option value="Heard And Mcdonald Islands">Heard And Mcdonald Islands</option>
<option value="Honduras">Honduras</option>
<option value="Hong Kong">Hong Kong</option>
<option value="Hungary">Hungary</option>
<option value="Iceland">Iceland</option>
<option value="India">India</option>
<option value="Indonesia">Indonesia</option>
<option value="Iran">Iran</option>
<option value="Iraq">Iraq</option>
<option value="Iraq-Saudi Arabia Neutral Zone">Iraq-Saudi Arabia Neutral Zone</option>
<option value="Ireland">Ireland</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Johnston Atoll">Johnston Atoll</option>
<option value="Jordan">Jordan</option>
<option value="Kazakhstan">Kazakhstan</option>
<option value="Kenya">Kenya</option>
<option value="Kiribati">Kiribati</option>
<option value="Korea (North)">Korea (North)</option>
<option value="Korea (South)">Korea (South)</option>
<option value="Kosovo">Kosovo</option>
<option value="Kuwait">Kuwait</option>
<option value="Kyrgyzstan">Kyrgyzstan</option>
<option value="Laos">Laos</option>
<option value="Latvia">Latvia</option>
<option value="Lebanon">Lebanon</option>
<option value="Lesotho">Lesotho</option>
<option value="Liberia">Liberia</option>
<option value="Libya">Libya</option>
<option value="Liechtenstein">Liechtenstein</option>
<option value="Lithuania">Lithuania</option>
<option value="Luxembourg">Luxembourg</option>
<option value="Macau">Macau</option>
<option value="Macedonia">Macedonia</option>
<option value="Madagascar">Madagascar</option>
<option value="Malawi">Malawi</option>
<option value="Malaysia">Malaysia</option>
<option value="Maldives">Maldives</option>
<option value="Mali">Mali</option>
<option value="Malta">Malta</option>
<option value="Marshall Islands">Marshall Islands</option>
<option value="Martinique">Martinique</option>
<option value="Mauritania">Mauritania</option>
<option value="Mauritius">Mauritius</option>
<option value="Mayotte">Mayotte</option>
<option value="Mexico">Mexico</option>
<option value="Micronesia">Micronesia</option>
<option value="Midway Islands">Midway Islands</option>
<option value="Moldova">Moldova</option>
<option value="Monaco">Monaco</option>
<option value="Mongolia">Mongolia</option>
<option value="Montserrat">Montserrat</option>
<option value="Morocco">Morocco</option>
<option value="Mozambique">Mozambique</option>
<option value="Myanmar">Myanmar</option>
<option value="Namibia">Namibia</option>
<option value="Nauru">Nauru</option>
<option value="Nepal">Nepal</option>
<option value="Netherlands">Netherlands</option>
<option value="Netherlands Antilles">Netherlands Antilles</option>
<option value="New Caledonia">New Caledonia</option>
<option value="New Zealand">New Zealand</option>
<option value="Nicaragua">Nicaragua</option>
<option value="Niger">Niger</option>
<option value="Nigeria">Nigeria</option>
<option value="Niue">Niue</option>
<option value="Norfolk Island">Norfolk Island</option>
<option value="Northern Mariana Islands">Northern Mariana Islands</option>
<option value="Norway">Norway</option>
<option value="Oman">Oman</option>
<option value="Pakistan">Pakistan</option>
<option value="Palau">Palau</option>
<option value="Panama">Panama</option>
<option value="Papua New Guinea">Papua New Guinea</option>
<option value="Paracel Islands">Paracel Islands</option>
<option value="Paraguay">Paraguay</option>
<option value="Peru">Peru</option>
<option value="Philippines">Philippines</option>
<option value="Pitcairn Island">Pitcairn Island</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Puerto Rico">Puerto Rico</option>
<option value="Qatar">Qatar</option>
<option value="Republic Of The Congo">Republic Of The Congo</option>
<option value="Reunion">Reunion</option>
<option value="Romania">Romania</option>
<option value="Russia">Russia</option>
<option value="Rwanda">Rwanda</option>
<option value="Saint Helena">Saint Helena</option>
<option value="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
<option value="Saint Lucia">Saint Lucia</option>
<option value="Saint Pierre And Miquelon">Saint Pierre And Miquelon</option>
<option value="Saint Vincent And The Grenadines">Saint Vincent And The Grenadines</option>
<option value="Samoa">Samoa</option>
<option value="San Marino">San Marino</option>
<option value="Sao Tome And Principe">Sao Tome And Principe</option>
<option value="Saudi Arabia">Saudi Arabia</option>
<option value="Senegal">Senegal</option>
<option value="Serbia">Serbia</option>
<option value="Seychelles">Seychelles</option>
<option value="Sierra Leone">Sierra Leone</option>
<option value="Singapore">Singapore</option>
<option value="Slovakia">Slovakia</option>
<option value="Slovenia">Slovenia</option>
<option value="Solomon Islands">Solomon Islands</option>
<option value="Somalia">Somalia</option>
<option value="South Africa">South Africa</option>
<option value="South Georgia And The South Sandwich Islands">South Georgia And The South Sandwich Islands</option>
<option value="Spain">Spain</option>
<option value="Spanish North Africa">Spanish North Africa</option>
<option value="Spratly Island">Spratly Island</option>
<option value="Sri Lanka">Sri Lanka</option>
<option value="Sudan">Sudan</option>
<option value="Suriname">Suriname</option>
<option value="Svalbard And Jan Mayen Islands">Svalbard And Jan Mayen Islands</option>
<option value="Swaziland">Swaziland</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Syria">Syria</option>
<option value="Taiwan">Taiwan</option>
<option value="Tajikistan">Tajikistan</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="Togo">Togo</option>
<option value="Tokelau">Tokelau</option>
<option value="Tonga">Tonga</option>
<option value="Trinidad And Tobago">Trinidad And Tobago</option>
<option value="Tunisia">Tunisia</option>
<option value="Turkey">Turkey</option>
<option value="Turkmenistan">Turkmenistan</option>
<option value="Turks And Caicos Islands">Turks And Caicos Islands</option>
<option value="Tuvalu">Tuvalu</option>
<option value="Uganda">Uganda</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Emirates">United Arab Emirates</option>
<option value="United Kingdom">United Kingdom</option>
<option value="Uruguay">Uruguay</option>
<option value="Uzbekistan">Uzbekistan</option>
<option value="Vanuatu">Vanuatu</option>
<option value="Vatican City">Vatican City</option>
<option value="Venezuela">Venezuela</option>
<option value="Vietnam">Vietnam</option>
<option value="Virgin Islands (United Kingdom)">Virgin Islands (United Kingdom)</option>
<option value="Virgin Islands (United States)">Virgin Islands (United States)</option>
<option value="Wake Island">Wake Island</option>
<option value="Wallis And Futuna Islands">Wallis And Futuna Islands</option>
<option value="West Bank Of The Jordan River">West Bank Of The Jordan River</option>
<option value="Western Sahara">Western Sahara</option>
<option value="Yemen">Yemen</option>
<option value="Yugoslavia">Yugoslavia</option>
<option value="Zaire">Zaire</option>
<option value="Zambia">Zambia</option>
<option value="Zimbabwe">Zimbabwe</option></select>
    </td>
</tr>
<tr class="required" id="zipcoderow">
    <td>
        
        Zipcode:
    </td>
    <td>
        <input name="zipcode" size="50" type="text">
    </td>
</tr>

<tr class="required">
    <td>
        
        Primary Phone (include area code):
    </td>
    <td>
        <input name="phone" size="25" onchange="this.value=formatPhone(this.value, document.forms[0].country.options[document.forms[0].country.selectedIndex].value);" type="text">
        Ext: <input name="phone1Ext" maxlength="5" size="14" type="text">
    </td>
</tr>
<tr>
    <td>
        
        Alternate Phone (include area code):
    </td>
    <td>
        <input name="phone2" size="25" onchange="this.value=formatPhone(this.value, document.forms[0].country.options[document.forms[0].country.selectedIndex].value);" type="text">
        Ext: <input name="phone2Ext" maxlength="5" size="14" type="text">
    </td>
</tr>
<tr>
    <td>
        
        Fax (include area code):
    </td>
    <td>
        <input name="fax" size="50" onchange="this.value=formatPhone(this.value, document.forms[0].country.options[document.forms[0].country.selectedIndex].value);" type="text">
    </td>
</tr><tr class="required">
    <td>
        
        Email address:
    </td>
    <td>
        <input name="email" size="50" type="text">
    </td>
</tr>
<tr>
    <td>
        
        Alternate Email address:
    </td>
    <td>
        <input name="email2" size="50" type="text">
    </td>
</tr>
</tbody>
</table>
            <div class="buttons">
                <span class="button">
                    <g:submitButton  role="button" class="ui-button ui-widget ui-state-default ui-corner-all" name="save" value="Save" />
                    <g:submitButton class="cancel" name="cancel" value="Cancel" />
                </span>
            </div>
        </g:form>
    </div>
</body>
</html>