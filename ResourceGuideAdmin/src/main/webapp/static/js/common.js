// 鞝勳棴 氤�垬
var errmsg = "";
var errfld = null;

// 頃勲摐 瓴�偓
function check_field(fld, msg)
{
    if ((fld.value = trim(fld.value)) == "")
        error_field(fld, msg);
    else
        clear_field(fld);
    return;
}

// 頃勲摐 鞓る 響滌嫓
function error_field(fld, msg)
{
    if (msg != "")
        errmsg += msg + "\n";
    if (!errfld) errfld = fld;
    fld.style.background = "#BDDEF7";
}

// 頃勲摐毳�旯仐頃橁矊
function clear_field(fld)
{
    fld.style.background = "#FFFFFF";
}

function trim(s)
{
    var t = "";
    var from_pos = to_pos = 0;

    for (i=0; i<s.length; i++)
    {
        if (s.charAt(i) == ' ')
            continue;
        else
        {
            from_pos = i;
            break;
        }
    }

    for (i=s.length; i>=0; i--)
    {
        if (s.charAt(i-1) == ' ')
            continue;
        else
        {
            to_pos = i;
            break;
        }
    }

    t = s.substring(from_pos, to_pos);
    //				alert(from_pos + ',' + to_pos + ',' + t+'.');
    return t;
}

// 鞛愲皵鞀ろ伂毽巾姼搿�PHP鞚�number_format 頋夒偞毳�雰�// 靾瀽鞐�, 毳�於滊牓
function number_format(data)
{

    var tmp = '';
    var number = '';
    var cutlen = 3;
    var comma = ',';
    var i;

    var sign = data.match(/^[\+\-]/);
    if(sign) {
        data = data.replace(/^[\+\-]/, "");
    }

    len = data.length;
    mod = (len % cutlen);
    k = cutlen - mod;
    for (i=0; i<data.length; i++)
    {
        number = number + data.charAt(i);

        if (i < data.length - 1)
        {
            k++;
            if ((k % cutlen) == 0)
            {
                number = number + comma;
                k = 0;
            }
        }
    }

    if(sign != null)
        number = sign+number;

    return number;
}

// 靸�彀�function popup_window(url, winname, opt)
{
    window.open(url, winname, opt);
}


// 韽茧鞚�彀�function popup_formmail(url)
{
    opt = 'scrollbars=yes,width=417,height=385,top=10,left=20';
    popup_window(url, "wformmail", opt);
}

// , 毳�鞐嗢暏雼�
function no_comma(data)
{
    var tmp = '';
    var comma = ',';
    var i;

    for (i=0; i<data.length; i++)
    {
        if (data.charAt(i) != comma)
            tmp += data.charAt(i);
    }
    return tmp;
}

// 靷牅 瓴�偓 頇曥澑
function del(href)
{
    if(confirm("頃滊矆 靷牅頃�鞛愲電�氤店惮頃�氚╇矔鞚�鞐嗢姷雼堧嫟.\n\n鞝曤 靷牅頃橃嫓瓴犾姷雼堦箤?")) {
        var iev = -1;
        if (navigator.appName == 'Microsoft Internet Explorer') {
            var ua = navigator.userAgent;
            var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
            if (re.exec(ua) != null)
                iev = parseFloat(RegExp.$1);
        }

        // IE6 鞚错晿鞐愳劀 頃滉竴旯 氚╈
        if (iev != -1 && iev < 7) {
            document.location.href = encodeURI(href);
        } else {
            document.location.href = href;
        }
    }
}

// 炜犿偆 鞛呺牓
function set_cookie(name, value, expirehours, domain)
{
    var today = new Date();
    today.setTime(today.getTime() + (60*60*1000*expirehours));
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
    if (domain) {
        document.cookie += "domain=" + domain + ";";
    }
}

// 炜犿偆 鞏混潓
function get_cookie(name)
{
    var find_sw = false;
    var start, end;
    var i = 0;

    for (i=0; i<= document.cookie.length; i++)
    {
        start = i;
        end = start + name.length;

        if(document.cookie.substring(start, end) == name)
        {
            find_sw = true
            break;
        }
    }

    if (find_sw == true)
    {
        start = end + 1;
        end = document.cookie.indexOf(";", start);

        if(end < start)
            end = document.cookie.length;

        return unescape(document.cookie.substring(start, end));
    }
    return "";
}

