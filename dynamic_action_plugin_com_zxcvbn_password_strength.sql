set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>20749515040658038
,p_default_application_id=>590
,p_default_owner=>'SAMPLE'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_zxcvbn_password_strength
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(125803147681062188)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.ZXCVBN_PASSWORD_STRENGTH'
,p_display_name=>'Password Strength Estimator'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>'https://cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.2.0/zxcvbn.js'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function init',
'  (p_dynamic_action in apex_plugin.t_dynamic_action',
'  ,p_plugin         in apex_plugin.t_plugin)',
'  return apex_plugin.t_dynamic_action_render_result is',
'  l_result      apex_plugin.t_dynamic_action_render_result;',
'  l_too_short_msg varchar2(4000) := p_plugin.attribute_01;',
'  l_score_0_msg   varchar2(4000) := p_plugin.attribute_02;',
'  l_score_1_msg   varchar2(4000) := p_plugin.attribute_03;',
'  l_score_2_msg   varchar2(4000) := p_plugin.attribute_04;',
'  l_score_3_msg   varchar2(4000) := p_plugin.attribute_05;',
'  l_score_4_msg   varchar2(4000) := p_plugin.attribute_06;',
'  l_show_feedback_warning     varchar(1) := p_dynamic_action.attribute_01;',
'  l_show_feedback_suggestions varchar(1) := p_dynamic_action.attribute_02;',
'  l_minimum_password_length   varchar2(20) := p_dynamic_action.attribute_03;',
'begin',
'  apex_plugin_util.debug_dynamic_action',
'    (p_plugin         => p_plugin',
'    ,p_dynamic_action => p_dynamic_action);',
'  apex_javascript.add_library',
'    (p_name                  => ''password_estimator''',
'    ,p_directory             => p_plugin.file_prefix',
'    ,p_check_to_add_minified => true',
'    );',
'  apex_css.add_file',
'    (p_name                  => ''password_estimator''',
'    ,p_directory             => p_plugin.file_prefix);',
'  l_result.javascript_function := ''password_estimator.init'';',
'  l_result.attribute_01 := l_too_short_msg;',
'  l_result.attribute_02 := l_score_0_msg;',
'  l_result.attribute_03 := l_score_1_msg;',
'  l_result.attribute_04 := l_score_2_msg;',
'  l_result.attribute_05 := l_score_3_msg;',
'  l_result.attribute_06 := l_score_4_msg;',
'  l_result.attribute_07 := l_show_feedback_warning;',
'  l_result.attribute_08 := l_show_feedback_suggestions;',
'  l_result.attribute_09 := l_minimum_password_length;',
'  return l_result;',
'end init;'))
,p_render_function=>'init'
,p_standard_attributes=>'ITEM:JQUERY_SELECTOR:TRIGGERING_ELEMENT:REQUIRED'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'0.1'
,p_plugin_comment=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Plugin by Jeffrey Kemp',
'Based on the Low-Budget Password Strength Estimator (zxcvbn) https://github.com/dropbox/zxcvbn'))
,p_files_version=>18
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125811752812324948)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Too Short message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Please enter more characters'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125812817116326988)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Score 0 message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Very Poor'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125813707267328603)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Score 1 message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Poor'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125814672725330430)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Score 2 message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Weak'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125815508380331742)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Score 3 message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Good'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125816411321333215)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Score 4 message'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Strong'
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125817376926335672)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Show Feedback Warning'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125818249738337966)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Show Feedback Suggestions'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(125819284264390037)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Minimum Password Length'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'8'
,p_max_length=>3
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E70617373776F72642D737472656E6774682D73636F7265207B20666F6E742D7765696768743A626F6C643B206D617267696E2D6C6566743A31307078207D0A2E70617373776F72642D737472656E6774682D73636F72652D30207B20636F6C6F723A72';
wwv_flow_api.g_varchar2_table(2) := '65643B207D0A2E70617373776F72642D737472656E6774682D73636F72652D31207B20636F6C6F723A6F72616E67653B207D0A2E70617373776F72642D737472656E6774682D73636F72652D32207B20636F6C6F723A62726F776E3B207D0A2E70617373';
wwv_flow_api.g_varchar2_table(3) := '776F72642D737472656E6774682D73636F72652D33207B20636F6C6F723A626C75653B207D0A2E70617373776F72642D737472656E6774682D73636F72652D34207B20636F6C6F723A677265656E3B207D0A2E70617373776F72642D737472656E677468';
wwv_flow_api.g_varchar2_table(4) := '2D7761726E696E67207B20666F6E742D7374796C653A6974616C69633B20636F6C6F723A62726F776E207D0A2E70617373776F72642D737472656E6774682D73756767657374696F6E207B20666F6E742D7374796C653A6974616C69633B207D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(125803813514170129)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_file_name=>'password_estimator.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7661722070617373776F72645F657374696D61746F72203D207B0A0A6F6E5F696E707574203A2066756E6374696F6E2028652C206129207B0A20207661722076546F6F53686F72744D7367203D20612E61747472696275746530310A20202020202C7653';
wwv_flow_api.g_varchar2_table(2) := '686F77466565646261636B5761726E696E67203D20612E61747472696275746530370A20202020202C7653686F77466565646261636B53756767657374696F6E73203D20612E61747472696275746530380A20202020202C764D696E696D756D50617373';
wwv_flow_api.g_varchar2_table(3) := '776F72644C656E677468203D207061727365496E7428612E6174747269627574653039293B0A202076617220737472656E677468203D207B0A20202020303A20612E61747472696275746530322C0A20202020313A20612E61747472696275746530332C';
wwv_flow_api.g_varchar2_table(4) := '0A20202020323A20612E61747472696275746530342C0A20202020333A20612E61747472696275746530352C0A20202020343A20612E61747472696275746530360A20207D0A202076617220746869734964203D202428652E746172676574292E617474';
wwv_flow_api.g_varchar2_table(5) := '722822696422290A20202020202C7265734964203D207468697349642B225F76657264696374220A20202020202C76616C203D2024282223222B746869734964292E76616C28290A20202020202C726573756C740A20202020202C76657264696374203D';
wwv_flow_api.g_varchar2_table(6) := '2022223B0A2020617065782E6465627567282270617373776F72645F657374696D61746F723A206F6E5F6368616E67652022202B207265734964293B0A20206966202876616C20213D3D20222229207B0A202020206966202876616C2E6C656E67746820';
wwv_flow_api.g_varchar2_table(7) := '3C20764D696E696D756D50617373776F72644C656E67746829207B0A20202020202076657264696374203D20273C7370616E20636C6173733D2270617373776F72642D737472656E6774682D7761726E696E67223E270A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(8) := '202B2076546F6F53686F72744D73670A20202020202020202020202020202B20273C2F7370616E3E273B0A202020207D20656C7365207B0A202020202020726573756C74203D207A786376626E2876616C293B0A20202020202076657264696374203D20';
wwv_flow_api.g_varchar2_table(9) := '273C7370616E20636C6173733D2270617373776F72642D737472656E6774682D73636F72652070617373776F72642D737472656E6774682D73636F72652D270A20202020202020202020202020202B20726573756C742E73636F72650A20202020202020';
wwv_flow_api.g_varchar2_table(10) := '202020202020202B2027223E270A20202020202020202020202020202B20737472656E6774685B726573756C742E73636F72655D0A20202020202020202020202020202B20273C2F7370616E3E273B0A20202020202069662028287653686F7746656564';
wwv_flow_api.g_varchar2_table(11) := '6261636B5761726E696E67203D3D20225922292026262028726573756C742E666565646261636B2E7761726E696E672929207B0A202020202020202076657264696374203D20766572646963740A202020202020202020202020202020202B20273C6469';
wwv_flow_api.g_varchar2_table(12) := '7620636C6173733D2270617373776F72642D737472656E6774682D7761726E696E67223E270A202020202020202020202020202020202B20726573756C742E666565646261636B2E7761726E696E670A202020202020202020202020202020202B20272E';
wwv_flow_api.g_varchar2_table(13) := '3C2F6469763E273B0A2020202020207D0A20202020202069662028287653686F77466565646261636B53756767657374696F6E73203D3D20225922292026262028726573756C742E666565646261636B2E73756767657374696F6E732929207B0A202020';
wwv_flow_api.g_varchar2_table(14) := '202020202076657264696374203D20766572646963740A202020202020202020202020202020202B20273C64697620636C6173733D2270617373776F72642D737472656E6774682D73756767657374696F6E223E270A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(15) := '20202B20726573756C742E666565646261636B2E73756767657374696F6E730A202020202020202020202020202020202B20273C2F6469763E273B0A2020202020207D0A202020207D0A20207D0A2020617065782E6465627567282270617373776F7264';
wwv_flow_api.g_varchar2_table(16) := '5F657374696D61746F723A20766572646963743D222B76657264696374293B0A202024282223222B7265734964292E68746D6C2876657264696374293B0A7D2C0A0A696E6974203A2066756E6374696F6E2829207B0A202076617220646154686973203D';
wwv_flow_api.g_varchar2_table(17) := '20746869730A20202020202C76456C656D656E74734172726179203D206461546869732E6166666563746564456C656D656E74733B0A2020617065782E6465627567282770617373776F72645F657374696D61746F723A206166666563746564456C656D';
wwv_flow_api.g_varchar2_table(18) := '656E74733A27202B2076456C656D656E747341727261792E6C656E677468293B0A2020666F7220287661722069203D20303B2069203C2076456C656D656E747341727261792E6C656E6774683B20692B2B29207B0A202020207661722076616666656374';
wwv_flow_api.g_varchar2_table(19) := '6564456C656D656E74203D206461546869732E6166666563746564456C656D656E74732E65712869290A202020202020202C746869734964203D202428766166666563746564456C656D656E74292E617474722822696422293B0A20202020617065782E';
wwv_flow_api.g_varchar2_table(20) := '6465627567282270617373776F72645F657374696D61746F723A20616464696E6720726573756C74207370616E2022202B20746869734964293B0A20202020766172207265734964203D207468697349642B225F76657264696374223B0A202020202428';
wwv_flow_api.g_varchar2_table(21) := '766166666563746564456C656D656E74292E616674657228223C7370616E20636C6173733D2770617373776F72645F657374696D61746F72272069643D27222B72657349642B22273E3C2F7370616E3E22293B0A20202020766172206974656D203D2064';
wwv_flow_api.g_varchar2_table(22) := '6F63756D656E742E676574456C656D656E744279496428746869734964293B0A202020206974656D2E6164644576656E744C697374656E65722827696E707574272C2066756E6374696F6E286529207B0A20202020202070617373776F72645F65737469';
wwv_flow_api.g_varchar2_table(23) := '6D61746F722E6F6E5F696E70757428652C206461546869732E616374696F6E293B0A202020207D293B0A20207D0A7D0A0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(125804236605170623)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_file_name=>'password_estimator.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7661722070617373776F72645F657374696D61746F723D7B6F6E5F696E7075743A66756E6374696F6E28742C65297B76617220612C733D652E61747472696275746530312C723D652E61747472696275746530372C6E3D652E6174747269627574653038';
wwv_flow_api.g_varchar2_table(2) := '2C693D7061727365496E7428652E6174747269627574653039292C643D7B303A652E61747472696275746530322C313A652E61747472696275746530332C323A652E61747472696275746530342C333A652E61747472696275746530352C343A652E6174';
wwv_flow_api.g_varchar2_table(3) := '7472696275746530367D2C6F3D2428742E746172676574292E617474722822696422292C703D6F2B225F76657264696374222C633D24282223222B6F292E76616C28292C673D22223B617065782E6465627567282270617373776F72645F657374696D61';
wwv_flow_api.g_varchar2_table(4) := '746F723A206F6E5F6368616E676520222B70292C2222213D3D63262628632E6C656E6774683C693F673D273C7370616E20636C6173733D2270617373776F72642D737472656E6774682D7761726E696E67223E272B732B223C2F7370616E3E223A28613D';
wwv_flow_api.g_varchar2_table(5) := '7A786376626E2863292C673D273C7370616E20636C6173733D2270617373776F72642D737472656E6774682D73636F72652070617373776F72642D737472656E6774682D73636F72652D272B612E73636F72652B27223E272B645B612E73636F72655D2B';
wwv_flow_api.g_varchar2_table(6) := '223C2F7370616E3E222C2259223D3D722626612E666565646261636B2E7761726E696E67262628673D672B273C64697620636C6173733D2270617373776F72642D737472656E6774682D7761726E696E67223E272B612E666565646261636B2E7761726E';
wwv_flow_api.g_varchar2_table(7) := '696E672B222E3C2F6469763E22292C2259223D3D6E2626612E666565646261636B2E73756767657374696F6E73262628673D672B273C64697620636C6173733D2270617373776F72642D737472656E6774682D73756767657374696F6E223E272B612E66';
wwv_flow_api.g_varchar2_table(8) := '6565646261636B2E73756767657374696F6E732B223C2F6469763E222929292C617065782E6465627567282270617373776F72645F657374696D61746F723A20766572646963743D222B67292C24282223222B70292E68746D6C2867297D2C696E69743A';
wwv_flow_api.g_varchar2_table(9) := '66756E6374696F6E28297B76617220743D746869732C653D742E6166666563746564456C656D656E74733B617065782E6465627567282270617373776F72645F657374696D61746F723A206166666563746564456C656D656E74733A222B652E6C656E67';
wwv_flow_api.g_varchar2_table(10) := '7468293B666F722876617220613D303B613C652E6C656E6774683B612B2B297B76617220733D742E6166666563746564456C656D656E74732E65712861292C723D242873292E617474722822696422293B617065782E6465627567282270617373776F72';
wwv_flow_api.g_varchar2_table(11) := '645F657374696D61746F723A20616464696E6720726573756C74207370616E20222B72293B766172206E3D722B225F76657264696374223B242873292E616674657228223C7370616E20636C6173733D2770617373776F72645F657374696D61746F7227';
wwv_flow_api.g_varchar2_table(12) := '2069643D27222B6E2B22273E3C2F7370616E3E22293B76617220693D646F63756D656E742E676574456C656D656E74427949642872293B692E6164644576656E744C697374656E65722822696E707574222C66756E6374696F6E2865297B70617373776F';
wwv_flow_api.g_varchar2_table(13) := '72645F657374696D61746F722E6F6E5F696E70757428652C742E616374696F6E297D297D7D7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(125831783995673042)
,p_plugin_id=>wwv_flow_api.id(125803147681062188)
,p_file_name=>'password_estimator.min.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done