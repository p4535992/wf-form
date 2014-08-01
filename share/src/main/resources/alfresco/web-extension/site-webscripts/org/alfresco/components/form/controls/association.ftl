<#include "common/picker.inc.ftl" />

<#assign controlId = fieldHtmlId + "-cntrl">
<script type="text/javascript">//<![CDATA[
var _workflowPicker=null;
(function()
{
   <@renderPickerJS field "picker" />
   picker.setOptions(
   {
   <#if field.control.params.showTargetLink??>
      showLinkToTarget: ${field.control.params.showTargetLink},
      <#if page?? && page.url.templateArgs.site??>
         targetLinkTemplate: "${url.context}/page/site/${page.url.templateArgs.site!""}/document-details?nodeRef={nodeRef}",
      <#else>
         targetLinkTemplate: "${url.context}/page/document-details?nodeRef={nodeRef}",
      </#if>
   </#if>
   <#if field.control.params.allowNavigationToContentChildren??>
      allowNavigationToContentChildren: ${field.control.params.allowNavigationToContentChildren},
   </#if>
      itemType: "${field.endpointType}",
      multipleSelectMode: ${field.endpointMany?string},
      parentNodeRef: "alfresco://company/home",
   <#if field.control.params.rootNode??>
      rootNode: "${field.control.params.rootNode}",
   </#if>
      itemFamily: "node",
      displayMode: "${field.control.params.displayMode!"items"}"
   });
   _workflowPicker=picker;
})();
//]]></script>
<#if field.control.params.allowUpload?? && field.control.params.allowUpload == "true">
<script type="text/javascript">//<![CDATA[
			var wfaUpload=null;
			require(["dojo/ready"], function(ready){
  				ready(function(){
				 	wfaUpload=new Alfresco.consulting.WorkflowUpload({"htmlid" :"${args.htmlid}", "picker" : _workflowPicker});
				});
			});

//]]</script>

</#if>
<div class="form-field stocorp-form-field">
   <#if form.mode == "view">
      <div id="${controlId}" class="viewmode-field">
         <#if (field.endpointMandatory!false || field.mandatory!false) && field.value == "">
            <span class="incomplete-warning"><img src="${url.context}/res/components/form/images/warning-16.png" title="${msg("form.field.incomplete")}" /><span>
         </#if>
         <span class="viewmode-label">${field.label?html}:</span>
         <span id="${controlId}-currentValueDisplay" class="viewmode-value current-values"></span>
      </div>
   <#else>
      <label for="${controlId}">${field.label?html}:<#if field.endpointMandatory!false || field.mandatory!false><span class="mandatory-indicator">${msg("form.required.fields.marker")}</span></#if></label>
      
      <div id="${controlId}" class="object-finder">
         
         <div id="${controlId}-currentValueDisplay" class="current-values"></div>
         
         <#if field.disabled == false>
            <input type="hidden" id="${fieldHtmlId}" name="-" value="${field.value?html}" />
            <input type="hidden" id="${controlId}-added" name="${field.name}_added" />
            <input type="hidden" id="${controlId}-removed" name="${field.name}_removed" />
            <div id="${controlId}-itemGroupActions" class="show-picker"></div>
         
            <@renderPickerHTML controlId />
         </#if>
      </div>
      <#if  field.control.params.allowUpload?? && field.control.params.allowUpload == "true" >
      
<span class="yui-button yui-push-button" id="${args.htmlid?html}-button-span" style="position:relative; top:-43px; left: 147px;">
   <span class="first-child"><button data-dojo-type="dijit.form.Button" id="${args.htmlid?html}-uploadusers-button" onclick="wfaUpload.onUpload(event);">Upload</button></span>
</span>
		
      </#if>
   </#if>
</div>


