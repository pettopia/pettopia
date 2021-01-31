<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 공지사항</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">
	.left_side
	{
		width: 200px;
    	float: left;
	}

</style>

</head>
<body>

	<div id="wrap"><!-- 바디 전체 -->
		
		<div class="header" style="background-color: #ccc; height: 100px;">
			헤더 영역
		</div>

		<div id="container">
		
			<div class="left_side">
				<c:import url="AdminLeftSide.jsp"></c:import>
			</div><!-- .left_side -->
			
			<!-- 게시판 공통사항 -->
			<div class="div_inner">
				<div class="contents_wrap">
					<!-- 게시글 -->
					<h1 class="con_title">
						공지사항
					</h1>
					
					<div id="textEditorFrame">
						<form id="frmCreate" method="post" action="">
							<span>공지사항게시글코드 : A32231570</span>
							<div class="title_wrap">
								<input type="text" id="title" name="title" value="연휴 고객센터 운영 중단 안내" class="board_title_input" placeholder="제목을 입력해주세요.">
							</div><!-- .title_wrap end -->
							
							<div class="write_form_wrap">
								<div class="editor_sec">
									<div class="edSec">
										<div id="selectBar" class="edSelectStyleBar">
					                        <a href="javascript:void(0);" onclick="editorLayer.clearLayer('editorLayerSec', editorProc01); return false;" class="editorBackboard"></a>
					                        <div class="edFSec02">
					                            <a href="javascript:void(0)" id="editorProc01-useFocusOut" style="width:0px;height:0px;margin:0;font-size:1px;"></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.size(editorProc01, 15, this); return false;" class="fontSize" title="크기"><strong>크기</strong></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.bold(editorProc01); return false;" class="fontWeight" title="굵게"><strong>굵게</strong></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.italic(editorProc01); return false;" class="fontItalic" title="기울임"><strong>기울임</strong></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.underline(editorProc01); return false;" class="fontUnderline" title="밑줄"><strong>밑줄</strong></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.color(editorProc01, 24, this); return false;" class="fontColor" title="글자색"><strong>글자색</strong></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.bgcolor(editorProc01, 58, this); return false;" class="fontBgcolor" title="글자배경색"><strong>글자배경색</strong></a>
					                        </div>
					                        <div class="edBar"><strong>구분선</strong></div>
					                        <div class="edFSec02">
					                            <a href="javascript:void(0)" onclick="editorEventHandler.alignLeft(editorProc01); return false;" class="arrayLeft" title="왼쪽"><strong>왼쪽</strong></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.alignCenter(editorProc01); return false;" class="arrayCenter" title="가운데"><strong>가운데</strong></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.alignRight(editorProc01); return false;" class="arrayRight" title="오른쪽"><strong>오른쪽</strong></a>
					                        </div>
					                        <div class="edBar"><strong>구분선</strong></div>
					                        <div class="edFSec02">
					                            <a href="javascript:void(0)" onclick="editorEventHandler.hr(editorProc01); return false;" class="etcLine" title="선긋기"><strong>선긋기</strong></a>
					                            <a href="javascript:void(0)" onclick="editorEventHandler.link(editorProc01, 117, this); return false;" class="etcLink" title="링크"><strong>링크</strong></a>
					                        </div>
					                        <div class="edFSec03">
					                            <a href="javascript:void(0)" onclick="editorEventHandler.imgUpload(editorProc01, 373, this); return false;" class="uploadImage" title="이미지">
					                                <strong>이미지</strong>
					                            </a>
					                        </div>
					                    </div><!-- #selectBar end -->
					                    <div class="edWSec">
					                        <a href="javascript:void(0);" onclick="editorLayer.clearLayer('editorLayerSec', editorProc01); return false;" class="editorBackboard"></a>
					                        <iframe frameborder="0" class="editWindow" name="editWindow" id="editWindow">
					                        	#document
					                        	<html>
					                        		<head>
					                        			<style type="text/css">
					                        				@font-face {font-family:'Nanum Square';font-style:normal;font-weight:400;src:url(https://maplestory.nexon.com/fonts/NanumSquareR.eot);src:url(https://maplestory.nexon.com/fonts/NanumSquareR.eot?#iefix) format('embedded-opentype'), url(https://maplestory.nexon.com/fonts/NanumSquareR.woff2) format('woff2'), url(https://maplestory.nexon.com/fonts/NanumSquareR.woff) format('woff'), url(https://maplestory.nexon.com/fonts/NanumSquareR.ttf) format('truetype');}@font-face {font-family:'Nanum Square';font-style:bold;font-weight:700;src:url(https://maplestory.nexon.com/fonts/NanumSquareB.eot);src:url(https://maplestory.nexon.com/fonts/NanumSquareB.eot?#iefix) format('embedded-opentype'), url(https://maplestory.nexon.com/fonts/NanumSquareB.woff2) format('woff2'), url(https://maplestory.nexon.com/fonts/NanumSquareB.woff) format('woff'), url(https://maplestory.nexon.com/fonts/NanumSquareB.ttf) format('truetype');}* {margin:0;padding:0;list-style:none;border:0;text-decoration:none;font-family:'Malgun Gothic', sans-serif;letter-spacing:-0.06em;}table {border-collapse:collapse; border-spacing:0;}body {font-size:16px;line-height:32px;}a {text-decoration:none;}hr {display:block;unicode-bidi:isolate;margin-block-start:0.5em;margin-block-end:0.5em;margin-inline-start:auto;margin-inline-end:auto;overflow:hidden;border-style:inset;border-width:1px;}u {text-decoration:underline;}
					                        			</style>
					                        		</head>
					                        		<body></body>
					                        	</html>
					                        </iframe>
					                        <textarea class="editWindow" name="textWindow" id="textWindow" rows="9" cols="40">
안녕하세요.
펫토피아 운영관리팀입니다.
크리스마스 연휴 기간(2020.12.25 09:00 ~ 2020.12.27 18:00) 동안
고객센터 통화 품질 향상을 위한 서비스 점검이 있을 예정입니다.
점검 기간동안 불편을 드려 죄송합니다.

서비스 이용에 대한 긴급한 문의 사항은 master@petopia.com 으로 메일 주시면
신속하게 처리해드리겠습니다.

감사합니다




					                        </textarea>
					                    </div>
									</div><!-- .edSec end -->
									
<div id='CommunityBoard_m_HtmlEditor'>
<div id='CommunityBoard_m_HtmlEditor_HtmlTagFilter_division'></div>
<div id='CommunityBoard_m_HtmlEditor_ItemSelect_division'></div>
<input type='hidden' name='CommunityBoard_m_HtmlEditor_strContent_OnlyHtml' id='CommunityBoard_m_HtmlEditor_strContent_OnlyHtml' value=''/>
<input type='hidden' name='CommunityBoard_m_HtmlEditor_strContent_OnlyText' id='CommunityBoard_m_HtmlEditor_strContent_OnlyText'/>
<input type='hidden' name='CommunityBoard_m_HtmlEditor_oidImageFiles' id='CommunityBoard_m_HtmlEditor_oidImageFiles'/>
<input type='hidden' name='CommunityBoard_m_HtmlEditor_oidMovieFiles' id='CommunityBoard_m_HtmlEditor_oidMovieFiles'/>
<input type='hidden' name='CommunityBoard_m_HtmlEditor_oidMovieThumbFiles' id='CommunityBoard_m_HtmlEditor_oidMovieThumbFiles'/>
<input type='hidden' name='CommunityBoard_m_HtmlEditor_strPlayTime' id='CommunityBoard_m_HtmlEditor_strPlayTime'/>
<input type='hidden' name='CommunityBoard_m_HtmlEditor_strMovieThumbSNList' id='CommunityBoard_m_HtmlEditor_strMovieThumbSNList'/>
<input type='hidden' name='CommunityBoard_m_HtmlEditor_strMovieThumbPlayTimeList' id='CommunityBoard_m_HtmlEditor_strMovieThumbPlayTimeList'/>
<textarea id='CommunityBoard_m_HtmlEditor_strArticleContent_Mod_Textarea' cols=100 rows=30 title='내용을 입력하세요' style=display:none;></textarea>
<script type="text/javascript">    

    function Createm_HtmlEditor() {
        editorProc01 = new htmlEditor();
        editorProc01.objObject = 'editorProc01';
		editorProc01.styleBar = 'selectBar';
        editorProc01.iframeID = 'editWindow';
        editorProc01.textareaID = 'textWindow';
        editorProc01.useFocusOut = 'editorProc01-useFocusOut';

        editorProc01.cssUrl = '';
        editorProc01.codeWriterType = 1;
        editorProc01.boxWidth = 1000;
        editorProc01.init(editorProc01.iframeID, editorProc01.cssUrl);
        //미리 만들어진 컨텐츠가 있을경우 아이프레임으로 이동시켜줌
        editorProc01.imageURL = 'https://file.nexon.com/NxFile/download/FileDownloader.aspx';
        editorProc01.movieURLInfoURL = 'https://file.nexon.com/NxFile/Download/MovieDownloader.aspx';

        editorProc01.applyHtmlToIframe(document.getElementById('CommunityBoard_m_HtmlEditor_strArticleContent_Mod_Textarea').value);
    }

	function CommunityBoard_m_HtmlEditor_CheckValidation() {
		var n4ImageCount = editorProc01.returnResultImageCount();
		var n4MovieCount = editorProc01.returnResultVodCount();

		if ((n4ImageCount + n4MovieCount) > 30) {
			alert('파일은 최대 30개까지 올릴 수 있습니다.');
			return false;
		}

		document.getElementById('CommunityBoard_m_HtmlEditor_strContent_OnlyHtml').value = editorProc01.returnResultHtml();
		document.getElementById('CommunityBoard_m_HtmlEditor_strContent_OnlyText').value = editorProc01.returnResultText();
		document.getElementById('CommunityBoard_m_HtmlEditor_oidImageFiles').value = editorProc01.returnResultImageList();
		document.getElementById('CommunityBoard_m_HtmlEditor_oidMovieFiles').value = editorProc01.returnResultVodList();
		document.getElementById('CommunityBoard_m_HtmlEditor_oidMovieThumbFiles').value = editorProc01.returnResultVodThumbList();
		document.getElementById('CommunityBoard_m_HtmlEditor_strPlayTime').value = editorProc01.returnResultVodPlayTimeList();
		document.getElementById('CommunityBoard_m_HtmlEditor_strMovieThumbSNList').value = editorProc01.returnResultMovieThumbList();
		document.getElementById('CommunityBoard_m_HtmlEditor_strMovieThumbPlayTimeList').value = editorProc01.returnResultMovieThumbPlayTimeList();

		var strIamgeList = editorProc01.returnResultImageList();
		var strMovieList = editorProc01.returnResultVodList();
		var strText = document.getElementById( 'CommunityBoard_m_HtmlEditor_strContent_OnlyHtml' ).value;
		var strTextOnly = document.getElementById( 'CommunityBoard_m_HtmlEditor_strContent_OnlyText' ).value;

		if (strText == '' && true) { alert('내용을 입력하세요.'); return false; } if (strText.length < 2) { alert('내용은 두 글자 이상 입력 해 주세요.'); return false; }
		if (strTextOnly == '' && true) { alert('글을 입력하세요.'); return false; } if (strTextOnly.length < 2) { alert('글은 두 글자 이상 입력 해 주세요.'); return false; } return true;
	}

    function realtimeSave() {
        add_event(editorProc01.editWindow, 'blur', function() { editorEventHandler.tempSave(editorProc01) });
        add_event(editorProc01.editWindow, 'focus', function() { editorEventHandler.onfocusStatus(editorProc01) });
        add_event(document.getElementById('editorProc01-useFocusOut'), 'focus', function() { editorProc01.editWindow.focus() });
    }

    var editorPopup =
			{
			    uploadImgFilePopup: function(uri, n4width, n4height) {
			        var n4ImageCount = editorProc01.returnResultImageCount();
			        var n4MovieCount = editorProc01.returnResultVodCount();

			        if ((n4ImageCount + n4MovieCount) >= 30) {
			            alert('파일은 최대 30개까지 올릴 수 있습니다.');
			            return false;
			        }

			        uri += ((uri.indexOf('?') == -1) ? '?' : '&') + 'CallBackComplete=editorPopup.uploadImgFilesComplete&CallBackCancel=editorPopup.uploadFileCancel';
			        editorProc01.getSelection();
			        editorProc01.lockEditorSec();
			        popup(uri, 'image_pop', n4width, n4height);
			    },
			    uploadVodFilePopup: function(uri, n4width, n4height) {
			        if (!NgbBrowser.msie()) {
			            alert("지원하지 않는 브라우저 입니다.");
			            return false;
			        }

			        var n4ImageCount = editorProc01.returnResultImageCount();
			        var n4MovieCount = editorProc01.returnResultVodCount();

			        if ((n4ImageCount + n4MovieCount) >= 30) {
			            alert('파일은 최대 30개까지 올릴 수 있습니다.');
			            return false;
			        }

			        uri += ((uri.indexOf('?') == -1) ? '?' : '&') + 'CallBackComplete=editorPopup.uploadVodFileComplete&CallBackCancel=editorPopup.uploadFileCancel';
			        editorProc01.getSelection();
			        editorProc01.lockEditorSec();
			        popup(uri, 'image_pop', n4width, n4height);
			    },
			    uploadImgFilesComplete: function( strJson ) {
			        editorProc01.unlockEditorSec();
			        editorProc01.setSelection();
					
					var objFiles = eval ( '(' + strJson + ')' );
			        var n4ImageCount = editorProc01.returnResultImageCount();
			        var n4MovieCount = editorProc01.returnResultVodCount();

			        if ((n4ImageCount + n4MovieCount + objFiles.items.length ) > 30) {
			            alert('파일은 최대 30개까지 올릴 수 있습니다.');
			            return false;
			        }

			        var innerImage = '';
			        for (var i = 0; i < objFiles.items.length; ++i) {
			            if( objFiles.items[i].n8FileSN != '' ) {
			                innerImage += '<img src="https://file.nexon.com/NxFile/download/FileDownloader.aspx?oidFile=' + objFiles.items[i].n8FileSN + '" border="0" />';
			            }
			        }
			        if (editorProc01.varGetSelection.length != 1) {
			            if (editorProc01.editWindow.document.selection) {
			                editorProc01.editWindow.focus();
			                editorProc01.varGetSelection.pasteHTML(innerImage);
			            }
			            else {
			                if (editorProc01.varGetSelection.startOffset == 0) {
			                    editorProc01.editWindow.document.getElementsByTagName('body')[0].innerHTML += innerImage;
			                }
			                else {
			                    editorProc01.varGetSelection.deleteContents();
			                    editorProc01.varGetSelection.insertNode(editorProc01.varGetSelection.createContextualFragment(innerImage));
			                }
			            }
			        }
			        else {
			            alert("이미지가 추가되지않았습니다.\n 선택영역이 잘못되었습니다.");
			            return false;
			        }
			    },
			    uploadVodFileComplete: function(oidMovieFile, oidMovieThumb, movieTag, n4PlayTime, strMovieThumbSNList, MovieThumbPlayTimeList) {
			        editorProc01.unlockEditorSec();
			        editorProc01.setSelection();
			        var innerDiv = '<div class="editorMovieArea" style="width:380px;height:276px;background:url(https://ssl.nx.com/S2/Portal/Nexon/Nexon2007/image/gch/img_space_movie2.jpg) no-repeat;" contentEditable="false" class="contentsMovieSec" id="newMovieArea' + oidMovieFile + '">';
			        innerDiv += '	<span contentEditable="false" class="oidMovieFile" style="display:none;width:1px;height:1px;overflow:hidden;font-size:0;color:#FBFBFB;">' + oidMovieFile + '</span>';
			        innerDiv += '	<span contentEditable="false" class="oidMovieThumb" style="display:none;width:1px;height:1px;overflow:hidden;font-size:0;color:#FBFBFB;">' + oidMovieThumb + '</span>';
			        innerDiv += '	<span contentEditable="false" class="movieTag" style="display:none;width:1px;height:1px;overflow:hidden;font-size:0;color:#FBFBFB;">' + movieTag + '</span>';
			        innerDiv += '	<span contentEditable="false" class="n4PlayTime" style="display:none;width:1px;height:1px;overflow:hidden;font-size:0;color:#FBFBFB;">' + n4PlayTime + '</span>';

			        if (strMovieThumbSNList) { innerDiv += '	<span contentEditable="false" class="strMovieThumbSNList" style="display:none;width:1px;height:1px;overflow:hidden;font-size:0;color:#FBFBFB;">' + strMovieThumbSNList + '</span>' }
			        else { innerDiv += '	<span contentEditable="false" class="strMovieThumbSNList" style="display:none;width:1px;height:1px;overflow:hidden;font-size:0;color:#FBFBFB;"></span>' }

			        if (MovieThumbPlayTimeList) { innerDiv += '	<span contentEditable="false" class="MovieThumbPlayTimeList" style="display:none;width:1px;height:1px;overflow:hidden;font-size:0;color:#FBFBFB;">' + MovieThumbPlayTimeList + '</span>' }
			        else { innerDiv += '	<span contentEditable="false" class="MovieThumbPlayTimeList" style="display:none;width:1px;height:1px;overflow:hidden;font-size:0;color:#FBFBFB;"></span>' }

			        innerDiv += '</div>';
			        var playTimeInput = document.getElementById('CommunityBoard_m_HtmlEditor_strPlayTime').value;
			        if (playTimeInput != '') {
			            playTimeInput += ',' + n4PlayTime;
			        }
			        else {
			            playTimeInput += n4PlayTime;
			        }

			        editorProc01.editWindow.focus();
			        if (editorProc01.editWindow.document.selection) {
			            editorProc01.varGetSelection.pasteHTML(innerDiv);
			        }
			        else {
			            if (editorProc01.varGetSelection.startOffset == 0) {
			                editorProc01.editWindow.document.getElementsByTagName('body')[0].innerHTML += innerDiv;
			            }
			            else {
			                editorProc01.varGetSelection.deleteContents();
			                editorProc01.varGetSelection.insertNode(editorProc01.varGetSelection.createContextualFragment(innerDiv));
			            }
			        }
			    },
			    uploadFileCancel: function() {
			        editorProc01.unlockEditorSec();
			    }
			}
	</script>		
</div>
									
									
								</div><!-- .editor_sec end -->
							</div><!-- .write_form_wrap end -->
							
					        <div class="btn_wrap">
					            <a href="#a" class="btn03_g">취소</a><!-- 목록으로 이동 -->
					            <a href="#a" id="btnWrite" class="btn03_b">등록</a>
					        </div>
        
						</form>
						
						<div id="editorLayerSec" style="top: 300px; width: 1px; left: 373px;">
							<div class="selectImageuploader">
								<div class="emoList">
									
								</div>
							</div>
						
						</div>
	
					</div><!-- #textEditorFrame end -->
	
				</div><!-- .contents_wrap end -->
				
				
				
				<div class="right_aside">
					<!-- 우측 사이드 -->
					
					<div class="side_board_info">
						<h2>
							공지사항
							<span class="side_more_btn">
								<a href="#a">
									<img src="<%=cp%>/img/side_board_more_on.png">
								</a>
							</span>
						</h2>
						
						<ul class="side_board_wrap">
							<li><a href="#a"><span class="color1">공지</span>연휴 고객센터 운영 중단 안내</li>
							<li><a href="#a"><span class="color1">공지</span>모임 에티켓 안내</li>
							<li><a href="#a"><span class="color1">공지</span>로그인 문제 해결방법을 확인해보세요</li>
							<li><a href="#a"><span class="color1">공지</span>12/24(목) 03:00~05:00 서버점검 안내</li>
							<li><a href="#a"><span class="color1">공지</span>테스트 서비스 운영기간 안내</li>
						</ul>
						
						<div class="side_banner_wrap">
							<div class="side_bn_img_wrap">
								<ul>
									<li><a href="#a" target="_black"><img src="<%=cp%>/img/ad_img3.png"></a></li>
								</ul>
							</div>
							<div class="side_bn_txt">
								<p id="event_current_text">
									<span style="display: block;">new! 애견샴푸</span>
								</p>
								<!-- 
								<div class="side_bn_control">
								
								</div>
								-->
							</div>
						</div>
					</div>
				</div>
				
			</div>

		</div>

		<div id="footer" style="background-color: darkGray;">
			<div class="div_inner">
				<div class="footer_info">
					<ul>
						<li>프로젝트소개</li>
						<li>이용약관</li>
						<li>사이트맵</li>
					</ul>
					<br>
					<p>
						<span>펫토피아</span>
						<span style="margin-left:5px;">강정우 김보경 박민하 박해진 정의진</span><br>
						<span>쌍용강북교육센터</span>
						<span style="margin-left:5px;">서울 마포구 월드컵북로 21 2층 풍성빌딩(서교동 447-5)</span>
					</p>
					<br>
					<span class="copyright">ⓒ 펫토피아 All Rights Reserved.</span>
				</div><!-- .footer_info end -->
			</div><!-- .div_inner end -->

		</div><!-- #footer end -->

	</div>

</body>
</html>