// 炜犿偆 歆�泙
function delete_cookie(name)
{
    var today = new Date();

    today.setTime(today.getTime() - 1);
    var value = get_cookie(name);
    if(value != "")
        document.cookie = name + "=" + value + "; path=/; expires=" + today.toGMTString();
}

var last_id = null;
function menu(id)
{
    if (id != last_id)
    {
        if (last_id != null)
            document.getElementById(last_id).style.display = "none";
        document.getElementById(id).style.display = "block";
        last_id = id;
    }
    else
    {
        document.getElementById(id).style.display = "none";
        last_id = null;
    }
}

function textarea_decrease(id, row)
{
    if (document.getElementById(id).rows - row > 0)
        document.getElementById(id).rows -= row;
}

function textarea_original(id, row)
{
    document.getElementById(id).rows = row;
}

function textarea_increase(id, row)
{
    document.getElementById(id).rows += row;
}

// 旮�埆鞛�瓴�偓
function check_byte(content, target)
{
    var i = 0;
    var cnt = 0;
    var ch = '';
    var cont = document.getElementById(content).value;

    for (i=0; i<cont.length; i++) {
        ch = cont.charAt(i);
        if (escape(ch).length > 4) {
            cnt += 2;
        } else {
            cnt += 1;
        }
    }
    // 靾瀽毳�於滊牓
    document.getElementById(target).innerHTML = cnt;

    return cnt;
}

// 敫岆澕鞖办爛鞐愳劀 鞓る笇鞝濏姼鞚�鞕检 膦岉憸
function get_left_pos(obj)
{
    var parentObj = null;
    var clientObj = obj;
    //var left = obj.offsetLeft + document.body.clientLeft;
    var left = obj.offsetLeft;

    while((parentObj=clientObj.offsetParent) != null)
    {
        left = left + parentObj.offsetLeft;
        clientObj = parentObj;
    }

    return left;
}

// 敫岆澕鞖办爛鞐愳劀 鞓る笇鞝濏姼鞚�靸侂嫧 膦岉憸
function get_top_pos(obj)
{
    var parentObj = null;
    var clientObj = obj;
    //var top = obj.offsetTop + document.body.clientTop;
    var top = obj.offsetTop;

    while((parentObj=clientObj.offsetParent) != null)
    {
        top = top + parentObj.offsetTop;
        clientObj = parentObj;
    }

    return top;
}

function flash_movie(src, ids, width, height, wmode)
{
    var wh = "";
    if (parseInt(width) && parseInt(height))
        wh = " width='"+width+"' height='"+height+"' ";
    return "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' "+wh+" id="+ids+"><param name=wmode value="+wmode+"><param name=movie value="+src+"><param name=quality value=high><embed src="+src+" quality=high wmode="+wmode+" type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash' "+wh+"></embed></object>";
}

function obj_movie(src, ids, width, height, autostart)
{
    var wh = "";
    if (parseInt(width) && parseInt(height))
        wh = " width='"+width+"' height='"+height+"' ";
    if (!autostart) autostart = false;
    return "<embed src='"+src+"' "+wh+" autostart='"+autostart+"'></embed>";
}

function doc_write(cont)
{
    document.write(cont);
}

var win_password_lost = function(href) {
    window.open(href, "win_password_lost", "left=50, top=50, width=617, height=330, scrollbars=1");
}

$(document).ready(function(){
    $("#login_password_lost, #ol_password_lost").click(function(){
        win_password_lost(this.href);
        return false;
    });
});

/**
 * 韽澑韸�彀� **/
var win_point = function(href) {
    var new_win = window.open(href, 'win_point', 'left=100,top=100,width=600, height=600, scrollbars=1');
    new_win.focus();
}

/**
 * 飒届 彀� **/
var win_memo = function(href) {
    var new_win = window.open(href, 'win_memo', 'left=100,top=100,width=620,height=500,scrollbars=1');
    new_win.focus();
}

/**
 * 氅旍澕 彀� **/
