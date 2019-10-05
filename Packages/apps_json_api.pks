CREATE or replace PACKAGE apps_json_api IS
  
  C_TYPE_STRING constant varchar2(15) := 'STRING';
  C_TYPE_OBJECT constant varchar2(15) := 'OBJECT';
  C_TYPE_ARRAY  constant varchar2(15) := 'ARRAY';

END apps_json_api;
/
