<%inherit file="base.mako" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
    <meta http-equiv="X-UA-Compatible" content="IE=9"/>
    <meta name="generator" content="Doxygen 1.8.3.1"/>
    <title>openFrameworks: Class Index</title>
    <link href="tabs.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="dynsections.js"></script>
    <link href="search/search.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="search/search.js"></script>
    <script type="text/javascript">
      $(document).ready(function() { searchBox.OnSelectItem(0); });
    </script>
    <link href="doxygen.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="content">
      ${self.header()}
      <div id="body-wrap">
      		<div class="page-wide">
	            <div class="page-left-split">
           		    <h1 class="documentation">reference</h1> <ul class="docsadvanced"><li><a href="/documentation">basic</a></li> <li><a  class="active" href="/doxygen/annotated.html">advanced</a></li> </ul>
           		</div>
		        <div class="page-right-narrow">
			        <p>This documentation is automatically generated from the openFrameworks source code using doxygen and refers to the most recent release, version <strong>${bf.config.currentVersion}</strong>.</p>
		        </div>
       		</div>
      		<div class="page-wide">
      		    <div class="doxy-mainmenu">
<!-- Generated by Doxygen 1.8.3.1 -->
  <div id="navrow1" class="tabs">
    <ul class="tablist">
      <li><a href="index.html"><span>Main&#160;Page</span></a></li>
      <li><a href="namespaces.html"><span>Namespaces</span></a></li>
      <li><a href="annotated.html"><span>Classes</span></a></li>
      <li class="current"><a href="files.html"><span>Files</span></a></li>
    </ul>
  </div>
  <div id="navrow2" class="tabs2">
    <ul class="tablist">
      <li><a href="files.html"><span>File&#160;List</span></a></li>
      <li><a href="globals.html"><span>File&#160;Members</span></a></li>
    </ul>
  </div>
<div id="nav-path" class="navpath">
  <ul>
<li class="navelem"><a class="el" href="dir_84d5b34cee6369a03c8d1f3b970ed216.html">openFrameworks</a></li><li class="navelem"><a class="el" href="dir_526ceb304abbba6426340f0fa9170dbd.html">utils</a></li>  </ul>
</div>
</div><!-- top -->
<div class="header">
  <div class="headertitle">
<div class="title">ofSystemUtils.h</div>  </div>
</div><!--header-->
<div class="contents">
<a href="of_system_utils_8h.html">Go to the documentation of this file.</a><div class="fragment"><div class="line"><a name="l00001"></a><span class="lineno">    1</span>&#160;<span class="preprocessor">#pragma once</span></div>
<div class="line"><a name="l00002"></a><span class="lineno">    2</span>&#160;<span class="preprocessor"></span></div>
<div class="line"><a name="l00003"></a><span class="lineno">    3</span>&#160;</div>
<div class="line"><a name="l00004"></a><span class="lineno"><a class="code" href="classof_file_dialog_result.html">    4</a></span>&#160;<span class="keyword">class </span><a class="code" href="classof_file_dialog_result.html">ofFileDialogResult</a>{</div>
<div class="line"><a name="l00005"></a><span class="lineno">    5</span>&#160;    <span class="keyword">public</span>:</div>
<div class="line"><a name="l00006"></a><span class="lineno">    6</span>&#160;        <a class="code" href="classof_file_dialog_result.html#a1dc2551f2b1f749291f25f750dc9831c">ofFileDialogResult</a>();</div>
<div class="line"><a name="l00007"></a><span class="lineno">    7</span>&#160;        </div>
<div class="line"><a name="l00008"></a><span class="lineno">    8</span>&#160;        <span class="comment">//TODO: only 1 file for now</span></div>
<div class="line"><a name="l00009"></a><span class="lineno">    9</span>&#160;        <span class="keywordtype">string</span> <a class="code" href="classof_file_dialog_result.html#a80fd7a5c48d882cc6c93c0aa4675b5a2">getName</a>();</div>
<div class="line"><a name="l00010"></a><span class="lineno">   10</span>&#160;        <span class="keywordtype">string</span> <a class="code" href="classof_file_dialog_result.html#ad410507288163f82834434ac7ede39a5">getPath</a>();</div>
<div class="line"><a name="l00011"></a><span class="lineno">   11</span>&#160;        </div>
<div class="line"><a name="l00012"></a><span class="lineno"><a class="code" href="classof_file_dialog_result.html#a10333951dbf932e377a866e290bea374">   12</a></span>&#160;        <span class="keywordtype">string</span> <a class="code" href="classof_file_dialog_result.html#a10333951dbf932e377a866e290bea374">filePath</a>;</div>
<div class="line"><a name="l00013"></a><span class="lineno"><a class="code" href="classof_file_dialog_result.html#ae23f66d2b7acca659640bed99850b462">   13</a></span>&#160;        <span class="keywordtype">string</span> <a class="code" href="classof_file_dialog_result.html#ae23f66d2b7acca659640bed99850b462">fileName</a>;</div>
<div class="line"><a name="l00014"></a><span class="lineno"><a class="code" href="classof_file_dialog_result.html#a63f36565e8613c7fd654c310ae127204">   14</a></span>&#160;        <span class="keywordtype">bool</span> <a class="code" href="classof_file_dialog_result.html#a63f36565e8613c7fd654c310ae127204">bSuccess</a>;</div>
<div class="line"><a name="l00015"></a><span class="lineno">   15</span>&#160;};</div>
<div class="line"><a name="l00016"></a><span class="lineno">   16</span>&#160;</div>
<div class="line"><a name="l00017"></a><span class="lineno">   17</span>&#160;<span class="keywordtype">void</span> <a class="code" href="of_system_utils_8cpp.html#af5a9f8b8d9fffde3fadbb5fd000598d1">ofSystemAlertDialog</a>(<span class="keywordtype">string</span> errorMessage);</div>
<div class="line"><a name="l00018"></a><span class="lineno">   18</span>&#160;<a class="code" href="classof_file_dialog_result.html">ofFileDialogResult</a> <a class="code" href="of_system_utils_8cpp.html#a75562c27b6f9273d8497f9a16317bd77">ofSystemLoadDialog</a>(<span class="keywordtype">string</span> windowTitle=<span class="stringliteral">&quot;&quot;</span>, <span class="keywordtype">bool</span> bFolderSelection = <span class="keyword">false</span>, <span class="keywordtype">string</span> defaultPath=<span class="stringliteral">&quot;&quot;</span>);</div>
<div class="line"><a name="l00019"></a><span class="lineno">   19</span>&#160;<a class="code" href="classof_file_dialog_result.html">ofFileDialogResult</a> <a class="code" href="of_system_utils_8cpp.html#a6c0dcbbef4e61259712dbc5775506e19">ofSystemSaveDialog</a>(<span class="keywordtype">string</span> defaultName, <span class="keywordtype">string</span> messageName);</div>
<div class="line"><a name="l00020"></a><span class="lineno">   20</span>&#160;<span class="keywordtype">string</span> <a class="code" href="of_system_utils_8cpp.html#a3d06dd95928a4ddd6e5276cd8c298f53">ofSystemTextBoxDialog</a>(<span class="keywordtype">string</span> question, <span class="keywordtype">string</span> text=<span class="stringliteral">&quot;&quot;</span>);</div>
</div><!-- fragment --></div><!-- contents -->

            </div>
      </div>
      <div id="footer">
        ${self.footer()}
      </div> <!-- End Footer -->
    </div> <!-- End Content -->
  </body>
</html>
<%def name="header()">
  <%include file="header.mako" args="active='documentation'" />
</%def>