var win_email = function(href) {
    var new_win = window.open(href, 'win_email', 'left=100,top=100,width=600,height=580,scrollbars=0');
    new_win.focus();
}

/**
 * 鞛愱赴靻岅皽 彀� **/
var win_profile = function(href) {
    var new_win = window.open(href, 'win_profile', 'left=100,top=100,width=620,height=510,scrollbars=1');
    new_win.focus();
}

/**
 * 鞀ろ伂霝�彀� **/
var win_scrap = function(href) {
    var new_win = window.open(href, 'win_scrap', 'left=100,top=100,width=600,height=600,scrollbars=1');
    new_win.focus();
}

/**
 * 頇堩帢鞚挫 彀� **/
var win_homepage = function(href) {
    var new_win = window.open(href, 'win_homepage', '');
    new_win.focus();
}

/**
 * 鞖绊幐氩堩樃 彀� **/
var win_zip = function(frm_name, frm_zip, frm_addr1, frm_addr2, frm_addr3, frm_jibeon) {
    if(typeof daum === 'undefined'){
        alert("雼れ潓 鞖绊幐氩堩樃 postcode.v2.js 韺岇澕鞚�搿滊摐霅橃 鞎婌晿鞀惦媹雼�");
        return false;
    }

    var zip_case = 1;   //0鞚措┐ 霠堨澊鞏� 1鞚措┐ 韼橃澊歆�棎 雭检泴 雱ｊ赴, 2鞚措┐ 靸堨敖

    var complete_fn = function(data){
        // 韺濎梾鞐愳劀 瓴�儔瓴瓣臣 頃鞚�韥措Ν頄堨潉霑�鞁ろ枆頃�旖旊摐毳�鞛戩劚頃橂姅 攵�秳.

        // 臧�欤检唽鞚�雲胳稖 攴滌箼鞐�霐半澕 欤检唽毳�臁绊暕頃滊嫟.
        // 雮措牑鞓る姅 氤�垬臧�臧掛澊 鞐嗠姅 瓴届毎鞐�瓿惦氨('')臧掛潉 臧�氙�, 鞚措ゼ 彀戈碃頃橃棳 攵勱赴 頃滊嫟.
        var fullAddr = ''; // 斓滌 欤检唽 氤�垬
        var extraAddr = ''; // 臁绊暕順�欤检唽 氤�垬

        // 靷毄鞛愱皜 靹犿儩頃�欤检唽 韮�瀰鞐�霐半澕 頃措嫻 欤检唽 臧掛潉 臧�牳鞓嫟.
        if (data.userSelectedType === 'R') { // 靷毄鞛愱皜 霃勲氇�欤检唽毳�靹犿儩頄堨潉 瓴届毎
            fullAddr = data.roadAddress;

        } else { // 靷毄鞛愱皜 歆�矆 欤检唽毳�靹犿儩頄堨潉 瓴届毎(J)
            fullAddr = data.jibunAddress;
        }

        // 靷毄鞛愱皜 靹犿儩頃�欤检唽臧�霃勲氇�韮�瀰鞚茧晫 臁绊暕頃滊嫟.
        if(data.userSelectedType === 'R'){
            //氩曥爼霃欕獏鞚�鞛堨潉 瓴届毎 於旉皜頃滊嫟.
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            // 瓯措氇呾澊 鞛堨潉 瓴届毎 於旉皜頃滊嫟.
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 臁绊暕順曥＜靻岇潣 鞙犽鞐�霐半澕 鞏戩鞐�甏勴樃毳�於旉皜頃橃棳 斓滌 欤检唽毳�毵岆摖雼�
            extraAddr = (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
        }

        // 鞖绊幐氩堩樃鞕�欤检唽 鞝曤炒毳�頃措嫻 頃勲摐鞐�雱ｊ碃, 旎れ劀毳�靸侅劯欤检唽 頃勲摐搿�鞚措彊頃滊嫟.
        var of = document[frm_name];

        of[frm_zip].value = data.zonecode;

        of[frm_addr1].value = fullAddr;
        of[frm_addr3].value = extraAddr;

        if(of[frm_jibeon] !== undefined){
            of[frm_jibeon].value = data.userSelectedType;
        }

        of[frm_addr2].focus();
    };

    switch(zip_case) {
        case 1 :    //iframe鞚�鞚挫毄頃橃棳 韼橃澊歆�棎 雭检泴 雱ｊ赴
            var daum_pape_id = 'daum_juso_page'+frm_zip,
                element_wrap = document.getElementById(daum_pape_id),
                currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            if (element_wrap == null) {
                element_wrap = document.createElement("div");
                element_wrap.setAttribute("id", daum_pape_id);
                element_wrap.style.cssText = 'display:none;border:1px solid;left:0;width:100%;height:300px;margin:5px 0;position:relative;-webkit-overflow-scrolling:touch;';
                element_wrap.innerHTML = '<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-21px;z-index:1" class="close_daum_juso" alt="鞝戧赴 氩勴娂">';
                jQuery('form[name="'+frm_name+'"]').find('input[name="'+frm_addr1+'"]').before(element_wrap);
                jQuery("#"+daum_pape_id).off("click", ".close_daum_juso").on("click", ".close_daum_juso", function(e){
                    e.preventDefault();
                    jQuery(this).parent().hide();
                });
            }

            new daum.Postcode({
                oncomplete: function(data) {
                    complete_fn(data);
                    // iframe鞚�雱ｌ潃 element毳�鞎堧炒鞚搓矊 頃滊嫟.
                    element_wrap.style.display = 'none';
                    // 鞖绊幐氩堩樃 彀娟赴 頇旊┐鞚�氤挫澊旮�鞚挫爠鞙茧 scroll 鞙勳箻毳�霅橂弻毽半嫟.
                    document.body.scrollTop = currentScroll;
                },
                // 鞖绊幐氩堩樃 彀娟赴 頇旊┐ 韥赴臧�臁办爼霅橃棃鞚勲晫 鞁ろ枆頃�旖旊摐毳�鞛戩劚頃橂姅 攵�秳.
                // iframe鞚�雱ｌ潃 element鞚�雴掛澊臧掛潉 臁办爼頃滊嫟.
                onresize : function(size) {
                    element_wrap.style.height = size.height + "px";
                },
                width : '100%',
                height : '100%'
            }).embed(element_wrap);

            // iframe鞚�雱ｌ潃 element毳�氤挫澊瓴�頃滊嫟.
            element_wrap.style.display = 'block';
            break;
        case 2 :    //靸堨敖鞙茧 霛勳毎旮�            new daum.Postcode({
                oncomplete: function(data) {
                    complete_fn(data);
                }
            }).open();
            break;
        default :   //iframe鞚�鞚挫毄頃橃棳 霠堨澊鞏�霛勳毎旮�            var rayer_id = 'daum_juso_rayer'+frm_zip,
                element_layer = document.getElementById(rayer_id);
            if (element_layer == null) {
                element_layer = document.createElement("div");
                element_layer.setAttribute("id", rayer_id);
                element_layer.style.cssText = 'display:none;border:5px solid;position:fixed;width:300px;height:460px;left:50%;margin-left:-155px;top:50%;margin-top:-235px;overflow:hidden;-webkit-overflow-scrolling:touch;z-index:10000';
                element_layer.innerHTML = '<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" class="close_daum_juso" alt="雼赴 氩勴娂">';
                document.body.appendChild(element_layer);
                jQuery("#"+rayer_id).off("click", ".close_daum_juso").on("click", ".close_daum_juso", function(e){
                    e.preventDefault();
                    jQuery(this).parent().hide();
                });
            }

            new daum.Postcode({
                oncomplete: function(data) {
                    complete_fn(data);
                    // iframe鞚�雱ｌ潃 element毳�鞎堧炒鞚搓矊 頃滊嫟.
                    element_layer.style.display = 'none';
                },
                width : '100%',
                height : '100%'
            }).embed(element_layer);

            // iframe鞚�雱ｌ潃 element毳�氤挫澊瓴�頃滊嫟.
            element_layer.style.display = 'block';
    }
}

/**
 * 靸堧鞖�牍勲皜氩堩樃 攵勳嫟 彀�: 101123
 **/
win_password_lost = function(href)
{
    var new_win = window.open(href, 'win_password_lost', 'width=617, height=350, scrollbars=1');
    new_win.focus();
}

/**
 * 靹る臁办偓 瓴瓣臣
 **/
var win_poll = function(href) {
    var new_win = window.open(href, 'win_poll', 'width=616, height=500, scrollbars=1');
    new_win.focus();
}

/**
 * 鞀ろ伂毽半Μ雿�氙胳偓鞖╈瀽毳�鞙勴暅 鞀ろ伂毽巾姼 - 歆�毚鞎勲範 2013-04-22
 * alt 臧掚 臧栯姅 攴鸽灅頂�毵來伂鞐�毵堨毎鞀れ槫氩�鞁�title 臧�攵�棳, 毵堨毎鞀れ晞鞗�鞁�title 臧�鞝滉卑
 **/
$(function() {
    $('a img').mouseover(function() {
        $a_img_title = $(this).attr('alt');
        $(this).attr('title', $a_img_title);
    }).mouseout(function() {
        $(this).attr('title', '');
    });
});

/**
 * 韰嶌姢韸�毽偓鞚挫
**/
function font_resize(id, rmv_class, add_class)
{
    var $el = $("#"+id);

    $el.removeClass(rmv_class).addClass(add_class);

    set_cookie("ck_font_resize_rmv_class", rmv_class, 1, g5_cookie_domain);
    set_cookie("ck_font_resize_add_class", add_class, 1, g5_cookie_domain);
}

$(function(){
    $(".win_point").click(function() {
        win_point(this.href);
        return false;
    });

    $(".win_memo").click(function() {
        win_memo(this.href);
        return false;
    });

    $(".win_email").click(function() {
        win_email(this.href);
        return false;
    });

    $(".win_scrap").click(function() {
        win_scrap(this.href);
        return false;
    });

    $(".win_profile").click(function() {
        win_profile(this.href);
        return false;
    });

    $(".win_homepage").click(function() {
        win_homepage(this.href);
        return false;
    });

    $(".win_password_lost").click(function() {
        win_password_lost(this.href);
        return false;
    });

    /*
    $(".win_poll").click(function() {
        win_poll(this.href);
        return false;
    });
    */

    // 靷澊霌滊钒
    var sv_hide = false;
    $(".sv_member, .sv_guest").click(function() {
        $(".sv").removeClass("sv_on");
        $(this).closest(".sv_wrap").find(".sv").addClass("sv_on");
    });

    $(".sv, .sv_wrap").hover(
        function() {
            sv_hide = false;
        },
        function() {
            sv_hide = true;
        }
    );

    $(".sv_member, .sv_guest").focusin(function() {
        sv_hide = false;
        $(".sv").removeClass("sv_on");
        $(this).closest(".sv_wrap").find(".sv").addClass("sv_on");
    });

    $(".sv a").focusin(function() {
        sv_hide = false;
    });

    $(".sv a").focusout(function() {
        sv_hide = true;
    });

    // 靺�爥韸�ul
    var sel_hide = false;
    $('.sel_btn').click(function() {
        $('.sel_ul').removeClass('sel_on');
        $(this).siblings('.sel_ul').addClass('sel_on');
    });

    $(".sel_wrap").hover(
        function() {
            sel_hide = false;
        },
        function() {
            sel_hide = true;
        }
    );

    $('.sel_a').focusin(function() {
        sel_hide = false;
    });

    $('.sel_a').focusout(function() {
        sel_hide = true;
    });

    $(document).click(function() {
        if(sv_hide) { // 靷澊霌滊钒 頃挫牅
            $(".sv").removeClass("sv_on");
        }
        if (sel_hide) { // 靺�爥韸�ul 頃挫牅
            $('.sel_ul').removeClass('sel_on');
        }
    });

    $(document).focusin(function() {
        if(sv_hide) { // 靷澊霌滊钒 頃挫牅
            $(".sv").removeClass("sv_on");
        }
        if (sel_hide) { // 靺�爥韸�ul 頃挫牅
            $('.sel_ul').removeClass('sel_on');
        }
    });

    $(document).on( "keyup change", "textarea#wr_content[maxlength]", function(){
        var str = $(this).val();
        var mx = parseInt($(this).attr("maxlength"));
        if (str.length > mx) {
            $(this).val(str.substr(0, mx));
            return false;
        }
    });
});